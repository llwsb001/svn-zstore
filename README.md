# svn_fs_zstore — 用 Zig 写的 Subversion FS 后端，把仓库存到 S3 兼容对象存储

替换 Apache Subversion（trunk）的 `svn_fs` 后端：revision 数据（目录树快照 + 文件内容）落到
S3/MinIO 这类对象存储，本地仓库目录 `db/` 只保留极小配置与标记文件。

- SVN 侧：subversion trunk 用 `--enable-runtime-module-search` 编译，通过 DSO 加载本模块
- Zig 侧：Zig 0.17.0，产出 `libsvn_fs_zstore-1.so.0`，fs-type 字符串 `zstore`
- 存储侧：SigV4 + libcurl 手写 S3 客户端（无 SDK 依赖）

## 目录

```
build.zig              动态库构建，安装到 zig-out/lib/libsvn_fs_zstore-1.so.0
src/c.h                translate-c 聚合头（apr + svn + curl）
src/svn_bindings.zig   zig translate-c 生成的 SVN/APR 绑定（7256 行）
src/curl_bindings.zig  同样方式生成的 libcurl 绑定
src/s3.zig             S3 客户端：putObject / getObject / exists / delete，SigV4 签名
src/store.zig          对象模型与编解码（tree / props / rev / HEAD）
src/fs.zig             fs 级 vtable、library vtable、init/create/open、配置解析
src/backend.zig        txn / root / changes-iterator / history / id 的全部 vtable 实现
src/root.zig           模块根（导出 svn_fs_zstore__init）
src/test_root.zig      单测根（store 编解码，`zig build test`）
```

Zig 0.17 已移除 `@cImport`，因此绑定全部由 `zig translate-c` 生成后再手写少量适配。

## 对象布局

桶内前缀默认取 `db/uuid`，可用 `ZSTORE_PREFIX` / `db/zstore.conf` 覆盖：

```
<prefix>/format                     zstore/1\n
<prefix>/HEAD                       rev=<n>\nroot=<sha256>\n
<prefix>/revs/<n>                   rev=/parent=/root=/props=      （props 是 blob key）
<prefix>/trees/<sha256>             目录树快照
<prefix>/blobs/<sha256>             文件内容 / props 编码块
```

- tree 编码：`"ZST" + ver(u8) + count(u32 BE)`，每条目依次
  `name(str) kind(u8: dir=0 file=1) size(u64) created_rev(i64) created_path(str) props(str) copyfrom_rev(i64) copyfrom_path(str) key(str)`，
  `str` = `u32 BE len + bytes`
- props 编码：`u32 BE count + (name,value)*`，解码后字符串必须 NUL 结尾（apr hash key 与 `svnadmin dump` 都用 C 字符串）

`HEAD` 用条件写（ETag + `If-Match`）更新，revision 号用 `If-None-Match: *` 抢占；
事务基线不等于 HEAD 时提交被拒（`E160028`），不会静默覆盖别人的提交。

## 构建与运行

```bash
# 1) 编后端
cd svn-s3 && zig build
ls zig-out/lib/libsvn_fs_zstore-1.so.0

# 2) 编 SVN（只需一次；关键开关是 runtime module search）
./configure --prefix=$PWD/install --enable-runtime-module-search
make -j4

# 3) 运行环境
SVN=/home/user/myproject/svn-zig
LP=$(find $SVN/subversion -maxdepth 2 -name .libs -type d | tr '\n' ':')
export LD_LIBRARY_PATH="$LP$PWD/zig-out/lib"

# 4) 用
svnadmin create --fs-type=zstore /tmp/R
svn import -m r1 /tmp/imp3 file:///tmp/R
svn co file:///tmp/R /tmp/wcR
```

`db/zstore.conf`（`key=value`）：`endpoint` / `region` / `bucket` / `access_key` / `secret_key` / `prefix`，
同名环境变量 `ZSTORE_ENDPOINT` 等优先级更高。

## 已验证能力

