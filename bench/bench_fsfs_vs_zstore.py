#!/usr/bin/env python3
"""Benchmark FSFS vs the zstore (S3) backend.

Run inside the cloud VM after RustFS is up and a 120-revision dump exists at
/tmp/load.dump (see README "性能" section for how it is produced).

Reports both absolute times and the paired delta against FSFS, because this
VM's process-spawn cost swings between 0.4 s and 3 s depending on load.
"""
import os, shutil, subprocess, time

S = "/home/user/myproject/svn-zig/subversion"
SVN, ADM, SRV = f"{S}/svn/.libs/svn", f"{S}/svnadmin/.libs/svnadmin", f"{S}/svnserve/.libs/svnserve"
HERE = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.dirname(HERE)
LIBS = subprocess.run(["bash", "-c", f"find {S} -maxdepth 2 -name .libs -type d | tr '\\n' ':'"],
                      capture_output=True, text=True).stdout.strip()
ENV = dict(os.environ, LD_LIBRARY_PATH=LIBS + os.path.join(REPO, "zig-out/lib"))
DUMP = "/tmp/load.dump"

def run(args, **kw):
    t0 = time.perf_counter()
    r = subprocess.run(args, env=ENV, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, **kw)
    return (time.perf_counter() - t0) * 1000, r.returncode

def best(args, n=3):
    return min(run(args)[0] for _ in range(n))

def fresh(fs_type, path):
    shutil.rmtree(path, ignore_errors=True)
    run([ADM, "create", "--fs-type", fs_type, path])
    if fs_type == "zstore":
        conf = f"{path}/db/zstore.conf"
        open(conf, "w").write(open(conf).read().replace(":9000", ":9100"))

rows = []
def rec(op, fs, zs):
    rows.append((op, fs, zs, zs - fs))

# --- svnadmin load: 120 revisions ---
if os.path.exists(DUMP):
    vals = {"fsfs": [], "zstore": []}
    for i in range(2):
        for tag, t in (("fsfs", "fsfs"), ("zstore", "zstore")):
            p = f"/tmp/perf_{tag}"
            fresh(t, p)
            with open(DUMP, "rb") as f:
                t0 = time.perf_counter()
                subprocess.run([ADM, "load", "-q", p], stdin=f, env=ENV,
                               stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
                vals[tag].append((time.perf_counter() - t0) * 1000)
    rec("load 120 rev", min(vals["fsfs"]), min(vals["zstore"]))
    fs_p, zs_p = "/tmp/perf_fsfs", "/tmp/perf_zstore"

    # --- svnadmin verify / dump ---
    rec("verify 120 rev", best([ADM, "verify", fs_p], 2), best([ADM, "verify", zs_p], 2))
    with open("/tmp/perf_d_fs", "wb") as f:
        t0 = time.perf_counter()
        subprocess.run([ADM, "dump", "-q", fs_p], stdout=f, env=ENV, stderr=subprocess.DEVNULL)
        rec("dump 120 rev", (time.perf_counter() - t0) * 1000, 0)
    with open("/tmp/perf_d_zs", "wb") as f:
        t0 = time.perf_counter()
        subprocess.run([ADM, "dump", "-q", zs_p], stdout=f, env=ENV, stderr=subprocess.DEVNULL)
        rows[-1] = (rows[-1][0], rows[-1][1], (time.perf_counter() - t0) * 1000,
                    rows[-1][2] - rows[-1][1])
else:
    fs_p, zs_p = "/tmp/BFS", "/tmp/BZS"

# --- server path: svnserve keeps the fs open, so this measures per-op work ---
srv = subprocess.Popen([SRV, "-d", "--foreground", "-r", "/tmp", "--listen-port", "3690"],
                       env=ENV, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
time.sleep(2)
try:
    U = {"fsfs": "svn://127.0.0.1:3690/" + os.path.basename(fs_p),
         "zstore": "svn://127.0.0.1:3690/" + os.path.basename(zs_p)}
    for op, args, sub in (("info", ["info"], ""), ("log 120 rev", ["log"], ""),
                          ("log -v", ["log", "-v"], ""), ("ls -R", ["ls", "-R"], "/trunk"),
                          ("cat 1 file", ["cat"], "/trunk/f1.txt"),
                          ("blame 1 file", ["blame"], "/trunk/f1.txt")):
        rec(op, best([SVN] + args + [U["fsfs"] + sub]), best([SVN] + args + [U["zstore"] + sub]))

    for tag in ("fsfs", "zstore"):
        shutil.rmtree(f"/tmp/perf_wc_{tag}", ignore_errors=True)
        run([SVN, "co", U[tag] + "/trunk", f"/tmp/perf_wc_{tag}"])
    # 400 files in one revision
    os.makedirs("/tmp/perf_bulk", exist_ok=True)
    for i in range(400):
        open(f"/tmp/perf_bulk/f{i:03d}.txt", "w").write(f"bulk {i}\n")
    for tag in ("fsfs", "zstore"):
        shutil.copytree("/tmp/perf_bulk", f"/tmp/perf_wc_{tag}/bulk", dirs_exist_ok=True)
        run([SVN, "add", "-q", f"/tmp/perf_wc_{tag}/bulk"])
    rec("commit 400 files", run([SVN, "ci", "-q", "-m", "bulk fsfs", "/tmp/perf_wc_fsfs"])[0],
        run([SVN, "ci", "-q", "-m", "bulk zstore", "/tmp/perf_wc_zstore"])[0])

    for tag in ("fsfs", "zstore"):
        shutil.rmtree(f"/tmp/perf_big_{tag}", ignore_errors=True)
    rec("co 520 files", best([SVN, "co", "-q", U["fsfs"] + "/trunk", "/tmp/perf_big_fsfs"], 2),
        best([SVN, "co", "-q", U["zstore"] + "/trunk", "/tmp/perf_big_zstore"], 2))
finally:
    srv.terminate()

w = max(len(r[0]) for r in rows) + 2
print(f"{'operation':<{w}}{'FSFS ms':>10}{'zstore ms':>12}{'delta ms':>11}{'x':>7}")
for op, fs, zs, d in rows:
    x = f"{zs / fs:.1f}x" if fs else "-"
    print(f"{op:<{w}}{fs:>10.0f}{zs:>12.0f}{d:>+11.0f}{x:>7}")