| 操作 | 状态 |
| --- | --- |
| `svn ls` / `ls -R` / `ls -r<N>` | ✅ |
| `svn cat` / `cat -r<N>` | ✅ |
| `svn log` / `log -v` / 路径定向 `log` | ✅ 含 `svn:date`、author、msg |
| `svn diff -r1:2` | ✅ |
| `svn co` / `ci` / `up` / `export` | ✅ |
| `svn blame` | ✅ 逐行归属正确（跨 revision） |
| `svnadmin create --fs-type=zstore` | ✅ |
| `svnadmin verify` | ✅ |
| `svnadmin dump` / `load` | ✅ 往返一致（含 changed paths） |
| `svn://`（svnserve）：ls / co / ci / blame | ✅ |
| 锁（lock/unlock/get-locks）| ✅ 对象存 `locks/<sha256(path)>`，含 token / 注释 / 过期时间 |
| `svnadmin hotcopy` | ✅ 服务端 CopyObject 复制前缀，目标自动分配独立前缀并写入 `prefix=` |
| `svnadmin recover` | ✅ 列举 `revs/*` 取最大可用 revision 并重建 `HEAD` |
| `svnadmin pack` | ✅ no-op（内容寻址天然去重，无碎片可合） |
| 事务 `txns` | ✅ 每次修改 checkpoint 到 `txns/<id>`；`svnadmin lstxns` / `rmtxns` 可用，崩溃后可重开 |

## 调试期踩过的主要坑（保留备查）

1. `svn_fs_dir_entries` 的 hash value 必须是 `svn_fs_dirent_t*`（name/id/kind），不是 `svn_node_kind_t*`
2. `arts_hash_first(NULL, ht)` 传 NULL pool 返回空数组 → checkout 目录子项全丢
3. 事务回调收到的是**相对路径**（`trunk/a.txt`），树缓存键是 `/trunk/a.txt` → 归一化必须强制前导 `/`
4. `svn_txdelta_run` 不能在 `next_window` 回调里跑，须先整体算好 delta 再出队
5. `get_file_delta_stream` 对新文件 `source_path` 为 NULL，`std.mem.span(null)` 会 panic
6. `refresh_revprops` 槽不能留 null，loader 无条件调用
7. `rev` 记录里的 `props=` 是 blob key，读取要先 `loadBlob` 再解码
8. `svn:date` 必须后端在 commit 时补（用 `apr_time_now()`，别用自增计数器）
9. 所有交给 C 的字符串（URL / Host / x-amz-date / prop name / value / dirent name）必须 NUL 结尾
10. libcurl 句柄跨请求会残留 `CUSTOMREQUEST` / `POSTFIELDS` / `NOBODY`，每请求开头清空，否则 GET 被当第二次 PUT 把对象写成空
11. changed paths 必须以 `/` 开头且 NUL 结尾；否则 `svn log -v` 丢前导斜杠、路径定向 log 漏掉修改版本
12. `svn_fs_node_id` 不能编码 revision（否则 rev_hunt 认为跨版本节点无关）；`node_relation` 同路径不同内容要返回 `common_ancestor` 而非 `unrelated`，否则 `svn ls -r<N>` 报 "Unable to find repository location"
13. `history_prev` 第一次要先把当前点返回一次，否则路径定向 log 与 blame 会跳过最新一次修改

## 真实 S3 后端：RustFS（已实测跑通）

RustFS 是 Rust 写的 S3 兼容对象存储，单二进制 378 MB，解压即用；**默认只支持 path-style 寻址**，
正好与我们的客户端一致，所以换后端只需改 endpoint，代码零改动。

```bash
# 下载 rustfs-linux-x86_64-gnu-v1.0.6.zip（github.com/rustfs/rustfs/releases）
mkdir -p /tmp/rustfs-data
RUSTFS_VOLUMES=/tmp/rustfs-data RUSTFS_ADDRESS=":9100" \
RUSTFS_ACCESS_KEY="zstore" RUSTFS_SECRET_KEY="zstore" \
RUSTFS_CONSOLE_ENABLE=false ./rustfs server /tmp/rustfs-data

# 建桶（path-style）
python3 -c "import boto3;from botocore.config import Config;\
s3=boto3.client('s3',endpoint_url='http://127.0.0.1:9100',aws_access_key_id='zstore',\
aws_secret_access_key='zstore',region_name='us-east-1',\
config=Config(s3={'addressing_style':'path'}));s3.create_bucket(Bucket='svn')"
```

仓库侧只要 `db/zstore.conf`：

```
endpoint=http://127.0.0.1:9100
region=us-east-1
bucket=svn
access_key=zstore
secret_key=zstore
```

实测结果（`/tmp/RS`，uuid `910742a1-…`）：

| 项 | 结果 |
| --- | --- |
| `import` / `co` / `ci` | ✅ |
| `ls` / `log` / `blame` | ✅ blame 逐行 `1 hello / 2 more` |
| `svnadmin verify` | ✅ |
| `dump` → `load` | ✅ `trunk/a.txt b.txt` |
| `svn://`（svnserve）| ✅ ls + blame |
| 桶内对象 | 15 个（`format` / `HEAD` / `revs/*` / `trees/*` / `blobs/*`），`db/` 只剩 4 个几字节小文件 |
| 重启 RustFS 后读旧仓库 | ✅ 数据持久（对比 moto 是内存态、重启即丢） |

注意事项：默认凭据 `rustfsadmin`/`rustfsadmin`，务必用 `RUSTFS_ACCESS_KEY/SECRET_KEY` 覆盖；
控制台 9001、API 9000（本机与 moto 共存时改用 9100）；若客户端用 virtual-hosted 风格需设
`RUSTFS_SERVER_DOMAINS`，否则只能 path-style。

## 测试环境

- Ubuntu 22.04，apt 已换清华源；`libapr1-dev` 1.7.0 / `libaprutil1-dev` / `libsqlite3-dev` / `libserf-dev`
- mock：`pip install "moto[server]"`，`moto_server -p 9000 -H 127.0.0.1`，bucket `svn`（内存态）
- 真实候选：RustFS 1.0.6（已在 `/home/user/tools/rustfs/`，端口 9100，数据在 `/tmp/rustfs-data`）
- MinIO 官方二进制 `dl.min.io` 已 410、SeaweedFS release zip 无效

## 并发、锁与运维（本轮新增）

**提交原子性**：`revs/<n>` 用 `If-None-Match: *` 抢号，`HEAD` 用 `If-Match: <etag>` 更新；
抢号失败或被别人先更新 HEAD 时不重试覆盖，而是回滚刚写的 `revs/<n>` 并返回
`E160028 transaction base rN is out of date (HEAD is rM)`。因此多客户端并发提交**不会丢更新**，
语义等价于 FSFS 的冲突拒绝（尚未做三方合并，disjoint 路径的并发提交也需要 update 后重试）。

**锁**：`locks/<sha256(path)>` 单对象保存 `path/token/owner/comment/created/expires/dav`；
创建用条件写防重复，`unlock` 校验 token（`--force` 走 break）；`svnadmin lslocks` 与
`svn info` 均验证通过（file:// 与 svn:// 均可，svn:// 需 `anon-access=write`）。

**hotcopy**：`fs_library_vtable_t.hotcopy` 拿到的 src/dst 都是未打开的 `fs_new()` 壳，
因此按 `db` 路径重建两个 S3 client；逐对象 `x-amz-copy-source` 服务端复制。
repos 层会复制 `db/uuid`，两边同 uuid 会撞 key，故目标自动分配
`<src-prefix>-hotcopy-<ts>` 并写回 `db/zstore.conf` 的 `prefix=`。实测 31 对象、
目标仓库 `verify`/`log`/`ls` 与独立提交（r4）均通过，源仓库仍停在 r3。

**recover**：`HEAD` 缺失或指向不存在/不可用的 `trees/<sha>` 时，倒序扫描 `revs/*`
取第一个 root 树存在的 revision 重写 `HEAD`。实测删掉 `HEAD` 后 `recover` 恢复 r4。

**pack**：对象不可变且按内容寻址（同目录/同内容共享 key），没有需要合并的碎片，
返回 no-op 并打日志。

**事务持久化**：`fBeginTxn` 写 `txns/<id>`，每次结构变更（建/删/拷/改属性/写文本）
打 checkpoint（flush 根树 + 更新 txn 记录）；提交成功或 abort 时删除记录。
已用 `svnadmin lstxns` / `rmtxns` 验证列举与清除（伪造 `txns/ztest-1` 可被列出并删除）。
