const __root = @This();
pub const __builtin = @import("std").zig.c_translation.builtins;
pub const __helpers = @import("std").zig.c_translation.helpers;
pub const __u_char = u8;
pub const __u_short = c_ushort;
pub const __u_int = c_uint;
pub const __u_long = c_ulong;
pub const __int8_t = i8;
pub const __uint8_t = u8;
pub const __int16_t = c_short;
pub const __uint16_t = c_ushort;
pub const __int32_t = c_int;
pub const __uint32_t = c_uint;
pub const __int64_t = c_long;
pub const __uint64_t = c_ulong;
pub const __int_least8_t = __int8_t;
pub const __uint_least8_t = __uint8_t;
pub const __int_least16_t = __int16_t;
pub const __uint_least16_t = __uint16_t;
pub const __int_least32_t = __int32_t;
pub const __uint_least32_t = __uint32_t;
pub const __int_least64_t = __int64_t;
pub const __uint_least64_t = __uint64_t;
pub const __quad_t = c_long;
pub const __u_quad_t = c_ulong;
pub const __intmax_t = c_long;
pub const __uintmax_t = c_ulong;
pub const __dev_t = c_ulong;
pub const __uid_t = c_uint;
pub const __gid_t = c_uint;
pub const __ino_t = c_ulong;
pub const __ino64_t = c_ulong;
pub const __mode_t = c_uint;
pub const __nlink_t = c_ulong;
pub const __off_t = c_long;
pub const __off64_t = c_long;
pub const __pid_t = c_int;
pub const __fsid_t = extern struct {
    __val: [2]c_int = @import("std").mem.zeroes([2]c_int),
};
pub const __clock_t = c_long;
pub const __rlim_t = c_ulong;
pub const __rlim64_t = c_ulong;
pub const __id_t = c_uint;
pub const __time_t = c_long;
pub const __useconds_t = c_uint;
pub const __suseconds_t = c_long;
pub const __suseconds64_t = c_long;
pub const __daddr_t = c_int;
pub const __key_t = c_int;
pub const __clockid_t = c_int;
pub const __timer_t = ?*anyopaque;
pub const __blksize_t = c_long;
pub const __blkcnt_t = c_long;
pub const __blkcnt64_t = c_long;
pub const __fsblkcnt_t = c_ulong;
pub const __fsblkcnt64_t = c_ulong;
pub const __fsfilcnt_t = c_ulong;
pub const __fsfilcnt64_t = c_ulong;
pub const __fsword_t = c_long;
pub const __ssize_t = c_long;
pub const __syscall_slong_t = c_long;
pub const __syscall_ulong_t = c_ulong;
pub const __loff_t = __off64_t;
pub const __caddr_t = [*c]u8;
pub const __intptr_t = c_long;
pub const __socklen_t = c_uint;
pub const __sig_atomic_t = c_int;
pub const u_char = __u_char;
pub const u_short = __u_short;
pub const u_int = __u_int;
pub const u_long = __u_long;
pub const quad_t = __quad_t;
pub const u_quad_t = __u_quad_t;
pub const fsid_t = __fsid_t;
pub const loff_t = __loff_t;
pub const ino_t = __ino_t;
pub const dev_t = __dev_t;
pub const gid_t = __gid_t;
pub const mode_t = __mode_t;
pub const nlink_t = __nlink_t;
pub const uid_t = __uid_t;
pub const off_t = __off_t;
pub const pid_t = __pid_t;
pub const id_t = __id_t;
pub const daddr_t = __daddr_t;
pub const caddr_t = __caddr_t;
pub const key_t = __key_t;
pub const clock_t = __clock_t;
pub const clockid_t = __clockid_t;
pub const time_t = __time_t;
pub const timer_t = __timer_t;
pub const ptrdiff_t = c_long;
pub const wchar_t = c_int;
pub const max_align_t = extern struct {
    __aro_max_align_ll: c_longlong = 0,
    __aro_max_align_ld: c_longdouble = 0,
};
pub const ulong = c_ulong;
pub const ushort = c_ushort;
pub const uint = c_uint;
pub const u_int8_t = __uint8_t;
pub const u_int16_t = __uint16_t;
pub const u_int32_t = __uint32_t;
pub const u_int64_t = __uint64_t;
pub const register_t = c_int;
pub fn __bswap_16(arg___bsx: __uint16_t) callconv(.c) __uint16_t {
    var __bsx = arg___bsx;
    _ = &__bsx;
    return @byteSwap(@as(__uint16_t, __bsx));
}
pub fn __bswap_32(arg___bsx: __uint32_t) callconv(.c) __uint32_t {
    var __bsx = arg___bsx;
    _ = &__bsx;
    return @byteSwap(@as(__uint32_t, __bsx));
}
pub fn __bswap_64(arg___bsx: __uint64_t) callconv(.c) __uint64_t {
    var __bsx = arg___bsx;
    _ = &__bsx;
    return @byteSwap(@as(__uint64_t, __bsx));
}
pub fn __uint16_identity(arg___x: __uint16_t) callconv(.c) __uint16_t {
    var __x = arg___x;
    _ = &__x;
    return __x;
}
pub fn __uint32_identity(arg___x: __uint32_t) callconv(.c) __uint32_t {
    var __x = arg___x;
    _ = &__x;
    return __x;
}
pub fn __uint64_identity(arg___x: __uint64_t) callconv(.c) __uint64_t {
    var __x = arg___x;
    _ = &__x;
    return __x;
}
pub const __sigset_t = extern struct {
    __val: [16]c_ulong = @import("std").mem.zeroes([16]c_ulong),
    pub const sigemptyset = __root.sigemptyset;
    pub const sigfillset = __root.sigfillset;
    pub const sigaddset = __root.sigaddset;
    pub const sigdelset = __root.sigdelset;
    pub const sigismember = __root.sigismember;
    pub const sigsuspend = __root.sigsuspend;
    pub const sigpending = __root.sigpending;
    pub const sigwait = __root.sigwait;
    pub const sigwaitinfo = __root.sigwaitinfo;
    pub const sigtimedwait = __root.sigtimedwait;
};
pub const sigset_t = __sigset_t;
pub const struct_timeval = extern struct {
    tv_sec: __time_t = 0,
    tv_usec: __suseconds_t = 0,
    pub const gettimeofday = __root.gettimeofday;
    pub const settimeofday = __root.settimeofday;
    pub const adjtime = __root.adjtime;
};
pub const struct_timespec = extern struct {
    tv_sec: __time_t = 0,
    tv_nsec: __syscall_slong_t = 0,
};
pub const suseconds_t = __suseconds_t;
pub const __fd_mask = c_long;
pub const fd_set = extern struct {
    __fds_bits: [16]__fd_mask = @import("std").mem.zeroes([16]__fd_mask),
};
pub const fd_mask = __fd_mask;
pub extern fn select(__nfds: c_int, noalias __readfds: [*c]fd_set, noalias __writefds: [*c]fd_set, noalias __exceptfds: [*c]fd_set, noalias __timeout: [*c]struct_timeval) c_int;
pub extern fn pselect(__nfds: c_int, noalias __readfds: [*c]fd_set, noalias __writefds: [*c]fd_set, noalias __exceptfds: [*c]fd_set, noalias __timeout: [*c]const struct_timespec, noalias __sigmask: [*c]const __sigset_t) c_int;
pub const blksize_t = __blksize_t;
pub const blkcnt_t = __blkcnt_t;
pub const fsblkcnt_t = __fsblkcnt_t;
pub const fsfilcnt_t = __fsfilcnt_t;
const struct_unnamed_1 = extern struct {
    __low: c_uint = 0,
    __high: c_uint = 0,
};
pub const __atomic_wide_counter = extern union {
    __value64: c_ulonglong,
    __value32: struct_unnamed_1,
};
pub const struct___pthread_internal_list = extern struct {
    __prev: [*c]struct___pthread_internal_list = null,
    __next: [*c]struct___pthread_internal_list = null,
};
pub const __pthread_list_t = struct___pthread_internal_list;
pub const struct___pthread_internal_slist = extern struct {
    __next: [*c]struct___pthread_internal_slist = null,
};
pub const __pthread_slist_t = struct___pthread_internal_slist;
pub const struct___pthread_mutex_s = extern struct {
    __lock: c_int = 0,
    __count: c_uint = 0,
    __owner: c_int = 0,
    __nusers: c_uint = 0,
    __kind: c_int = 0,
    __spins: c_short = 0,
    __elision: c_short = 0,
    __list: __pthread_list_t = @import("std").mem.zeroes(__pthread_list_t),
};
pub const struct___pthread_rwlock_arch_t = extern struct {
    __readers: c_uint = 0,
    __writers: c_uint = 0,
    __wrphase_futex: c_uint = 0,
    __writers_futex: c_uint = 0,
    __pad3: c_uint = 0,
    __pad4: c_uint = 0,
    __cur_writer: c_int = 0,
    __shared: c_int = 0,
    __rwelision: i8 = 0,
    __pad1: [7]u8 = @import("std").mem.zeroes([7]u8),
    __pad2: c_ulong = 0,
    __flags: c_uint = 0,
};
pub const struct___pthread_cond_s = extern struct {
    __wseq: __atomic_wide_counter = @import("std").mem.zeroes(__atomic_wide_counter),
    __g1_start: __atomic_wide_counter = @import("std").mem.zeroes(__atomic_wide_counter),
    __g_refs: [2]c_uint = @import("std").mem.zeroes([2]c_uint),
    __g_size: [2]c_uint = @import("std").mem.zeroes([2]c_uint),
    __g1_orig_size: c_uint = 0,
    __wrefs: c_uint = 0,
    __g_signals: [2]c_uint = @import("std").mem.zeroes([2]c_uint),
};
pub const __tss_t = c_uint;
pub const __thrd_t = c_ulong;
pub const __once_flag = extern struct {
    __data: c_int = 0,
};
pub const pthread_t = c_ulong;
pub const pthread_mutexattr_t = extern union {
    __size: [4]u8,
    __align: c_int,
};
pub const pthread_condattr_t = extern union {
    __size: [4]u8,
    __align: c_int,
};
pub const pthread_key_t = c_uint;
pub const pthread_once_t = c_int;
pub const union_pthread_attr_t = extern union {
    __size: [56]u8,
    __align: c_long,
};
pub const pthread_attr_t = union_pthread_attr_t;
pub const pthread_mutex_t = extern union {
    __data: struct___pthread_mutex_s,
    __size: [40]u8,
    __align: c_long,
};
pub const pthread_cond_t = extern union {
    __data: struct___pthread_cond_s,
    __size: [48]u8,
    __align: c_longlong,
};
pub const pthread_rwlock_t = extern union {
    __data: struct___pthread_rwlock_arch_t,
    __size: [56]u8,
    __align: c_long,
};
pub const pthread_rwlockattr_t = extern union {
    __size: [8]u8,
    __align: c_long,
};
pub const pthread_spinlock_t = c_int;
pub const pthread_barrier_t = extern union {
    __size: [32]u8,
    __align: c_long,
};
pub const pthread_barrierattr_t = extern union {
    __size: [4]u8,
    __align: c_int,
};
pub const struct_iovec = extern struct {
    iov_base: ?*anyopaque = null,
    iov_len: usize = 0,
};
pub const socklen_t = __socklen_t;
pub const SOCK_STREAM: c_int = 1;
pub const SOCK_DGRAM: c_int = 2;
pub const SOCK_RAW: c_int = 3;
pub const SOCK_RDM: c_int = 4;
pub const SOCK_SEQPACKET: c_int = 5;
pub const SOCK_DCCP: c_int = 6;
pub const SOCK_PACKET: c_int = 10;
pub const SOCK_CLOEXEC: c_int = 524288;
pub const SOCK_NONBLOCK: c_int = 2048;
pub const enum___socket_type = c_uint;
pub const sa_family_t = c_ushort;
pub const struct_sockaddr = extern struct {
    sa_family: sa_family_t = 0,
    sa_data: [14]u8 = @import("std").mem.zeroes([14]u8),
};
pub const struct_sockaddr_storage = extern struct {
    ss_family: sa_family_t = 0,
    __ss_padding: [118]u8 = @import("std").mem.zeroes([118]u8),
    __ss_align: c_ulong = 0,
};
pub const MSG_OOB: c_int = 1;
pub const MSG_PEEK: c_int = 2;
pub const MSG_DONTROUTE: c_int = 4;
pub const MSG_CTRUNC: c_int = 8;
pub const MSG_PROXY: c_int = 16;
pub const MSG_TRUNC: c_int = 32;
pub const MSG_DONTWAIT: c_int = 64;
pub const MSG_EOR: c_int = 128;
pub const MSG_WAITALL: c_int = 256;
pub const MSG_FIN: c_int = 512;
pub const MSG_SYN: c_int = 1024;
pub const MSG_CONFIRM: c_int = 2048;
pub const MSG_RST: c_int = 4096;
pub const MSG_ERRQUEUE: c_int = 8192;
pub const MSG_NOSIGNAL: c_int = 16384;
pub const MSG_MORE: c_int = 32768;
pub const MSG_WAITFORONE: c_int = 65536;
pub const MSG_BATCH: c_int = 262144;
pub const MSG_ZEROCOPY: c_int = 67108864;
pub const MSG_FASTOPEN: c_int = 536870912;
pub const MSG_CMSG_CLOEXEC: c_int = 1073741824;
const enum_unnamed_2 = c_uint;
pub const struct_msghdr = extern struct {
    msg_name: ?*anyopaque = null,
    msg_namelen: socklen_t = 0,
    msg_iov: [*c]struct_iovec = null,
    msg_iovlen: usize = 0,
    msg_control: ?*anyopaque = null,
    msg_controllen: usize = 0,
    msg_flags: c_int = 0,
    pub const __cmsg_nxthdr = __root.__cmsg_nxthdr;
    pub const nxthdr = __root.__cmsg_nxthdr;
};
pub const struct_cmsghdr = extern struct {
    cmsg_len: usize = 0,
    cmsg_level: c_int = 0,
    cmsg_type: c_int = 0,
    ___cmsg_data: [0]u8 = @import("std").mem.zeroes([0]u8),
    pub fn __cmsg_data(_self: anytype) __helpers.FlexibleArrayType(@TypeOf(_self), @typeInfo(@TypeOf(_self.*.___cmsg_data)).array.child) {
        return @ptrCast(@alignCast(&_self.*.___cmsg_data));
    }
};
pub extern fn __cmsg_nxthdr(__mhdr: [*c]struct_msghdr, __cmsg: [*c]struct_cmsghdr) [*c]struct_cmsghdr;
pub const SCM_RIGHTS: c_int = 1;
const enum_unnamed_3 = c_uint;
pub const __kernel_fd_set = extern struct {
    fds_bits: [16]c_ulong = @import("std").mem.zeroes([16]c_ulong),
};
pub const __kernel_sighandler_t = ?*const fn (c_int) callconv(.c) void;
pub const __kernel_key_t = c_int;
pub const __kernel_mqd_t = c_int;
pub const __kernel_old_uid_t = c_ushort;
pub const __kernel_old_gid_t = c_ushort;
pub const __kernel_old_dev_t = c_ulong;
pub const __kernel_long_t = c_long;
pub const __kernel_ulong_t = c_ulong;
pub const __kernel_ino_t = __kernel_ulong_t;
pub const __kernel_mode_t = c_uint;
pub const __kernel_pid_t = c_int;
pub const __kernel_ipc_pid_t = c_int;
pub const __kernel_uid_t = c_uint;
pub const __kernel_gid_t = c_uint;
pub const __kernel_suseconds_t = __kernel_long_t;
pub const __kernel_daddr_t = c_int;
pub const __kernel_uid32_t = c_uint;
pub const __kernel_gid32_t = c_uint;
pub const __kernel_size_t = __kernel_ulong_t;
pub const __kernel_ssize_t = __kernel_long_t;
pub const __kernel_ptrdiff_t = __kernel_long_t;
pub const __kernel_fsid_t = extern struct {
    val: [2]c_int = @import("std").mem.zeroes([2]c_int),
};
pub const __kernel_off_t = __kernel_long_t;
pub const __kernel_loff_t = c_longlong;
pub const __kernel_old_time_t = __kernel_long_t;
pub const __kernel_time_t = __kernel_long_t;
pub const __kernel_time64_t = c_longlong;
pub const __kernel_clock_t = __kernel_long_t;
pub const __kernel_timer_t = c_int;
pub const __kernel_clockid_t = c_int;
pub const __kernel_caddr_t = [*c]u8;
pub const __kernel_uid16_t = c_ushort;
pub const __kernel_gid16_t = c_ushort;
pub const struct_linger = extern struct {
    l_onoff: c_int = 0,
    l_linger: c_int = 0,
};
pub const struct_osockaddr = extern struct {
    sa_family: c_ushort = 0,
    sa_data: [14]u8 = @import("std").mem.zeroes([14]u8),
};
pub const SHUT_RD: c_int = 0;
pub const SHUT_WR: c_int = 1;
pub const SHUT_RDWR: c_int = 2;
const enum_unnamed_4 = c_uint;
pub extern fn socket(__domain: c_int, __type: c_int, __protocol: c_int) c_int;
pub extern fn socketpair(__domain: c_int, __type: c_int, __protocol: c_int, __fds: [*c]c_int) c_int;
pub extern fn bind(__fd: c_int, __addr: [*c]const struct_sockaddr, __len: socklen_t) c_int;
pub extern fn getsockname(__fd: c_int, noalias __addr: [*c]struct_sockaddr, noalias __len: [*c]socklen_t) c_int;
pub extern fn connect(__fd: c_int, __addr: [*c]const struct_sockaddr, __len: socklen_t) c_int;
pub extern fn getpeername(__fd: c_int, noalias __addr: [*c]struct_sockaddr, noalias __len: [*c]socklen_t) c_int;
pub extern fn send(__fd: c_int, __buf: ?*const anyopaque, __n: usize, __flags: c_int) isize;
pub extern fn recv(__fd: c_int, __buf: ?*anyopaque, __n: usize, __flags: c_int) isize;
pub extern fn sendto(__fd: c_int, __buf: ?*const anyopaque, __n: usize, __flags: c_int, __addr: [*c]const struct_sockaddr, __addr_len: socklen_t) isize;
pub extern fn recvfrom(__fd: c_int, noalias __buf: ?*anyopaque, __n: usize, __flags: c_int, noalias __addr: [*c]struct_sockaddr, noalias __addr_len: [*c]socklen_t) isize;
pub extern fn sendmsg(__fd: c_int, __message: [*c]const struct_msghdr, __flags: c_int) isize;
pub extern fn recvmsg(__fd: c_int, __message: [*c]struct_msghdr, __flags: c_int) isize;
pub extern fn getsockopt(__fd: c_int, __level: c_int, __optname: c_int, noalias __optval: ?*anyopaque, noalias __optlen: [*c]socklen_t) c_int;
pub extern fn setsockopt(__fd: c_int, __level: c_int, __optname: c_int, __optval: ?*const anyopaque, __optlen: socklen_t) c_int;
pub extern fn listen(__fd: c_int, __n: c_int) c_int;
pub extern fn accept(__fd: c_int, noalias __addr: [*c]struct_sockaddr, noalias __addr_len: [*c]socklen_t) c_int;
pub extern fn shutdown(__fd: c_int, __how: c_int) c_int;
pub extern fn sockatmark(__fd: c_int) c_int;
pub extern fn isfdtype(__fd: c_int, __fdtype: c_int) c_int;
pub const int_least8_t = __int_least8_t;
pub const int_least16_t = __int_least16_t;
pub const int_least32_t = __int_least32_t;
pub const int_least64_t = __int_least64_t;
pub const uint_least8_t = __uint_least8_t;
pub const uint_least16_t = __uint_least16_t;
pub const uint_least32_t = __uint_least32_t;
pub const uint_least64_t = __uint_least64_t;
pub const int_fast8_t = i8;
pub const int_fast16_t = c_long;
pub const int_fast32_t = c_long;
pub const int_fast64_t = c_long;
pub const uint_fast8_t = u8;
pub const uint_fast16_t = c_ulong;
pub const uint_fast32_t = c_ulong;
pub const uint_fast64_t = c_ulong;
pub const intmax_t = __intmax_t;
pub const uintmax_t = __uintmax_t;
pub const __gwchar_t = c_int;
pub const imaxdiv_t = extern struct {
    quot: c_long = 0,
    rem: c_long = 0,
};
pub extern fn imaxabs(__n: intmax_t) intmax_t;
pub extern fn imaxdiv(__numer: intmax_t, __denom: intmax_t) imaxdiv_t;
pub extern fn strtoimax(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8, __base: c_int) intmax_t;
pub extern fn strtoumax(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8, __base: c_int) uintmax_t;
pub extern fn wcstoimax(noalias __nptr: [*c]const __gwchar_t, noalias __endptr: [*c][*c]__gwchar_t, __base: c_int) intmax_t;
pub extern fn wcstoumax(noalias __nptr: [*c]const __gwchar_t, noalias __endptr: [*c][*c]__gwchar_t, __base: c_int) uintmax_t;
pub const sig_atomic_t = __sig_atomic_t;
pub const union_sigval = extern union {
    sival_int: c_int,
    sival_ptr: ?*anyopaque,
};
pub const __sigval_t = union_sigval;
const struct_unnamed_6 = extern struct {
    si_pid: __pid_t = 0,
    si_uid: __uid_t = 0,
};
const struct_unnamed_7 = extern struct {
    si_tid: c_int = 0,
    si_overrun: c_int = 0,
    si_sigval: __sigval_t = @import("std").mem.zeroes(__sigval_t),
};
const struct_unnamed_8 = extern struct {
    si_pid: __pid_t = 0,
    si_uid: __uid_t = 0,
    si_sigval: __sigval_t = @import("std").mem.zeroes(__sigval_t),
};
const struct_unnamed_9 = extern struct {
    si_pid: __pid_t = 0,
    si_uid: __uid_t = 0,
    si_status: c_int = 0,
    si_utime: __clock_t = 0,
    si_stime: __clock_t = 0,
};
const struct_unnamed_12 = extern struct {
    _lower: ?*anyopaque = null,
    _upper: ?*anyopaque = null,
};
const union_unnamed_11 = extern union {
    _addr_bnd: struct_unnamed_12,
    _pkey: __uint32_t,
};
const struct_unnamed_10 = extern struct {
    si_addr: ?*anyopaque = null,
    si_addr_lsb: c_short = 0,
    _bounds: union_unnamed_11 = @import("std").mem.zeroes(union_unnamed_11),
};
const struct_unnamed_13 = extern struct {
    si_band: c_long = 0,
    si_fd: c_int = 0,
};
const struct_unnamed_14 = extern struct {
    _call_addr: ?*anyopaque = null,
    _syscall: c_int = 0,
    _arch: c_uint = 0,
};
const union_unnamed_5 = extern union {
    _pad: [28]c_int,
    _kill: struct_unnamed_6,
    _timer: struct_unnamed_7,
    _rt: struct_unnamed_8,
    _sigchld: struct_unnamed_9,
    _sigfault: struct_unnamed_10,
    _sigpoll: struct_unnamed_13,
    _sigsys: struct_unnamed_14,
};
pub const siginfo_t = extern struct {
    si_signo: c_int = 0,
    si_errno: c_int = 0,
    si_code: c_int = 0,
    __pad0: c_int = 0,
    _sifields: union_unnamed_5 = @import("std").mem.zeroes(union_unnamed_5),
    pub const psiginfo = __root.psiginfo;
};
pub const SI_ASYNCNL: c_int = -60;
pub const SI_DETHREAD: c_int = -7;
pub const SI_TKILL: c_int = -6;
pub const SI_SIGIO: c_int = -5;
pub const SI_ASYNCIO: c_int = -4;
pub const SI_MESGQ: c_int = -3;
pub const SI_TIMER: c_int = -2;
pub const SI_QUEUE: c_int = -1;
pub const SI_USER: c_int = 0;
pub const SI_KERNEL: c_int = 128;
const enum_unnamed_15 = c_int;
pub const ILL_ILLOPC: c_int = 1;
pub const ILL_ILLOPN: c_int = 2;
pub const ILL_ILLADR: c_int = 3;
pub const ILL_ILLTRP: c_int = 4;
pub const ILL_PRVOPC: c_int = 5;
pub const ILL_PRVREG: c_int = 6;
pub const ILL_COPROC: c_int = 7;
pub const ILL_BADSTK: c_int = 8;
pub const ILL_BADIADDR: c_int = 9;
const enum_unnamed_16 = c_uint;
pub const FPE_INTDIV: c_int = 1;
pub const FPE_INTOVF: c_int = 2;
pub const FPE_FLTDIV: c_int = 3;
pub const FPE_FLTOVF: c_int = 4;
pub const FPE_FLTUND: c_int = 5;
pub const FPE_FLTRES: c_int = 6;
pub const FPE_FLTINV: c_int = 7;
pub const FPE_FLTSUB: c_int = 8;
pub const FPE_FLTUNK: c_int = 14;
pub const FPE_CONDTRAP: c_int = 15;
const enum_unnamed_17 = c_uint;
pub const SEGV_MAPERR: c_int = 1;
pub const SEGV_ACCERR: c_int = 2;
pub const SEGV_BNDERR: c_int = 3;
pub const SEGV_PKUERR: c_int = 4;
pub const SEGV_ACCADI: c_int = 5;
pub const SEGV_ADIDERR: c_int = 6;
pub const SEGV_ADIPERR: c_int = 7;
pub const SEGV_MTEAERR: c_int = 8;
pub const SEGV_MTESERR: c_int = 9;
const enum_unnamed_18 = c_uint;
pub const BUS_ADRALN: c_int = 1;
pub const BUS_ADRERR: c_int = 2;
pub const BUS_OBJERR: c_int = 3;
pub const BUS_MCEERR_AR: c_int = 4;
pub const BUS_MCEERR_AO: c_int = 5;
const enum_unnamed_19 = c_uint;
pub const CLD_EXITED: c_int = 1;
pub const CLD_KILLED: c_int = 2;
pub const CLD_DUMPED: c_int = 3;
pub const CLD_TRAPPED: c_int = 4;
pub const CLD_STOPPED: c_int = 5;
pub const CLD_CONTINUED: c_int = 6;
const enum_unnamed_20 = c_uint;
pub const POLL_IN: c_int = 1;
pub const POLL_OUT: c_int = 2;
pub const POLL_MSG: c_int = 3;
pub const POLL_ERR: c_int = 4;
pub const POLL_PRI: c_int = 5;
pub const POLL_HUP: c_int = 6;
const enum_unnamed_21 = c_uint;
pub const sigval_t = __sigval_t;
const struct_unnamed_23 = extern struct {
    _function: ?*const fn (__sigval_t) callconv(.c) void = null,
    _attribute: [*c]pthread_attr_t = null,
};
const union_unnamed_22 = extern union {
    _pad: [12]c_int,
    _tid: __pid_t,
    _sigev_thread: struct_unnamed_23,
};
pub const struct_sigevent = extern struct {
    sigev_value: __sigval_t = @import("std").mem.zeroes(__sigval_t),
    sigev_signo: c_int = 0,
    sigev_notify: c_int = 0,
    _sigev_un: union_unnamed_22 = @import("std").mem.zeroes(union_unnamed_22),
};
pub const sigevent_t = struct_sigevent;
pub const SIGEV_SIGNAL: c_int = 0;
pub const SIGEV_NONE: c_int = 1;
pub const SIGEV_THREAD: c_int = 2;
pub const SIGEV_THREAD_ID: c_int = 4;
const enum_unnamed_24 = c_uint;
pub const __sighandler_t = ?*const fn (c_int) callconv(.c) void;
pub extern fn __sysv_signal(__sig: c_int, __handler: __sighandler_t) __sighandler_t;
pub extern fn signal(__sig: c_int, __handler: __sighandler_t) __sighandler_t;
pub extern fn kill(__pid: __pid_t, __sig: c_int) c_int;
pub extern fn killpg(__pgrp: __pid_t, __sig: c_int) c_int;
pub extern fn raise(__sig: c_int) c_int;
pub extern fn ssignal(__sig: c_int, __handler: __sighandler_t) __sighandler_t;
pub extern fn gsignal(__sig: c_int) c_int;
pub extern fn psignal(__sig: c_int, __s: [*c]const u8) void;
pub extern fn psiginfo(__pinfo: [*c]const siginfo_t, __s: [*c]const u8) void;
pub extern fn sigblock(__mask: c_int) c_int;
pub extern fn sigsetmask(__mask: c_int) c_int;
pub extern fn siggetmask() c_int;
pub const sig_t = __sighandler_t;
pub extern fn sigemptyset(__set: [*c]sigset_t) c_int;
pub extern fn sigfillset(__set: [*c]sigset_t) c_int;
pub extern fn sigaddset(__set: [*c]sigset_t, __signo: c_int) c_int;
pub extern fn sigdelset(__set: [*c]sigset_t, __signo: c_int) c_int;
pub extern fn sigismember(__set: [*c]const sigset_t, __signo: c_int) c_int;
const union_unnamed_25 = extern union {
    sa_handler: __sighandler_t,
    sa_sigaction: ?*const fn (c_int, [*c]siginfo_t, ?*anyopaque) callconv(.c) void,
};
pub const struct_sigaction = extern struct {
    __sigaction_handler: union_unnamed_25 = @import("std").mem.zeroes(union_unnamed_25),
    sa_mask: __sigset_t = @import("std").mem.zeroes(__sigset_t),
    sa_flags: c_int = 0,
    sa_restorer: ?*const fn () callconv(.c) void = null,
};
pub extern fn sigprocmask(__how: c_int, noalias __set: [*c]const sigset_t, noalias __oset: [*c]sigset_t) c_int;
pub extern fn sigsuspend(__set: [*c]const sigset_t) c_int;
pub extern fn sigaction(__sig: c_int, noalias __act: [*c]const struct_sigaction, noalias __oact: [*c]struct_sigaction) c_int;
pub extern fn sigpending(__set: [*c]sigset_t) c_int;
pub extern fn sigwait(noalias __set: [*c]const sigset_t, noalias __sig: [*c]c_int) c_int;
pub extern fn sigwaitinfo(noalias __set: [*c]const sigset_t, noalias __info: [*c]siginfo_t) c_int;
pub extern fn sigtimedwait(noalias __set: [*c]const sigset_t, noalias __info: [*c]siginfo_t, noalias __timeout: [*c]const struct_timespec) c_int;
pub extern fn sigqueue(__pid: __pid_t, __sig: c_int, __val: union_sigval) c_int;
pub const struct__fpx_sw_bytes = extern struct {
    magic1: __uint32_t = 0,
    extended_size: __uint32_t = 0,
    xstate_bv: __uint64_t = 0,
    xstate_size: __uint32_t = 0,
    __glibc_reserved1: [7]__uint32_t = @import("std").mem.zeroes([7]__uint32_t),
};
pub const struct__fpreg = extern struct {
    significand: [4]c_ushort = @import("std").mem.zeroes([4]c_ushort),
    exponent: c_ushort = 0,
};
pub const struct__fpxreg = extern struct {
    significand: [4]c_ushort = @import("std").mem.zeroes([4]c_ushort),
    exponent: c_ushort = 0,
    __glibc_reserved1: [3]c_ushort = @import("std").mem.zeroes([3]c_ushort),
};
pub const struct__xmmreg = extern struct {
    element: [4]__uint32_t = @import("std").mem.zeroes([4]__uint32_t),
};
pub const struct__fpstate = extern struct {
    cwd: __uint16_t = 0,
    swd: __uint16_t = 0,
    ftw: __uint16_t = 0,
    fop: __uint16_t = 0,
    rip: __uint64_t = 0,
    rdp: __uint64_t = 0,
    mxcsr: __uint32_t = 0,
    mxcr_mask: __uint32_t = 0,
    _st: [8]struct__fpxreg = @import("std").mem.zeroes([8]struct__fpxreg),
    _xmm: [16]struct__xmmreg = @import("std").mem.zeroes([16]struct__xmmreg),
    __glibc_reserved1: [24]__uint32_t = @import("std").mem.zeroes([24]__uint32_t),
};
const union_unnamed_26 = extern union {
    fpstate: [*c]struct__fpstate,
    __fpstate_word: __uint64_t,
};
pub const struct_sigcontext = extern struct {
    r8: __uint64_t = 0,
    r9: __uint64_t = 0,
    r10: __uint64_t = 0,
    r11: __uint64_t = 0,
    r12: __uint64_t = 0,
    r13: __uint64_t = 0,
    r14: __uint64_t = 0,
    r15: __uint64_t = 0,
    rdi: __uint64_t = 0,
    rsi: __uint64_t = 0,
    rbp: __uint64_t = 0,
    rbx: __uint64_t = 0,
    rdx: __uint64_t = 0,
    rax: __uint64_t = 0,
    rcx: __uint64_t = 0,
    rsp: __uint64_t = 0,
    rip: __uint64_t = 0,
    eflags: __uint64_t = 0,
    cs: c_ushort = 0,
    gs: c_ushort = 0,
    fs: c_ushort = 0,
    __pad0: c_ushort = 0,
    err: __uint64_t = 0,
    trapno: __uint64_t = 0,
    oldmask: __uint64_t = 0,
    cr2: __uint64_t = 0,
    unnamed_0: union_unnamed_26 = @import("std").mem.zeroes(union_unnamed_26),
    __reserved1: [8]__uint64_t = @import("std").mem.zeroes([8]__uint64_t),
    pub const sigreturn = __root.sigreturn;
};
pub const struct__xsave_hdr = extern struct {
    xstate_bv: __uint64_t = 0,
    __glibc_reserved1: [2]__uint64_t = @import("std").mem.zeroes([2]__uint64_t),
    __glibc_reserved2: [5]__uint64_t = @import("std").mem.zeroes([5]__uint64_t),
};
pub const struct__ymmh_state = extern struct {
    ymmh_space: [64]__uint32_t = @import("std").mem.zeroes([64]__uint32_t),
};
pub const struct__xstate = extern struct {
    fpstate: struct__fpstate = @import("std").mem.zeroes(struct__fpstate),
    xstate_hdr: struct__xsave_hdr = @import("std").mem.zeroes(struct__xsave_hdr),
    ymmh: struct__ymmh_state = @import("std").mem.zeroes(struct__ymmh_state),
};
pub extern fn sigreturn(__scp: [*c]struct_sigcontext) c_int;
pub const stack_t = extern struct {
    ss_sp: ?*anyopaque = null,
    ss_flags: c_int = 0,
    ss_size: usize = 0,
    pub const sigaltstack = __root.sigaltstack;
};
pub const greg_t = c_longlong;
pub const gregset_t = [23]greg_t;
pub const struct__libc_fpxreg = extern struct {
    significand: [4]c_ushort = @import("std").mem.zeroes([4]c_ushort),
    exponent: c_ushort = 0,
    __glibc_reserved1: [3]c_ushort = @import("std").mem.zeroes([3]c_ushort),
};
pub const struct__libc_xmmreg = extern struct {
    element: [4]__uint32_t = @import("std").mem.zeroes([4]__uint32_t),
};
pub const struct__libc_fpstate = extern struct {
    cwd: __uint16_t = 0,
    swd: __uint16_t = 0,
    ftw: __uint16_t = 0,
    fop: __uint16_t = 0,
    rip: __uint64_t = 0,
    rdp: __uint64_t = 0,
    mxcsr: __uint32_t = 0,
    mxcr_mask: __uint32_t = 0,
    _st: [8]struct__libc_fpxreg = @import("std").mem.zeroes([8]struct__libc_fpxreg),
    _xmm: [16]struct__libc_xmmreg = @import("std").mem.zeroes([16]struct__libc_xmmreg),
    __glibc_reserved1: [24]__uint32_t = @import("std").mem.zeroes([24]__uint32_t),
};
pub const fpregset_t = [*c]struct__libc_fpstate;
pub const mcontext_t = extern struct {
    gregs: gregset_t = @import("std").mem.zeroes(gregset_t),
    fpregs: fpregset_t = null,
    __reserved1: [8]c_ulonglong = @import("std").mem.zeroes([8]c_ulonglong),
};
pub const struct_ucontext_t = extern struct {
    uc_flags: c_ulong = 0,
    uc_link: [*c]struct_ucontext_t = null,
    uc_stack: stack_t = @import("std").mem.zeroes(stack_t),
    uc_mcontext: mcontext_t = @import("std").mem.zeroes(mcontext_t),
    uc_sigmask: sigset_t = @import("std").mem.zeroes(sigset_t),
    __fpregs_mem: struct__libc_fpstate = @import("std").mem.zeroes(struct__libc_fpstate),
    __ssp: [4]c_ulonglong = @import("std").mem.zeroes([4]c_ulonglong),
};
pub const ucontext_t = struct_ucontext_t;
pub extern fn siginterrupt(__sig: c_int, __interrupt: c_int) c_int;
pub const SS_ONSTACK: c_int = 1;
pub const SS_DISABLE: c_int = 2;
const enum_unnamed_27 = c_uint;
pub extern fn sigaltstack(noalias __ss: [*c]const stack_t, noalias __oss: [*c]stack_t) c_int;
pub const struct_sigstack = extern struct {
    ss_sp: ?*anyopaque = null,
    ss_onstack: c_int = 0,
    pub const sigstack = __root.sigstack;
};
pub extern fn sigstack(__ss: [*c]struct_sigstack, __oss: [*c]struct_sigstack) c_int;
pub extern fn pthread_sigmask(__how: c_int, noalias __newmask: [*c]const __sigset_t, noalias __oldmask: [*c]__sigset_t) c_int;
pub extern fn pthread_kill(__threadid: pthread_t, __signo: c_int) c_int;
pub extern fn __libc_current_sigrtmin() c_int;
pub extern fn __libc_current_sigrtmax() c_int;
pub const P_ALL: c_int = 0;
pub const P_PID: c_int = 1;
pub const P_PGID: c_int = 2;
pub const idtype_t = c_uint;
pub extern fn wait(__stat_loc: [*c]c_int) __pid_t;
pub extern fn waitpid(__pid: __pid_t, __stat_loc: [*c]c_int, __options: c_int) __pid_t;
pub extern fn waitid(__idtype: idtype_t, __id: __id_t, __infop: [*c]siginfo_t, __options: c_int) c_int;
const union_unnamed_28 = extern union {
    ru_maxrss: c_long,
    __ru_maxrss_word: __syscall_slong_t,
};
const union_unnamed_29 = extern union {
    ru_ixrss: c_long,
    __ru_ixrss_word: __syscall_slong_t,
};
const union_unnamed_30 = extern union {
    ru_idrss: c_long,
    __ru_idrss_word: __syscall_slong_t,
};
const union_unnamed_31 = extern union {
    ru_isrss: c_long,
    __ru_isrss_word: __syscall_slong_t,
};
const union_unnamed_32 = extern union {
    ru_minflt: c_long,
    __ru_minflt_word: __syscall_slong_t,
};
const union_unnamed_33 = extern union {
    ru_majflt: c_long,
    __ru_majflt_word: __syscall_slong_t,
};
const union_unnamed_34 = extern union {
    ru_nswap: c_long,
    __ru_nswap_word: __syscall_slong_t,
};
const union_unnamed_35 = extern union {
    ru_inblock: c_long,
    __ru_inblock_word: __syscall_slong_t,
};
const union_unnamed_36 = extern union {
    ru_oublock: c_long,
    __ru_oublock_word: __syscall_slong_t,
};
const union_unnamed_37 = extern union {
    ru_msgsnd: c_long,
    __ru_msgsnd_word: __syscall_slong_t,
};
const union_unnamed_38 = extern union {
    ru_msgrcv: c_long,
    __ru_msgrcv_word: __syscall_slong_t,
};
const union_unnamed_39 = extern union {
    ru_nsignals: c_long,
    __ru_nsignals_word: __syscall_slong_t,
};
const union_unnamed_40 = extern union {
    ru_nvcsw: c_long,
    __ru_nvcsw_word: __syscall_slong_t,
};
const union_unnamed_41 = extern union {
    ru_nivcsw: c_long,
    __ru_nivcsw_word: __syscall_slong_t,
};
pub const struct_rusage = extern struct {
    ru_utime: struct_timeval = @import("std").mem.zeroes(struct_timeval),
    ru_stime: struct_timeval = @import("std").mem.zeroes(struct_timeval),
    unnamed_0: union_unnamed_28 = @import("std").mem.zeroes(union_unnamed_28),
    unnamed_1: union_unnamed_29 = @import("std").mem.zeroes(union_unnamed_29),
    unnamed_2: union_unnamed_30 = @import("std").mem.zeroes(union_unnamed_30),
    unnamed_3: union_unnamed_31 = @import("std").mem.zeroes(union_unnamed_31),
    unnamed_4: union_unnamed_32 = @import("std").mem.zeroes(union_unnamed_32),
    unnamed_5: union_unnamed_33 = @import("std").mem.zeroes(union_unnamed_33),
    unnamed_6: union_unnamed_34 = @import("std").mem.zeroes(union_unnamed_34),
    unnamed_7: union_unnamed_35 = @import("std").mem.zeroes(union_unnamed_35),
    unnamed_8: union_unnamed_36 = @import("std").mem.zeroes(union_unnamed_36),
    unnamed_9: union_unnamed_37 = @import("std").mem.zeroes(union_unnamed_37),
    unnamed_10: union_unnamed_38 = @import("std").mem.zeroes(union_unnamed_38),
    unnamed_11: union_unnamed_39 = @import("std").mem.zeroes(union_unnamed_39),
    unnamed_12: union_unnamed_40 = @import("std").mem.zeroes(union_unnamed_40),
    unnamed_13: union_unnamed_41 = @import("std").mem.zeroes(union_unnamed_41),
};
pub extern fn wait3(__stat_loc: [*c]c_int, __options: c_int, __usage: [*c]struct_rusage) __pid_t;
pub extern fn wait4(__pid: __pid_t, __stat_loc: [*c]c_int, __options: c_int, __usage: [*c]struct_rusage) __pid_t;
pub const apr_byte_t = u8;
pub const apr_int16_t = c_short;
pub const apr_uint16_t = c_ushort;
pub const apr_int32_t = c_int;
pub const apr_uint32_t = c_uint;
pub const apr_int64_t = i64;
pub const apr_uint64_t = u64;
pub const apr_size_t = usize;
pub const apr_ssize_t = isize;
pub const apr_off_t = off_t;
pub const apr_socklen_t = socklen_t;
pub const apr_ino_t = ino_t;
pub const apr_uintptr_t = apr_uint64_t;
pub extern fn __errno_location() [*c]c_int;
pub const apr_status_t = c_int;
pub extern fn apr_strerror(statcode: apr_status_t, buf: [*c]u8, bufsize: apr_size_t) [*c]u8;
pub const apr_signum_t = c_int;
pub extern fn apr_initialize() apr_status_t;
pub extern fn apr_app_initialize(argc: [*c]c_int, argv: [*c][*c]const [*c]const u8, env: [*c][*c]const [*c]const u8) apr_status_t;
pub extern fn apr_terminate() void;
pub extern fn apr_terminate2() void;
pub extern fn apr_generate_random_bytes(buf: [*c]u8, length: apr_size_t) apr_status_t;
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memmove(__dest: ?*anyopaque, __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memccpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub extern fn memcmp(__s1: ?*const anyopaque, __s2: ?*const anyopaque, __n: usize) c_int;
pub extern fn __memcmpeq(__s1: ?*const anyopaque, __s2: ?*const anyopaque, __n: usize) c_int;
pub extern fn memchr(__s: ?*const anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub extern fn strcpy(noalias __dest: [*c]u8, noalias __src: [*c]const u8) [*c]u8;
pub extern fn strncpy(noalias __dest: [*c]u8, noalias __src: [*c]const u8, __n: usize) [*c]u8;
pub extern fn strcat(noalias __dest: [*c]u8, noalias __src: [*c]const u8) [*c]u8;
pub extern fn strncat(noalias __dest: [*c]u8, noalias __src: [*c]const u8, __n: usize) [*c]u8;
pub extern fn strcmp(__s1: [*c]const u8, __s2: [*c]const u8) c_int;
pub extern fn strncmp(__s1: [*c]const u8, __s2: [*c]const u8, __n: usize) c_int;
pub extern fn strcoll(__s1: [*c]const u8, __s2: [*c]const u8) c_int;
pub extern fn strxfrm(noalias __dest: [*c]u8, noalias __src: [*c]const u8, __n: usize) usize;
pub const struct___locale_data_42 = opaque {};
pub const struct___locale_struct = extern struct {
    __locales: [13]?*struct___locale_data_42 = @import("std").mem.zeroes([13]?*struct___locale_data_42),
    __ctype_b: [*c]const c_ushort = null,
    __ctype_tolower: [*c]const c_int = null,
    __ctype_toupper: [*c]const c_int = null,
    __names: [13][*c]const u8 = @import("std").mem.zeroes([13][*c]const u8),
};
pub const __locale_t = [*c]struct___locale_struct;
pub const locale_t = __locale_t;
pub extern fn strcoll_l(__s1: [*c]const u8, __s2: [*c]const u8, __l: locale_t) c_int;
pub extern fn strxfrm_l(__dest: [*c]u8, __src: [*c]const u8, __n: usize, __l: locale_t) usize;
pub extern fn strdup(__s: [*c]const u8) [*c]u8;
pub extern fn strndup(__string: [*c]const u8, __n: usize) [*c]u8;
pub extern fn strchr(__s: [*c]const u8, __c: c_int) [*c]u8;
pub extern fn strrchr(__s: [*c]const u8, __c: c_int) [*c]u8;
pub extern fn strcspn(__s: [*c]const u8, __reject: [*c]const u8) usize;
pub extern fn strspn(__s: [*c]const u8, __accept: [*c]const u8) usize;
pub extern fn strpbrk(__s: [*c]const u8, __accept: [*c]const u8) [*c]u8;
pub extern fn strstr(__haystack: [*c]const u8, __needle: [*c]const u8) [*c]u8;
pub extern fn strtok(noalias __s: [*c]u8, noalias __delim: [*c]const u8) [*c]u8;
pub extern fn __strtok_r(noalias __s: [*c]u8, noalias __delim: [*c]const u8, noalias __save_ptr: [*c][*c]u8) [*c]u8;
pub extern fn strtok_r(noalias __s: [*c]u8, noalias __delim: [*c]const u8, noalias __save_ptr: [*c][*c]u8) [*c]u8;
pub extern fn strlen(__s: [*c]const u8) usize;
pub extern fn strnlen(__string: [*c]const u8, __maxlen: usize) usize;
pub extern fn strerror(__errnum: c_int) [*c]u8;
pub extern fn strerror_r(__errnum: c_int, __buf: [*c]u8, __buflen: usize) c_int;
pub extern fn strerror_l(__errnum: c_int, __l: locale_t) [*c]u8;
pub extern fn bcmp(__s1: ?*const anyopaque, __s2: ?*const anyopaque, __n: usize) c_int;
pub extern fn bcopy(__src: ?*const anyopaque, __dest: ?*anyopaque, __n: usize) void;
pub extern fn bzero(__s: ?*anyopaque, __n: usize) void;
pub extern fn index(__s: [*c]const u8, __c: c_int) [*c]u8;
pub extern fn rindex(__s: [*c]const u8, __c: c_int) [*c]u8;
pub extern fn ffs(__i: c_int) c_int;
pub extern fn ffsl(__l: c_long) c_int;
pub extern fn ffsll(__ll: c_longlong) c_int;
pub extern fn strcasecmp(__s1: [*c]const u8, __s2: [*c]const u8) c_int;
pub extern fn strncasecmp(__s1: [*c]const u8, __s2: [*c]const u8, __n: usize) c_int;
pub extern fn strcasecmp_l(__s1: [*c]const u8, __s2: [*c]const u8, __loc: locale_t) c_int;
pub extern fn strncasecmp_l(__s1: [*c]const u8, __s2: [*c]const u8, __n: usize, __loc: locale_t) c_int;
pub extern fn explicit_bzero(__s: ?*anyopaque, __n: usize) void;
pub extern fn strsep(noalias __stringp: [*c][*c]u8, noalias __delim: [*c]const u8) [*c]u8;
pub extern fn strsignal(__sig: c_int) [*c]u8;
pub extern fn __stpcpy(noalias __dest: [*c]u8, noalias __src: [*c]const u8) [*c]u8;
pub extern fn stpcpy(noalias __dest: [*c]u8, noalias __src: [*c]const u8) [*c]u8;
pub extern fn __stpncpy(noalias __dest: [*c]u8, noalias __src: [*c]const u8, __n: usize) [*c]u8;
pub extern fn stpncpy(noalias __dest: [*c]u8, noalias __src: [*c]const u8, __n: usize) [*c]u8;
pub const struct_apr_pool_t = opaque {
    pub const apr_time_clock_hires = __root.apr_time_clock_hires;
    pub const apr_pool_allocator_get = __root.apr_pool_allocator_get;
    pub const apr_pool_clear = __root.apr_pool_clear;
    pub const apr_pool_clear_debug = __root.apr_pool_clear_debug;
    pub const apr_pool_destroy = __root.apr_pool_destroy;
    pub const apr_pool_destroy_debug = __root.apr_pool_destroy_debug;
    pub const apr_palloc = __root.apr_palloc;
    pub const apr_palloc_debug = __root.apr_palloc_debug;
    pub const apr_pcalloc_debug = __root.apr_pcalloc_debug;
    pub const apr_pool_abort_get = __root.apr_pool_abort_get;
    pub const apr_pool_parent_get = __root.apr_pool_parent_get;
    pub const apr_pool_is_ancestor = __root.apr_pool_is_ancestor;
    pub const apr_pool_tag = __root.apr_pool_tag;
    pub const apr_pool_cleanup_register = __root.apr_pool_cleanup_register;
    pub const apr_pool_pre_cleanup_register = __root.apr_pool_pre_cleanup_register;
    pub const apr_pool_cleanup_kill = __root.apr_pool_cleanup_kill;
    pub const apr_pool_child_cleanup_set = __root.apr_pool_child_cleanup_set;
    pub const apr_pool_cleanup_run = __root.apr_pool_cleanup_run;
    pub const apr_hash_make = __root.apr_hash_make;
    pub const apr_hash_make_custom = __root.apr_hash_make_custom;
    pub const apr_hash_copy = __root.apr_hash_copy;
    pub const apr_hash_first = __root.apr_hash_first;
    pub const apr_hash_overlay = __root.apr_hash_overlay;
    pub const apr_hash_merge = __root.apr_hash_merge;
    pub const apr_array_make = __root.apr_array_make;
    pub const apr_array_copy = __root.apr_array_copy;
    pub const apr_array_copy_hdr = __root.apr_array_copy_hdr;
    pub const apr_array_append = __root.apr_array_append;
    pub const apr_array_pstrcat = __root.apr_array_pstrcat;
    pub const apr_table_make = __root.apr_table_make;
    pub const apr_table_copy = __root.apr_table_copy;
    pub const apr_table_clone = __root.apr_table_clone;
    pub const apr_table_getm = __root.apr_table_getm;
    pub const apr_table_overlay = __root.apr_table_overlay;
    pub const apr_pstrdup = __root.apr_pstrdup;
    pub const apr_pstrmemdup = __root.apr_pstrmemdup;
    pub const apr_pstrndup = __root.apr_pstrndup;
    pub const apr_pmemdup = __root.apr_pmemdup;
    pub const apr_pstrcat = __root.apr_pstrcat;
    pub const apr_pstrcatv = __root.apr_pstrcatv;
    pub const apr_pvsprintf = __root.apr_pvsprintf;
    pub const apr_psprintf = __root.apr_psprintf;
    pub const apr_itoa = __root.apr_itoa;
    pub const apr_ltoa = __root.apr_ltoa;
    pub const apr_off_t_toa = __root.apr_off_t_toa;
    pub const svn_dirent_create = __root.svn_dirent_create;
    pub const svn_create_commit_info = __root.svn_create_commit_info;
    pub const svn_log_changed_path2_create = __root.svn_log_changed_path2_create;
    pub const svn_log_entry_create = __root.svn_log_entry_create;
    pub const svn_lock_create = __root.svn_lock_create;
    pub const svn_uuid_generate = __root.svn_uuid_generate;
    pub const svn_string_create_empty = __root.svn_string_create_empty;
    pub const svn_string_createf = __root.svn_string_createf;
    pub const svn_string_createv = __root.svn_string_createv;
    pub const svn_stringbuf_create_empty = __root.svn_stringbuf_create_empty;
    pub const svn_stringbuf_createf = __root.svn_stringbuf_createf;
    pub const svn_stringbuf_createv = __root.svn_stringbuf_createv;
    pub const svn_pool_create_ex = __root.svn_pool_create_ex;
    pub const svn_pool_create_ex_debug = __root.svn_pool_create_ex_debug;
    pub const apr_pool_note_subprocess = __root.apr_pool_note_subprocess;
    pub const svn_io_dirent2_create = __root.svn_io_dirent2_create;
    pub const svn_stream_empty = __root.svn_stream_empty;
    pub const svn_stream_buffered = __root.svn_stream_buffered;
    pub const svn_delta_default_editor = __root.svn_delta_default_editor;
    pub const svn_fs_initialize = __root.svn_fs_initialize;
    pub const svn_utf_initialize = __root.svn_utf_initialize;
    pub const hires = __root.apr_time_clock_hires;
    pub const get = __root.apr_pool_allocator_get;
    pub const clear = __root.apr_pool_clear;
    pub const debug = __root.apr_pool_clear_debug;
    pub const destroy = __root.apr_pool_destroy;
    pub const palloc = __root.apr_palloc;
    pub const ancestor = __root.apr_pool_is_ancestor;
    pub const tag = __root.apr_pool_tag;
    pub const register = __root.apr_pool_cleanup_register;
    pub const set = __root.apr_pool_child_cleanup_set;
    pub const run = __root.apr_pool_cleanup_run;
    pub const make = __root.apr_hash_make;
    pub const custom = __root.apr_hash_make_custom;
    pub const copy = __root.apr_hash_copy;
    pub const first = __root.apr_hash_first;
    pub const overlay = __root.apr_hash_overlay;
    pub const merge = __root.apr_hash_merge;
    pub const hdr = __root.apr_array_copy_hdr;
    pub const append = __root.apr_array_append;
    pub const pstrcat = __root.apr_array_pstrcat;
    pub const clone = __root.apr_table_clone;
    pub const getm = __root.apr_table_getm;
    pub const pstrdup = __root.apr_pstrdup;
    pub const pstrmemdup = __root.apr_pstrmemdup;
    pub const pstrndup = __root.apr_pstrndup;
    pub const pmemdup = __root.apr_pmemdup;
    pub const pstrcatv = __root.apr_pstrcatv;
    pub const pvsprintf = __root.apr_pvsprintf;
    pub const psprintf = __root.apr_psprintf;
    pub const itoa = __root.apr_itoa;
    pub const ltoa = __root.apr_ltoa;
    pub const toa = __root.apr_off_t_toa;
    pub const create = __root.svn_dirent_create;
    pub const info = __root.svn_create_commit_info;
    pub const generate = __root.svn_uuid_generate;
    pub const empty = __root.svn_string_create_empty;
    pub const createf = __root.svn_string_createf;
    pub const createv = __root.svn_string_createv;
    pub const ex = __root.svn_pool_create_ex;
    pub const subprocess = __root.apr_pool_note_subprocess;
    pub const buffered = __root.svn_stream_buffered;
    pub const editor = __root.svn_delta_default_editor;
    pub const initialize = __root.svn_fs_initialize;
};
pub const apr_pool_t = struct_apr_pool_t;
pub const apr_abortfunc_t = ?*const fn (retcode: c_int) callconv(.c) c_int;
pub extern fn apr_pool_initialize() apr_status_t;
pub extern fn apr_pool_terminate() void;
pub const struct_apr_allocator_t = opaque {
    pub const apr_allocator_destroy = __root.apr_allocator_destroy;
    pub const apr_allocator_alloc = __root.apr_allocator_alloc;
    pub const apr_allocator_free = __root.apr_allocator_free;
    pub const apr_allocator_align = __root.apr_allocator_align;
    pub const apr_allocator_owner_set = __root.apr_allocator_owner_set;
    pub const apr_allocator_owner_get = __root.apr_allocator_owner_get;
    pub const apr_allocator_max_free_set = __root.apr_allocator_max_free_set;
    pub const apr_allocator_mutex_set = __root.apr_allocator_mutex_set;
    pub const apr_allocator_mutex_get = __root.apr_allocator_mutex_get;
    pub const destroy = __root.apr_allocator_destroy;
    pub const alloc = __root.apr_allocator_alloc;
    pub const @"align" = __root.apr_allocator_align;
    pub const set = __root.apr_allocator_owner_set;
    pub const get = __root.apr_allocator_owner_get;
};
pub const apr_allocator_t = struct_apr_allocator_t;
pub const apr_memnode_t = struct_apr_memnode_t;
pub const struct_apr_memnode_t = extern struct {
    next: [*c]apr_memnode_t = null,
    ref: [*c][*c]apr_memnode_t = null,
    index: apr_uint32_t = 0,
    free_index: apr_uint32_t = 0,
    first_avail: [*c]u8 = null,
    endp: [*c]u8 = null,
};
pub extern fn apr_allocator_create(allocator: [*c]?*apr_allocator_t) apr_status_t;
pub extern fn apr_allocator_destroy(allocator: ?*apr_allocator_t) void;
pub extern fn apr_allocator_alloc(allocator: ?*apr_allocator_t, size: apr_size_t) [*c]apr_memnode_t;
pub extern fn apr_allocator_free(allocator: ?*apr_allocator_t, memnode: [*c]apr_memnode_t) void;
pub extern fn apr_allocator_align(allocator: ?*apr_allocator_t, size: apr_size_t) apr_size_t;
pub extern fn apr_allocator_owner_set(allocator: ?*apr_allocator_t, pool: ?*apr_pool_t) void;
pub extern fn apr_allocator_owner_get(allocator: ?*apr_allocator_t) ?*apr_pool_t;
pub extern fn apr_allocator_max_free_set(allocator: ?*apr_allocator_t, size: apr_size_t) void;
pub const struct_apr_thread_mutex_t = opaque {
    pub const apr_thread_mutex_lock = __root.apr_thread_mutex_lock;
    pub const apr_thread_mutex_trylock = __root.apr_thread_mutex_trylock;
    pub const apr_thread_mutex_timedlock = __root.apr_thread_mutex_timedlock;
    pub const apr_thread_mutex_unlock = __root.apr_thread_mutex_unlock;
    pub const apr_thread_mutex_destroy = __root.apr_thread_mutex_destroy;
    pub const apr_thread_mutex_pool_get = __root.apr_thread_mutex_pool_get;
    pub const lock = __root.apr_thread_mutex_lock;
    pub const trylock = __root.apr_thread_mutex_trylock;
    pub const timedlock = __root.apr_thread_mutex_timedlock;
    pub const unlock = __root.apr_thread_mutex_unlock;
    pub const destroy = __root.apr_thread_mutex_destroy;
    pub const get = __root.apr_thread_mutex_pool_get;
};
pub const apr_thread_mutex_t = struct_apr_thread_mutex_t;
pub extern var apr_month_snames: [12][4]u8;
pub extern var apr_day_snames: [7][4]u8;
pub const apr_time_t = apr_int64_t;
pub const apr_interval_time_t = apr_int64_t;
pub const apr_short_interval_time_t = apr_int32_t;
pub extern fn apr_time_now() apr_time_t;
pub const struct_apr_time_exp_t = extern struct {
    tm_usec: apr_int32_t = 0,
    tm_sec: apr_int32_t = 0,
    tm_min: apr_int32_t = 0,
    tm_hour: apr_int32_t = 0,
    tm_mday: apr_int32_t = 0,
    tm_mon: apr_int32_t = 0,
    tm_year: apr_int32_t = 0,
    tm_wday: apr_int32_t = 0,
    tm_yday: apr_int32_t = 0,
    tm_isdst: apr_int32_t = 0,
    tm_gmtoff: apr_int32_t = 0,
    pub const apr_time_exp_tz = __root.apr_time_exp_tz;
    pub const apr_time_exp_gmt = __root.apr_time_exp_gmt;
    pub const apr_time_exp_lt = __root.apr_time_exp_lt;
    pub const tz = __root.apr_time_exp_tz;
    pub const gmt = __root.apr_time_exp_gmt;
    pub const lt = __root.apr_time_exp_lt;
};
pub const apr_time_exp_t = struct_apr_time_exp_t;
pub extern fn apr_time_ansi_put(result: [*c]apr_time_t, input: time_t) apr_status_t;
pub extern fn apr_time_exp_tz(result: [*c]apr_time_exp_t, input: apr_time_t, offs: apr_int32_t) apr_status_t;
pub extern fn apr_time_exp_gmt(result: [*c]apr_time_exp_t, input: apr_time_t) apr_status_t;
pub extern fn apr_time_exp_lt(result: [*c]apr_time_exp_t, input: apr_time_t) apr_status_t;
pub extern fn apr_time_exp_get(result: [*c]apr_time_t, input: [*c]apr_time_exp_t) apr_status_t;
pub extern fn apr_time_exp_gmt_get(result: [*c]apr_time_t, input: [*c]apr_time_exp_t) apr_status_t;
pub extern fn apr_sleep(t: apr_interval_time_t) void;
pub extern fn apr_rfc822_date(date_str: [*c]u8, t: apr_time_t) apr_status_t;
pub extern fn apr_ctime(date_str: [*c]u8, t: apr_time_t) apr_status_t;
pub extern fn apr_strftime(s: [*c]u8, retsize: [*c]apr_size_t, max: apr_size_t, format: [*c]const u8, tm: [*c]apr_time_exp_t) apr_status_t;
pub extern fn apr_time_clock_hires(p: ?*apr_pool_t) void;
pub extern fn apr_thread_mutex_create(mutex: [*c]?*apr_thread_mutex_t, flags: c_uint, pool: ?*apr_pool_t) apr_status_t;
pub extern fn apr_thread_mutex_lock(mutex: ?*apr_thread_mutex_t) apr_status_t;
pub extern fn apr_thread_mutex_trylock(mutex: ?*apr_thread_mutex_t) apr_status_t;
pub extern fn apr_thread_mutex_timedlock(mutex: ?*apr_thread_mutex_t, timeout: apr_interval_time_t) apr_status_t;
pub extern fn apr_thread_mutex_unlock(mutex: ?*apr_thread_mutex_t) apr_status_t;
pub extern fn apr_thread_mutex_destroy(mutex: ?*apr_thread_mutex_t) apr_status_t;
pub extern fn apr_thread_mutex_pool_get(thethread_mutex: ?*const apr_thread_mutex_t) ?*apr_pool_t;
pub extern fn apr_allocator_mutex_set(allocator: ?*apr_allocator_t, mutex: ?*apr_thread_mutex_t) void;
pub extern fn apr_allocator_mutex_get(allocator: ?*apr_allocator_t) ?*apr_thread_mutex_t;
pub extern fn apr_pool_create_ex(newpool: [*c]?*apr_pool_t, parent: ?*apr_pool_t, abort_fn: apr_abortfunc_t, allocator: ?*apr_allocator_t) apr_status_t;
pub extern fn apr_pool_create_core_ex(newpool: [*c]?*apr_pool_t, abort_fn: apr_abortfunc_t, allocator: ?*apr_allocator_t) apr_status_t;
pub extern fn apr_pool_create_unmanaged_ex(newpool: [*c]?*apr_pool_t, abort_fn: apr_abortfunc_t, allocator: ?*apr_allocator_t) apr_status_t;
pub extern fn apr_pool_create_ex_debug(newpool: [*c]?*apr_pool_t, parent: ?*apr_pool_t, abort_fn: apr_abortfunc_t, allocator: ?*apr_allocator_t, file_line: [*c]const u8) apr_status_t;
pub extern fn apr_pool_create_core_ex_debug(newpool: [*c]?*apr_pool_t, abort_fn: apr_abortfunc_t, allocator: ?*apr_allocator_t, file_line: [*c]const u8) apr_status_t;
pub extern fn apr_pool_create_unmanaged_ex_debug(newpool: [*c]?*apr_pool_t, abort_fn: apr_abortfunc_t, allocator: ?*apr_allocator_t, file_line: [*c]const u8) apr_status_t;
pub extern fn apr_pool_allocator_get(pool: ?*apr_pool_t) ?*apr_allocator_t;
pub extern fn apr_pool_clear(p: ?*apr_pool_t) void;
pub extern fn apr_pool_clear_debug(p: ?*apr_pool_t, file_line: [*c]const u8) void;
pub extern fn apr_pool_destroy(p: ?*apr_pool_t) void;
pub extern fn apr_pool_destroy_debug(p: ?*apr_pool_t, file_line: [*c]const u8) void;
pub extern fn apr_palloc(p: ?*apr_pool_t, size: apr_size_t) ?*anyopaque;
pub extern fn apr_palloc_debug(p: ?*apr_pool_t, size: apr_size_t, file_line: [*c]const u8) ?*anyopaque;
pub extern fn apr_pcalloc_debug(p: ?*apr_pool_t, size: apr_size_t, file_line: [*c]const u8) ?*anyopaque;
pub extern fn apr_pool_abort_set(abortfunc: apr_abortfunc_t, pool: ?*apr_pool_t) void;
pub extern fn apr_pool_abort_get(pool: ?*apr_pool_t) apr_abortfunc_t;
pub extern fn apr_pool_parent_get(pool: ?*apr_pool_t) ?*apr_pool_t;
pub extern fn apr_pool_is_ancestor(a: ?*apr_pool_t, b: ?*apr_pool_t) c_int;
pub extern fn apr_pool_tag(pool: ?*apr_pool_t, tag: [*c]const u8) void;
pub extern fn apr_pool_userdata_set(data: ?*const anyopaque, key: [*c]const u8, cleanup: ?*const fn (?*anyopaque) callconv(.c) apr_status_t, pool: ?*apr_pool_t) apr_status_t;
pub extern fn apr_pool_userdata_setn(data: ?*const anyopaque, key: [*c]const u8, cleanup: ?*const fn (?*anyopaque) callconv(.c) apr_status_t, pool: ?*apr_pool_t) apr_status_t;
pub extern fn apr_pool_userdata_get(data: [*c]?*anyopaque, key: [*c]const u8, pool: ?*apr_pool_t) apr_status_t;
pub extern fn apr_pool_cleanup_register(p: ?*apr_pool_t, data: ?*const anyopaque, plain_cleanup: ?*const fn (?*anyopaque) callconv(.c) apr_status_t, child_cleanup: ?*const fn (?*anyopaque) callconv(.c) apr_status_t) void;
pub extern fn apr_pool_pre_cleanup_register(p: ?*apr_pool_t, data: ?*const anyopaque, plain_cleanup: ?*const fn (?*anyopaque) callconv(.c) apr_status_t) void;
pub extern fn apr_pool_cleanup_kill(p: ?*apr_pool_t, data: ?*const anyopaque, cleanup: ?*const fn (?*anyopaque) callconv(.c) apr_status_t) void;
pub extern fn apr_pool_child_cleanup_set(p: ?*apr_pool_t, data: ?*const anyopaque, plain_cleanup: ?*const fn (?*anyopaque) callconv(.c) apr_status_t, child_cleanup: ?*const fn (?*anyopaque) callconv(.c) apr_status_t) void;
pub extern fn apr_pool_cleanup_run(p: ?*apr_pool_t, data: ?*anyopaque, cleanup: ?*const fn (?*anyopaque) callconv(.c) apr_status_t) apr_status_t;
pub extern fn apr_pool_cleanup_null(data: ?*anyopaque) apr_status_t;
pub extern fn apr_pool_cleanup_for_exec() void;
pub const struct_apr_hash_t = opaque {
    pub const apr_hash_set = __root.apr_hash_set;
    pub const apr_hash_get = __root.apr_hash_get;
    pub const apr_hash_count = __root.apr_hash_count;
    pub const apr_hash_clear = __root.apr_hash_clear;
    pub const apr_hash_pool_get = __root.apr_hash_pool_get;
    pub const svn_mergeinfo_merge2 = __root.svn_mergeinfo_merge2;
    pub const svn_mergeinfo_merge = __root.svn_mergeinfo_merge;
    pub const svn_mergeinfo_catalog_merge = __root.svn_mergeinfo_catalog_merge;
    pub const svn_mergeinfo_sort = __root.svn_mergeinfo_sort;
    pub const svn_mergeinfo_catalog_dup = __root.svn_mergeinfo_catalog_dup;
    pub const svn_mergeinfo_dup = __root.svn_mergeinfo_dup;
    pub const svn_fs_new = __root.svn_fs_new;
    pub const svn_fs__prop_lists_equal = __root.svn_fs__prop_lists_equal;
    pub const svn_prop_hash_to_array = __root.svn_prop_hash_to_array;
    pub const svn_prop_hash_dup = __root.svn_prop_hash_dup;
    pub const svn_prop_get_value = __root.svn_prop_get_value;
    pub const svn_prop_has_svn_prop = __root.svn_prop_has_svn_prop;
    pub const set = __root.apr_hash_set;
    pub const get = __root.apr_hash_get;
    pub const count = __root.apr_hash_count;
    pub const clear = __root.apr_hash_clear;
    pub const merge2 = __root.svn_mergeinfo_merge2;
    pub const merge = __root.svn_mergeinfo_merge;
    pub const sort = __root.svn_mergeinfo_sort;
    pub const dup = __root.svn_mergeinfo_catalog_dup;
    pub const new = __root.svn_fs_new;
    pub const equal = __root.svn_fs__prop_lists_equal;
    pub const array = __root.svn_prop_hash_to_array;
    pub const value = __root.svn_prop_get_value;
    pub const prop = __root.svn_prop_has_svn_prop;
};
pub const apr_hash_t = struct_apr_hash_t;
pub const struct_apr_hash_index_t = opaque {
    pub const apr_hash_next = __root.apr_hash_next;
    pub const apr_hash_this = __root.apr_hash_this;
    pub const apr_hash_this_key = __root.apr_hash_this_key;
    pub const apr_hash_this_key_len = __root.apr_hash_this_key_len;
    pub const apr_hash_this_val = __root.apr_hash_this_val;
    pub const next = __root.apr_hash_next;
    pub const this = __root.apr_hash_this;
    pub const key = __root.apr_hash_this_key;
    pub const len = __root.apr_hash_this_key_len;
    pub const val = __root.apr_hash_this_val;
};
pub const apr_hash_index_t = struct_apr_hash_index_t;
pub const apr_hashfunc_t = ?*const fn (key: [*c]const u8, klen: [*c]apr_ssize_t) callconv(.c) c_uint;
pub extern fn apr_hashfunc_default(key: [*c]const u8, klen: [*c]apr_ssize_t) c_uint;
pub extern fn apr_hash_make(pool: ?*apr_pool_t) ?*apr_hash_t;
pub extern fn apr_hash_make_custom(pool: ?*apr_pool_t, hash_func: apr_hashfunc_t) ?*apr_hash_t;
pub extern fn apr_hash_copy(pool: ?*apr_pool_t, h: ?*const apr_hash_t) ?*apr_hash_t;
pub extern fn apr_hash_set(ht: ?*apr_hash_t, key: ?*const anyopaque, klen: apr_ssize_t, val: ?*const anyopaque) void;
pub extern fn apr_hash_get(ht: ?*apr_hash_t, key: ?*const anyopaque, klen: apr_ssize_t) ?*anyopaque;
pub extern fn apr_hash_first(p: ?*apr_pool_t, ht: ?*apr_hash_t) ?*apr_hash_index_t;
pub extern fn apr_hash_next(hi: ?*apr_hash_index_t) ?*apr_hash_index_t;
pub extern fn apr_hash_this(hi: ?*apr_hash_index_t, key: [*c]?*const anyopaque, klen: [*c]apr_ssize_t, val: [*c]?*anyopaque) void;
pub extern fn apr_hash_this_key(hi: ?*apr_hash_index_t) ?*const anyopaque;
pub extern fn apr_hash_this_key_len(hi: ?*apr_hash_index_t) apr_ssize_t;
pub extern fn apr_hash_this_val(hi: ?*apr_hash_index_t) ?*anyopaque;
pub extern fn apr_hash_count(ht: ?*apr_hash_t) c_uint;
pub extern fn apr_hash_clear(ht: ?*apr_hash_t) void;
pub extern fn apr_hash_overlay(p: ?*apr_pool_t, overlay: ?*const apr_hash_t, base: ?*const apr_hash_t) ?*apr_hash_t;
pub extern fn apr_hash_merge(p: ?*apr_pool_t, h1: ?*const apr_hash_t, h2: ?*const apr_hash_t, merger: ?*const fn (p: ?*apr_pool_t, key: ?*const anyopaque, klen: apr_ssize_t, h1_val: ?*const anyopaque, h2_val: ?*const anyopaque, data: ?*const anyopaque) callconv(.c) ?*anyopaque, data: ?*const anyopaque) ?*apr_hash_t;
pub const apr_hash_do_callback_fn_t = fn (rec: ?*anyopaque, key: ?*const anyopaque, klen: apr_ssize_t, value: ?*const anyopaque) callconv(.c) c_int;
pub extern fn apr_hash_do(comp: ?*const apr_hash_do_callback_fn_t, rec: ?*anyopaque, ht: ?*const apr_hash_t) c_int;
pub extern fn apr_hash_pool_get(thehash: ?*const apr_hash_t) ?*apr_pool_t;
pub const struct___va_list_tag_43 = extern struct {
    unnamed_0: c_uint = 0,
    unnamed_1: c_uint = 0,
    unnamed_2: ?*anyopaque = null,
    unnamed_3: ?*anyopaque = null,
};
pub const __builtin_va_list = [1]struct___va_list_tag_43;
pub const va_list = __builtin_va_list;
pub const __gnuc_va_list = __builtin_va_list;
pub const struct_apr_table_t = opaque {
    pub const apr_table_elts = __root.apr_table_elts;
    pub const apr_is_empty_table = __root.apr_is_empty_table;
    pub const apr_table_clear = __root.apr_table_clear;
    pub const apr_table_get = __root.apr_table_get;
    pub const apr_table_set = __root.apr_table_set;
    pub const apr_table_setn = __root.apr_table_setn;
    pub const apr_table_unset = __root.apr_table_unset;
    pub const apr_table_merge = __root.apr_table_merge;
    pub const apr_table_mergen = __root.apr_table_mergen;
    pub const apr_table_add = __root.apr_table_add;
    pub const apr_table_addn = __root.apr_table_addn;
    pub const apr_table_overlap = __root.apr_table_overlap;
    pub const apr_table_compress = __root.apr_table_compress;
    pub const elts = __root.apr_table_elts;
    pub const table = __root.apr_is_empty_table;
    pub const clear = __root.apr_table_clear;
    pub const get = __root.apr_table_get;
    pub const set = __root.apr_table_set;
    pub const setn = __root.apr_table_setn;
    pub const unset = __root.apr_table_unset;
    pub const merge = __root.apr_table_merge;
    pub const mergen = __root.apr_table_mergen;
    pub const add = __root.apr_table_add;
    pub const addn = __root.apr_table_addn;
    pub const overlap = __root.apr_table_overlap;
    pub const compress = __root.apr_table_compress;
};
pub const apr_table_t = struct_apr_table_t;
pub const struct_apr_array_header_t = extern struct {
    pool: ?*apr_pool_t = null,
    elt_size: c_int = 0,
    nelts: c_int = 0,
    nalloc: c_int = 0,
    elts: [*c]u8 = null,
    pub const apr_is_empty_array = __root.apr_is_empty_array;
    pub const apr_array_push = __root.apr_array_push;
    pub const apr_array_pop = __root.apr_array_pop;
    pub const apr_array_clear = __root.apr_array_clear;
    pub const apr_array_cat = __root.apr_array_cat;
    pub const svn_cstring_split_append = __root.svn_cstring_split_append;
    pub const svn_cstring_join2 = __root.svn_cstring_join2;
    pub const svn_cstring_join = __root.svn_cstring_join;
    pub const svn_rangelist_merge2 = __root.svn_rangelist_merge2;
    pub const svn_rangelist_reverse = __root.svn_rangelist_reverse;
    pub const svn_rangelist_dup = __root.svn_rangelist_dup;
    pub const svn_prop_array_dup = __root.svn_prop_array_dup;
    pub const svn_prop_array_to_hash = __root.svn_prop_array_to_hash;
    pub const svn_categorize_props = __root.svn_categorize_props;
    pub const array = __root.apr_is_empty_array;
    pub const push = __root.apr_array_push;
    pub const pop = __root.apr_array_pop;
    pub const clear = __root.apr_array_clear;
    pub const cat = __root.apr_array_cat;
    pub const append = __root.svn_cstring_split_append;
    pub const join2 = __root.svn_cstring_join2;
    pub const join = __root.svn_cstring_join;
    pub const merge2 = __root.svn_rangelist_merge2;
    pub const reverse = __root.svn_rangelist_reverse;
    pub const dup = __root.svn_rangelist_dup;
    pub const hash = __root.svn_prop_array_to_hash;
    pub const props = __root.svn_categorize_props;
};
pub const apr_array_header_t = struct_apr_array_header_t;
pub const struct_apr_table_entry_t = extern struct {
    key: [*c]u8 = null,
    val: [*c]u8 = null,
    key_checksum: apr_uint32_t = 0,
};
pub const apr_table_entry_t = struct_apr_table_entry_t;
pub extern fn apr_table_elts(t: ?*const apr_table_t) [*c]const apr_array_header_t;
pub extern fn apr_is_empty_table(t: ?*const apr_table_t) c_int;
pub extern fn apr_is_empty_array(a: [*c]const apr_array_header_t) c_int;
pub extern fn apr_array_make(p: ?*apr_pool_t, nelts: c_int, elt_size: c_int) [*c]apr_array_header_t;
pub extern fn apr_array_push(arr: [*c]apr_array_header_t) ?*anyopaque;
pub extern fn apr_array_pop(arr: [*c]apr_array_header_t) ?*anyopaque;
pub extern fn apr_array_clear(arr: [*c]apr_array_header_t) void;
pub extern fn apr_array_cat(dst: [*c]apr_array_header_t, src: [*c]const apr_array_header_t) void;
pub extern fn apr_array_copy(p: ?*apr_pool_t, arr: [*c]const apr_array_header_t) [*c]apr_array_header_t;
pub extern fn apr_array_copy_hdr(p: ?*apr_pool_t, arr: [*c]const apr_array_header_t) [*c]apr_array_header_t;
pub extern fn apr_array_append(p: ?*apr_pool_t, first: [*c]const apr_array_header_t, second: [*c]const apr_array_header_t) [*c]apr_array_header_t;
pub extern fn apr_array_pstrcat(p: ?*apr_pool_t, arr: [*c]const apr_array_header_t, sep: u8) [*c]u8;
pub extern fn apr_table_make(p: ?*apr_pool_t, nelts: c_int) ?*apr_table_t;
pub extern fn apr_table_copy(p: ?*apr_pool_t, t: ?*const apr_table_t) ?*apr_table_t;
pub extern fn apr_table_clone(p: ?*apr_pool_t, t: ?*const apr_table_t) ?*apr_table_t;
pub extern fn apr_table_clear(t: ?*apr_table_t) void;
pub extern fn apr_table_get(t: ?*const apr_table_t, key: [*c]const u8) [*c]const u8;
pub extern fn apr_table_getm(p: ?*apr_pool_t, t: ?*const apr_table_t, key: [*c]const u8) [*c]const u8;
pub extern fn apr_table_set(t: ?*apr_table_t, key: [*c]const u8, val: [*c]const u8) void;
pub extern fn apr_table_setn(t: ?*apr_table_t, key: [*c]const u8, val: [*c]const u8) void;
pub extern fn apr_table_unset(t: ?*apr_table_t, key: [*c]const u8) void;
pub extern fn apr_table_merge(t: ?*apr_table_t, key: [*c]const u8, val: [*c]const u8) void;
pub extern fn apr_table_mergen(t: ?*apr_table_t, key: [*c]const u8, val: [*c]const u8) void;
pub extern fn apr_table_add(t: ?*apr_table_t, key: [*c]const u8, val: [*c]const u8) void;
pub extern fn apr_table_addn(t: ?*apr_table_t, key: [*c]const u8, val: [*c]const u8) void;
pub extern fn apr_table_overlay(p: ?*apr_pool_t, overlay: ?*const apr_table_t, base: ?*const apr_table_t) ?*apr_table_t;
pub const apr_table_do_callback_fn_t = fn (rec: ?*anyopaque, key: [*c]const u8, value: [*c]const u8) callconv(.c) c_int;
pub extern fn apr_table_do(comp: ?*const apr_table_do_callback_fn_t, rec: ?*anyopaque, t: ?*const apr_table_t, ...) c_int;
pub extern fn apr_table_vdo(comp: ?*const apr_table_do_callback_fn_t, rec: ?*anyopaque, t: ?*const apr_table_t, vp: [*c]struct___va_list_tag_43) c_int;
pub extern fn apr_table_overlap(a: ?*apr_table_t, b: ?*const apr_table_t, flags: c_uint) void;
pub extern fn apr_table_compress(t: ?*apr_table_t, flags: c_uint) void;
pub extern fn readv(__fd: c_int, __iovec: [*c]const struct_iovec, __count: c_int) isize;
pub extern fn writev(__fd: c_int, __iovec: [*c]const struct_iovec, __count: c_int) isize;
pub extern fn preadv(__fd: c_int, __iovec: [*c]const struct_iovec, __count: c_int, __offset: __off_t) isize;
pub extern fn pwritev(__fd: c_int, __iovec: [*c]const struct_iovec, __count: c_int, __offset: __off_t) isize;
pub extern fn apr_strnatcmp(a: [*c]const u8, b: [*c]const u8) c_int;
pub extern fn apr_strnatcasecmp(a: [*c]const u8, b: [*c]const u8) c_int;
pub extern fn apr_pstrdup(p: ?*apr_pool_t, s: [*c]const u8) [*c]u8;
pub extern fn apr_pstrmemdup(p: ?*apr_pool_t, s: [*c]const u8, n: apr_size_t) [*c]u8;
pub extern fn apr_pstrndup(p: ?*apr_pool_t, s: [*c]const u8, n: apr_size_t) [*c]u8;
pub extern fn apr_pmemdup(p: ?*apr_pool_t, m: ?*const anyopaque, n: apr_size_t) ?*anyopaque;
pub extern fn apr_pstrcat(p: ?*apr_pool_t, ...) [*c]u8;
pub extern fn apr_pstrcatv(p: ?*apr_pool_t, vec: [*c]const struct_iovec, nvec: apr_size_t, nbytes: [*c]apr_size_t) [*c]u8;
pub extern fn apr_pvsprintf(p: ?*apr_pool_t, fmt: [*c]const u8, ap: [*c]struct___va_list_tag_43) [*c]u8;
pub extern fn apr_psprintf(p: ?*apr_pool_t, fmt: [*c]const u8, ...) [*c]u8;
pub extern fn apr_cpystrn(dst: [*c]u8, src: [*c]const u8, dst_size: apr_size_t) [*c]u8;
pub extern fn apr_collapse_spaces(dest: [*c]u8, src: [*c]const u8) [*c]u8;
pub extern fn apr_tokenize_to_argv(arg_str: [*c]const u8, argv_out: [*c][*c][*c]u8, token_context: ?*apr_pool_t) apr_status_t;
pub extern fn apr_strtok(str: [*c]u8, sep: [*c]const u8, last: [*c][*c]u8) [*c]u8;
pub extern fn apr_snprintf(buf: [*c]u8, len: apr_size_t, format: [*c]const u8, ...) c_int;
pub extern fn apr_vsnprintf(buf: [*c]u8, len: apr_size_t, format: [*c]const u8, ap: [*c]struct___va_list_tag_43) c_int;
pub extern fn apr_itoa(p: ?*apr_pool_t, n: c_int) [*c]u8;
pub extern fn apr_ltoa(p: ?*apr_pool_t, n: c_long) [*c]u8;
pub extern fn apr_off_t_toa(p: ?*apr_pool_t, n: apr_off_t) [*c]u8;
pub extern fn apr_strtoff(offset: [*c]apr_off_t, buf: [*c]const u8, end: [*c][*c]u8, base: c_int) apr_status_t;
pub extern fn apr_strtoi64(buf: [*c]const u8, end: [*c][*c]u8, base: c_int) apr_int64_t;
pub extern fn apr_atoi64(buf: [*c]const u8) apr_int64_t;
pub extern fn apr_strfsize(size: apr_off_t, buf: [*c]u8) [*c]u8;
pub const apr_uid_t = uid_t;
pub const apr_gid_t = gid_t;
pub extern fn apr_uid_current(userid: [*c]apr_uid_t, groupid: [*c]apr_gid_t, p: ?*apr_pool_t) apr_status_t;
pub extern fn apr_uid_name_get(username: [*c][*c]u8, userid: apr_uid_t, p: ?*apr_pool_t) apr_status_t;
pub extern fn apr_uid_get(userid: [*c]apr_uid_t, groupid: [*c]apr_gid_t, username: [*c]const u8, p: ?*apr_pool_t) apr_status_t;
pub extern fn apr_uid_homepath_get(dirname: [*c][*c]u8, username: [*c]const u8, p: ?*apr_pool_t) apr_status_t;
pub extern fn apr_gid_name_get(groupname: [*c][*c]u8, groupid: apr_gid_t, p: ?*apr_pool_t) apr_status_t;
pub extern fn apr_gid_get(groupid: [*c]apr_gid_t, groupname: [*c]const u8, p: ?*apr_pool_t) apr_status_t;
pub const APR_NOFILE: c_int = 0;
pub const APR_REG: c_int = 1;
pub const APR_DIR: c_int = 2;
pub const APR_CHR: c_int = 3;
pub const APR_BLK: c_int = 4;
pub const APR_PIPE: c_int = 5;
pub const APR_LNK: c_int = 6;
pub const APR_SOCK: c_int = 7;
pub const APR_UNKFILE: c_int = 127;
pub const apr_filetype_e = c_uint;
pub const struct_apr_dir_t = opaque {
    pub const apr_dir_close = __root.apr_dir_close;
    pub const apr_dir_rewind = __root.apr_dir_rewind;
    pub const svn_io_dir_close = __root.svn_io_dir_close;
    pub const close = __root.apr_dir_close;
};
pub const apr_dir_t = struct_apr_dir_t;
pub const apr_fileperms_t = apr_int32_t;
pub const apr_dev_t = dev_t;
pub const struct_apr_file_t_44 = opaque {
    pub const apr_file_close = __root.apr_file_close;
    pub const apr_file_eof = __root.apr_file_eof;
    pub const apr_file_read = __root.apr_file_read;
    pub const apr_file_write = __root.apr_file_write;
    pub const apr_file_writev = __root.apr_file_writev;
    pub const apr_file_read_full = __root.apr_file_read_full;
    pub const apr_file_write_full = __root.apr_file_write_full;
    pub const apr_file_writev_full = __root.apr_file_writev_full;
    pub const apr_file_flush = __root.apr_file_flush;
    pub const apr_file_sync = __root.apr_file_sync;
    pub const apr_file_datasync = __root.apr_file_datasync;
    pub const apr_file_dup2 = __root.apr_file_dup2;
    pub const apr_file_buffer_set = __root.apr_file_buffer_set;
    pub const apr_file_buffer_size_get = __root.apr_file_buffer_size_get;
    pub const apr_file_seek = __root.apr_file_seek;
    pub const apr_file_pipe_timeout_get = __root.apr_file_pipe_timeout_get;
    pub const apr_file_pipe_timeout_set = __root.apr_file_pipe_timeout_set;
    pub const apr_file_lock = __root.apr_file_lock;
    pub const apr_file_unlock = __root.apr_file_unlock;
    pub const apr_file_data_set = __root.apr_file_data_set;
    pub const apr_file_printf = __root.apr_file_printf;
    pub const apr_file_trunc = __root.apr_file_trunc;
    pub const apr_file_flags_get = __root.apr_file_flags_get;
    pub const apr_file_pool_get = __root.apr_file_pool_get;
    pub const apr_file_inherit_set = __root.apr_file_inherit_set;
    pub const apr_file_inherit_unset = __root.apr_file_inherit_unset;
    pub const svn_io_read_length_line = __root.svn_io_read_length_line;
    pub const svn_io_lock_open_file = __root.svn_io_lock_open_file;
    pub const svn_io_unlock_open_file = __root.svn_io_unlock_open_file;
    pub const svn_io_file_flush_to_disk = __root.svn_io_file_flush_to_disk;
    pub const svn_stream_from_aprfile2 = __root.svn_stream_from_aprfile2;
    pub const svn_stream_from_aprfile = __root.svn_stream_from_aprfile;
    pub const svn_io_file_close = __root.svn_io_file_close;
    pub const svn_io_file_read = __root.svn_io_file_read;
    pub const svn_io_file_read_full2 = __root.svn_io_file_read_full2;
    pub const svn_io_file_read_full = __root.svn_io_file_read_full;
    pub const svn_io_file_seek = __root.svn_io_file_seek;
    pub const svn_io_file_aligned_seek = __root.svn_io_file_aligned_seek;
    pub const svn_io_file_write = __root.svn_io_file_write;
    pub const svn_io_file_flush = __root.svn_io_file_flush;
    pub const svn_io_file_write_full = __root.svn_io_file_write_full;
    pub const svn_io_file_trunc = __root.svn_io_file_trunc;
    pub const svn_io_file_readline = __root.svn_io_file_readline;
    pub const svn_txdelta_skip_svndiff_window = __root.svn_txdelta_skip_svndiff_window;
    pub const close = __root.apr_file_close;
    pub const eof = __root.apr_file_eof;
    pub const read = __root.apr_file_read;
    pub const write = __root.apr_file_write;
    pub const full = __root.apr_file_read_full;
    pub const flush = __root.apr_file_flush;
    pub const sync = __root.apr_file_sync;
    pub const datasync = __root.apr_file_datasync;
    pub const dup2 = __root.apr_file_dup2;
    pub const set = __root.apr_file_buffer_set;
    pub const get = __root.apr_file_buffer_size_get;
    pub const seek = __root.apr_file_seek;
    pub const lock = __root.apr_file_lock;
    pub const unlock = __root.apr_file_unlock;
    pub const trunc = __root.apr_file_trunc;
    pub const unset = __root.apr_file_inherit_unset;
    pub const line = __root.svn_io_read_length_line;
    pub const file = __root.svn_io_lock_open_file;
    pub const disk = __root.svn_io_file_flush_to_disk;
    pub const aprfile2 = __root.svn_stream_from_aprfile2;
    pub const aprfile = __root.svn_stream_from_aprfile;
    pub const full2 = __root.svn_io_file_read_full2;
    pub const readline = __root.svn_io_file_readline;
    pub const window = __root.svn_txdelta_skip_svndiff_window;
};
pub const struct_apr_finfo_t = extern struct {
    pool: ?*apr_pool_t = null,
    valid: apr_int32_t = 0,
    protection: apr_fileperms_t = 0,
    filetype: apr_filetype_e = @import("std").mem.zeroes(apr_filetype_e),
    user: apr_uid_t = 0,
    group: apr_gid_t = 0,
    inode: apr_ino_t = 0,
    device: apr_dev_t = 0,
    nlink: apr_int32_t = 0,
    size: apr_off_t = 0,
    csize: apr_off_t = 0,
    atime: apr_time_t = 0,
    mtime: apr_time_t = 0,
    ctime: apr_time_t = 0,
    fname: [*c]const u8 = null,
    name: [*c]const u8 = null,
    filehand: ?*struct_apr_file_t_44 = null,
    pub const apr_stat = __root.apr_stat;
    pub const apr_dir_read = __root.apr_dir_read;
    pub const apr_file_info_get = __root.apr_file_info_get;
    pub const svn_io_file_info_get = __root.svn_io_file_info_get;
    pub const svn_io_stat = __root.svn_io_stat;
    pub const svn_io_dir_read = __root.svn_io_dir_read;
    pub const stat = __root.apr_stat;
    pub const read = __root.apr_dir_read;
    pub const get = __root.apr_file_info_get;
};
pub const apr_finfo_t = struct_apr_finfo_t;
pub extern fn apr_stat(finfo: [*c]apr_finfo_t, fname: [*c]const u8, wanted: apr_int32_t, pool: ?*apr_pool_t) apr_status_t;
pub extern fn apr_dir_open(new_dir: [*c]?*apr_dir_t, dirname: [*c]const u8, pool: ?*apr_pool_t) apr_status_t;
pub extern fn apr_dir_close(thedir: ?*apr_dir_t) apr_status_t;
pub extern fn apr_dir_read(finfo: [*c]apr_finfo_t, wanted: apr_int32_t, thedir: ?*apr_dir_t) apr_status_t;
pub extern fn apr_dir_rewind(thedir: ?*apr_dir_t) apr_status_t;
pub extern fn apr_filepath_root(rootpath: [*c][*c]const u8, filepath: [*c][*c]const u8, flags: apr_int32_t, p: ?*apr_pool_t) apr_status_t;
pub extern fn apr_filepath_merge(newpath: [*c][*c]u8, rootpath: [*c]const u8, addpath: [*c]const u8, flags: apr_int32_t, p: ?*apr_pool_t) apr_status_t;
pub extern fn apr_filepath_list_split(pathelts: [*c][*c]apr_array_header_t, liststr: [*c]const u8, p: ?*apr_pool_t) apr_status_t;
pub extern fn apr_filepath_list_merge(liststr: [*c][*c]u8, pathelts: [*c]apr_array_header_t, p: ?*apr_pool_t) apr_status_t;
pub extern fn apr_filepath_get(path: [*c][*c]u8, flags: apr_int32_t, p: ?*apr_pool_t) apr_status_t;
pub extern fn apr_filepath_set(path: [*c]const u8, p: ?*apr_pool_t) apr_status_t;
pub extern fn apr_filepath_encoding(style: [*c]c_int, p: ?*apr_pool_t) apr_status_t;
const union_unnamed_45 = extern union {
    __wch: c_uint,
    __wchb: [4]u8,
};
pub const __mbstate_t = extern struct {
    __count: c_int = 0,
    __value: union_unnamed_45 = @import("std").mem.zeroes(union_unnamed_45),
};
pub const struct__G_fpos_t = extern struct {
    __pos: __off_t = 0,
    __state: __mbstate_t = @import("std").mem.zeroes(__mbstate_t),
};
pub const __fpos_t = struct__G_fpos_t;
pub const struct__G_fpos64_t = extern struct {
    __pos: __off64_t = 0,
    __state: __mbstate_t = @import("std").mem.zeroes(__mbstate_t),
};
pub const __fpos64_t = struct__G_fpos64_t;
pub const struct__IO_marker = opaque {};
pub const _IO_lock_t = anyopaque;
pub const struct__IO_codecvt = opaque {};
pub const struct__IO_wide_data = opaque {};
pub const struct__IO_FILE = extern struct {
    _flags: c_int = 0,
    _IO_read_ptr: [*c]u8 = null,
    _IO_read_end: [*c]u8 = null,
    _IO_read_base: [*c]u8 = null,
    _IO_write_base: [*c]u8 = null,
    _IO_write_ptr: [*c]u8 = null,
    _IO_write_end: [*c]u8 = null,
    _IO_buf_base: [*c]u8 = null,
    _IO_buf_end: [*c]u8 = null,
    _IO_save_base: [*c]u8 = null,
    _IO_backup_base: [*c]u8 = null,
    _IO_save_end: [*c]u8 = null,
    _markers: ?*struct__IO_marker = null,
    _chain: [*c]struct__IO_FILE = null,
    _fileno: c_int = 0,
    _flags2: c_int = 0,
    _old_offset: __off_t = 0,
    _cur_column: c_ushort = 0,
    _vtable_offset: i8 = 0,
    _shortbuf: [1]u8 = @import("std").mem.zeroes([1]u8),
    _lock: ?*_IO_lock_t = null,
    _offset: __off64_t = 0,
    _codecvt: ?*struct__IO_codecvt = null,
    _wide_data: ?*struct__IO_wide_data = null,
    _freeres_list: [*c]struct__IO_FILE = null,
    _freeres_buf: ?*anyopaque = null,
    __pad5: usize = 0,
    _mode: c_int = 0,
    _unused2: [20]u8 = @import("std").mem.zeroes([20]u8),
    pub const fclose = __root.fclose;
    pub const fflush = __root.fflush;
    pub const fflush_unlocked = __root.fflush_unlocked;
    pub const setbuf = __root.setbuf;
    pub const setvbuf = __root.setvbuf;
    pub const setbuffer = __root.setbuffer;
    pub const setlinebuf = __root.setlinebuf;
    pub const fprintf = __root.fprintf;
    pub const vfprintf = __root.vfprintf;
    pub const fscanf = __root.fscanf;
    pub const vfscanf = __root.vfscanf;
    pub const fgetc = __root.fgetc;
    pub const getc = __root.getc;
    pub const getc_unlocked = __root.getc_unlocked;
    pub const fgetc_unlocked = __root.fgetc_unlocked;
    pub const getw = __root.getw;
    pub const fseek = __root.fseek;
    pub const ftell = __root.ftell;
    pub const rewind = __root.rewind;
    pub const fseeko = __root.fseeko;
    pub const ftello = __root.ftello;
    pub const fgetpos = __root.fgetpos;
    pub const fsetpos = __root.fsetpos;
    pub const clearerr = __root.clearerr;
    pub const feof = __root.feof;
    pub const ferror = __root.ferror;
    pub const clearerr_unlocked = __root.clearerr_unlocked;
    pub const feof_unlocked = __root.feof_unlocked;
    pub const ferror_unlocked = __root.ferror_unlocked;
    pub const fileno = __root.fileno;
    pub const fileno_unlocked = __root.fileno_unlocked;
    pub const pclose = __root.pclose;
    pub const flockfile = __root.flockfile;
    pub const ftrylockfile = __root.ftrylockfile;
    pub const funlockfile = __root.funlockfile;
    pub const __uflow = __root.__uflow;
    pub const __overflow = __root.__overflow;
    pub const svn_handle_warning2 = __root.svn_handle_warning2;
    pub const svn_handle_warning = __root.svn_handle_warning;
    pub const unlocked = __root.fflush_unlocked;
    pub const uflow = __root.__uflow;
    pub const overflow = __root.__overflow;
    pub const warning2 = __root.svn_handle_warning2;
    pub const warning = __root.svn_handle_warning;
};
pub const __FILE = struct__IO_FILE;
pub const FILE = struct__IO_FILE;
pub const fpos_t = __fpos_t;
pub extern var stdin: [*c]FILE;
pub extern var stdout: [*c]FILE;
pub extern var stderr: [*c]FILE;
pub extern fn remove(__filename: [*c]const u8) c_int;
pub extern fn rename(__old: [*c]const u8, __new: [*c]const u8) c_int;
pub extern fn renameat(__oldfd: c_int, __old: [*c]const u8, __newfd: c_int, __new: [*c]const u8) c_int;
pub extern fn fclose(__stream: [*c]FILE) c_int;
pub extern fn tmpfile() [*c]FILE;
pub extern fn tmpnam([*c]u8) [*c]u8;
pub extern fn tmpnam_r(__s: [*c]u8) [*c]u8;
pub extern fn tempnam(__dir: [*c]const u8, __pfx: [*c]const u8) [*c]u8;
pub extern fn fflush(__stream: [*c]FILE) c_int;
pub extern fn fflush_unlocked(__stream: [*c]FILE) c_int;
pub extern fn fopen(noalias __filename: [*c]const u8, noalias __modes: [*c]const u8) [*c]FILE;
pub extern fn freopen(noalias __filename: [*c]const u8, noalias __modes: [*c]const u8, noalias __stream: [*c]FILE) [*c]FILE;
pub extern fn fdopen(__fd: c_int, __modes: [*c]const u8) [*c]FILE;
pub extern fn fmemopen(__s: ?*anyopaque, __len: usize, __modes: [*c]const u8) [*c]FILE;
pub extern fn open_memstream(__bufloc: [*c][*c]u8, __sizeloc: [*c]usize) [*c]FILE;
pub extern fn setbuf(noalias __stream: [*c]FILE, noalias __buf: [*c]u8) void;
pub extern fn setvbuf(noalias __stream: [*c]FILE, noalias __buf: [*c]u8, __modes: c_int, __n: usize) c_int;
pub extern fn setbuffer(noalias __stream: [*c]FILE, noalias __buf: [*c]u8, __size: usize) void;
pub extern fn setlinebuf(__stream: [*c]FILE) void;
pub extern fn fprintf(noalias __stream: [*c]FILE, noalias __format: [*c]const u8, ...) c_int;
pub extern fn printf(noalias __format: [*c]const u8, ...) c_int;
pub extern fn sprintf(noalias __s: [*c]u8, noalias __format: [*c]const u8, ...) c_int;
pub extern fn vfprintf(noalias __s: [*c]FILE, noalias __format: [*c]const u8, __arg: [*c]struct___va_list_tag_43) c_int;
pub extern fn vprintf(noalias __format: [*c]const u8, __arg: [*c]struct___va_list_tag_43) c_int;
pub extern fn vsprintf(noalias __s: [*c]u8, noalias __format: [*c]const u8, __arg: [*c]struct___va_list_tag_43) c_int;
pub extern fn snprintf(noalias __s: [*c]u8, __maxlen: usize, noalias __format: [*c]const u8, ...) c_int;
pub extern fn vsnprintf(noalias __s: [*c]u8, __maxlen: usize, noalias __format: [*c]const u8, __arg: [*c]struct___va_list_tag_43) c_int;
pub extern fn vdprintf(__fd: c_int, noalias __fmt: [*c]const u8, __arg: [*c]struct___va_list_tag_43) c_int;
pub extern fn dprintf(__fd: c_int, noalias __fmt: [*c]const u8, ...) c_int;
pub extern fn fscanf(noalias __stream: [*c]FILE, noalias __format: [*c]const u8, ...) c_int;
pub extern fn scanf(noalias __format: [*c]const u8, ...) c_int;
pub extern fn sscanf(noalias __s: [*c]const u8, noalias __format: [*c]const u8, ...) c_int;
pub extern fn vfscanf(noalias __s: [*c]FILE, noalias __format: [*c]const u8, __arg: [*c]struct___va_list_tag_43) c_int;
pub extern fn vscanf(noalias __format: [*c]const u8, __arg: [*c]struct___va_list_tag_43) c_int;
pub extern fn vsscanf(noalias __s: [*c]const u8, noalias __format: [*c]const u8, __arg: [*c]struct___va_list_tag_43) c_int;
pub extern fn fgetc(__stream: [*c]FILE) c_int;
pub extern fn getc(__stream: [*c]FILE) c_int;
pub extern fn getchar() c_int;
pub extern fn getc_unlocked(__stream: [*c]FILE) c_int;
pub extern fn getchar_unlocked() c_int;
pub extern fn fgetc_unlocked(__stream: [*c]FILE) c_int;
pub extern fn fputc(__c: c_int, __stream: [*c]FILE) c_int;
pub extern fn putc(__c: c_int, __stream: [*c]FILE) c_int;
pub extern fn putchar(__c: c_int) c_int;
pub extern fn fputc_unlocked(__c: c_int, __stream: [*c]FILE) c_int;
pub extern fn putc_unlocked(__c: c_int, __stream: [*c]FILE) c_int;
pub extern fn putchar_unlocked(__c: c_int) c_int;
pub extern fn getw(__stream: [*c]FILE) c_int;
pub extern fn putw(__w: c_int, __stream: [*c]FILE) c_int;
pub extern fn fgets(noalias __s: [*c]u8, __n: c_int, noalias __stream: [*c]FILE) [*c]u8;
pub extern fn __getdelim(noalias __lineptr: [*c][*c]u8, noalias __n: [*c]usize, __delimiter: c_int, noalias __stream: [*c]FILE) __ssize_t;
pub extern fn getdelim(noalias __lineptr: [*c][*c]u8, noalias __n: [*c]usize, __delimiter: c_int, noalias __stream: [*c]FILE) __ssize_t;
pub extern fn getline(noalias __lineptr: [*c][*c]u8, noalias __n: [*c]usize, noalias __stream: [*c]FILE) __ssize_t;
pub extern fn fputs(noalias __s: [*c]const u8, noalias __stream: [*c]FILE) c_int;
pub extern fn puts(__s: [*c]const u8) c_int;
pub extern fn ungetc(__c: c_int, __stream: [*c]FILE) c_int;
pub extern fn fread(noalias __ptr: ?*anyopaque, __size: usize, __n: usize, noalias __stream: [*c]FILE) usize;
pub extern fn fwrite(noalias __ptr: ?*const anyopaque, __size: usize, __n: usize, noalias __s: [*c]FILE) usize;
pub extern fn fread_unlocked(noalias __ptr: ?*anyopaque, __size: usize, __n: usize, noalias __stream: [*c]FILE) usize;
pub extern fn fwrite_unlocked(noalias __ptr: ?*const anyopaque, __size: usize, __n: usize, noalias __stream: [*c]FILE) usize;
pub extern fn fseek(__stream: [*c]FILE, __off: c_long, __whence: c_int) c_int;
pub extern fn ftell(__stream: [*c]FILE) c_long;
pub extern fn rewind(__stream: [*c]FILE) void;
pub extern fn fseeko(__stream: [*c]FILE, __off: __off_t, __whence: c_int) c_int;
pub extern fn ftello(__stream: [*c]FILE) __off_t;
pub extern fn fgetpos(noalias __stream: [*c]FILE, noalias __pos: [*c]fpos_t) c_int;
pub extern fn fsetpos(__stream: [*c]FILE, __pos: [*c]const fpos_t) c_int;
pub extern fn clearerr(__stream: [*c]FILE) void;
pub extern fn feof(__stream: [*c]FILE) c_int;
pub extern fn ferror(__stream: [*c]FILE) c_int;
pub extern fn clearerr_unlocked(__stream: [*c]FILE) void;
pub extern fn feof_unlocked(__stream: [*c]FILE) c_int;
pub extern fn ferror_unlocked(__stream: [*c]FILE) c_int;
pub extern fn perror(__s: [*c]const u8) void;
pub extern fn fileno(__stream: [*c]FILE) c_int;
pub extern fn fileno_unlocked(__stream: [*c]FILE) c_int;
pub extern fn pclose(__stream: [*c]FILE) c_int;
pub extern fn popen(__command: [*c]const u8, __modes: [*c]const u8) [*c]FILE;
pub extern fn ctermid(__s: [*c]u8) [*c]u8;
pub extern fn flockfile(__stream: [*c]FILE) void;
pub extern fn ftrylockfile(__stream: [*c]FILE) c_int;
pub extern fn funlockfile(__stream: [*c]FILE) void;
pub extern fn __uflow([*c]FILE) c_int;
pub extern fn __overflow([*c]FILE, c_int) c_int;
pub const apr_fileattrs_t = apr_uint32_t;
pub const apr_seek_where_t = c_int;
pub const apr_file_t = struct_apr_file_t_44;
pub extern fn apr_file_open(newf: [*c]?*apr_file_t, fname: [*c]const u8, flag: apr_int32_t, perm: apr_fileperms_t, pool: ?*apr_pool_t) apr_status_t;
pub extern fn apr_file_close(file: ?*apr_file_t) apr_status_t;
pub extern fn apr_file_remove(path: [*c]const u8, pool: ?*apr_pool_t) apr_status_t;
pub extern fn apr_file_rename(from_path: [*c]const u8, to_path: [*c]const u8, pool: ?*apr_pool_t) apr_status_t;
pub extern fn apr_file_link(from_path: [*c]const u8, to_path: [*c]const u8) apr_status_t;
pub extern fn apr_file_copy(from_path: [*c]const u8, to_path: [*c]const u8, perms: apr_fileperms_t, pool: ?*apr_pool_t) apr_status_t;
pub extern fn apr_file_append(from_path: [*c]const u8, to_path: [*c]const u8, perms: apr_fileperms_t, pool: ?*apr_pool_t) apr_status_t;
pub extern fn apr_file_eof(fptr: ?*apr_file_t) apr_status_t;
pub extern fn apr_file_open_stderr(thefile: [*c]?*apr_file_t, pool: ?*apr_pool_t) apr_status_t;
pub extern fn apr_file_open_stdout(thefile: [*c]?*apr_file_t, pool: ?*apr_pool_t) apr_status_t;
pub extern fn apr_file_open_stdin(thefile: [*c]?*apr_file_t, pool: ?*apr_pool_t) apr_status_t;
pub extern fn apr_file_open_flags_stderr(thefile: [*c]?*apr_file_t, flags: apr_int32_t, pool: ?*apr_pool_t) apr_status_t;
pub extern fn apr_file_open_flags_stdout(thefile: [*c]?*apr_file_t, flags: apr_int32_t, pool: ?*apr_pool_t) apr_status_t;
pub extern fn apr_file_open_flags_stdin(thefile: [*c]?*apr_file_t, flags: apr_int32_t, pool: ?*apr_pool_t) apr_status_t;
pub extern fn apr_file_read(thefile: ?*apr_file_t, buf: ?*anyopaque, nbytes: [*c]apr_size_t) apr_status_t;
pub extern fn apr_file_write(thefile: ?*apr_file_t, buf: ?*const anyopaque, nbytes: [*c]apr_size_t) apr_status_t;
pub extern fn apr_file_writev(thefile: ?*apr_file_t, vec: [*c]const struct_iovec, nvec: apr_size_t, nbytes: [*c]apr_size_t) apr_status_t;
pub extern fn apr_file_read_full(thefile: ?*apr_file_t, buf: ?*anyopaque, nbytes: apr_size_t, bytes_read: [*c]apr_size_t) apr_status_t;
pub extern fn apr_file_write_full(thefile: ?*apr_file_t, buf: ?*const anyopaque, nbytes: apr_size_t, bytes_written: [*c]apr_size_t) apr_status_t;
pub extern fn apr_file_writev_full(thefile: ?*apr_file_t, vec: [*c]const struct_iovec, nvec: apr_size_t, nbytes: [*c]apr_size_t) apr_status_t;
pub extern fn apr_file_putc(ch: u8, thefile: ?*apr_file_t) apr_status_t;
pub extern fn apr_file_getc(ch: [*c]u8, thefile: ?*apr_file_t) apr_status_t;
pub extern fn apr_file_ungetc(ch: u8, thefile: ?*apr_file_t) apr_status_t;
pub extern fn apr_file_gets(str: [*c]u8, len: c_int, thefile: ?*apr_file_t) apr_status_t;
pub extern fn apr_file_puts(str: [*c]const u8, thefile: ?*apr_file_t) apr_status_t;
pub extern fn apr_file_flush(thefile: ?*apr_file_t) apr_status_t;
pub extern fn apr_file_sync(thefile: ?*apr_file_t) apr_status_t;
pub extern fn apr_file_datasync(thefile: ?*apr_file_t) apr_status_t;
pub extern fn apr_file_dup(new_file: [*c]?*apr_file_t, old_file: ?*apr_file_t, p: ?*apr_pool_t) apr_status_t;
pub extern fn apr_file_dup2(new_file: ?*apr_file_t, old_file: ?*apr_file_t, p: ?*apr_pool_t) apr_status_t;
pub extern fn apr_file_setaside(new_file: [*c]?*apr_file_t, old_file: ?*apr_file_t, p: ?*apr_pool_t) apr_status_t;
pub extern fn apr_file_buffer_set(thefile: ?*apr_file_t, buffer: [*c]u8, bufsize: apr_size_t) apr_status_t;
pub extern fn apr_file_buffer_size_get(thefile: ?*apr_file_t) apr_size_t;
pub extern fn apr_file_seek(thefile: ?*apr_file_t, where: apr_seek_where_t, offset: [*c]apr_off_t) apr_status_t;
pub extern fn apr_file_pipe_create(in: [*c]?*apr_file_t, out: [*c]?*apr_file_t, pool: ?*apr_pool_t) apr_status_t;
pub extern fn apr_file_pipe_create_ex(in: [*c]?*apr_file_t, out: [*c]?*apr_file_t, blocking: apr_int32_t, pool: ?*apr_pool_t) apr_status_t;
pub extern fn apr_file_pipe_create_pools(in: [*c]?*apr_file_t, out: [*c]?*apr_file_t, blocking: apr_int32_t, pool_in: ?*apr_pool_t, pool_out: ?*apr_pool_t) apr_status_t;
pub extern fn apr_file_namedpipe_create(filename: [*c]const u8, perm: apr_fileperms_t, pool: ?*apr_pool_t) apr_status_t;
pub extern fn apr_file_pipe_timeout_get(thepipe: ?*apr_file_t, timeout: [*c]apr_interval_time_t) apr_status_t;
pub extern fn apr_file_pipe_timeout_set(thepipe: ?*apr_file_t, timeout: apr_interval_time_t) apr_status_t;
pub extern fn apr_file_lock(thefile: ?*apr_file_t, @"type": c_int) apr_status_t;
pub extern fn apr_file_unlock(thefile: ?*apr_file_t) apr_status_t;
pub extern fn apr_file_name_get(new_path: [*c][*c]const u8, thefile: ?*apr_file_t) apr_status_t;
pub extern fn apr_file_data_get(data: [*c]?*anyopaque, key: [*c]const u8, file: ?*apr_file_t) apr_status_t;
pub extern fn apr_file_data_set(file: ?*apr_file_t, data: ?*anyopaque, key: [*c]const u8, cleanup: ?*const fn (?*anyopaque) callconv(.c) apr_status_t) apr_status_t;
pub extern fn apr_file_printf(fptr: ?*apr_file_t, format: [*c]const u8, ...) c_int;
pub extern fn apr_file_perms_set(fname: [*c]const u8, perms: apr_fileperms_t) apr_status_t;
pub extern fn apr_file_attrs_set(fname: [*c]const u8, attributes: apr_fileattrs_t, attr_mask: apr_fileattrs_t, pool: ?*apr_pool_t) apr_status_t;
pub extern fn apr_file_mtime_set(fname: [*c]const u8, mtime: apr_time_t, pool: ?*apr_pool_t) apr_status_t;
pub extern fn apr_dir_make(path: [*c]const u8, perm: apr_fileperms_t, pool: ?*apr_pool_t) apr_status_t;
pub extern fn apr_dir_make_recursive(path: [*c]const u8, perm: apr_fileperms_t, pool: ?*apr_pool_t) apr_status_t;
pub extern fn apr_dir_remove(path: [*c]const u8, pool: ?*apr_pool_t) apr_status_t;
pub extern fn apr_file_info_get(finfo: [*c]apr_finfo_t, wanted: apr_int32_t, thefile: ?*apr_file_t) apr_status_t;
pub extern fn apr_file_trunc(fp: ?*apr_file_t, offset: apr_off_t) apr_status_t;
pub extern fn apr_file_flags_get(f: ?*apr_file_t) apr_int32_t;
pub extern fn apr_file_pool_get(thefile: ?*const apr_file_t) ?*apr_pool_t;
pub extern fn apr_file_inherit_set(thefile: ?*apr_file_t) apr_status_t;
pub extern fn apr_file_inherit_unset(thefile: ?*apr_file_t) apr_status_t;
pub extern fn apr_file_mktemp(fp: [*c]?*apr_file_t, templ: [*c]u8, flags: apr_int32_t, p: ?*apr_pool_t) apr_status_t;
pub extern fn apr_temp_dir_get(temp_dir: [*c][*c]const u8, p: ?*apr_pool_t) apr_status_t;
pub const struct_svn_error_t = extern struct {
    apr_err: apr_status_t = 0,
    message: [*c]const u8 = null,
    child: [*c]struct_svn_error_t = null,
    pool: ?*apr_pool_t = null,
    file: [*c]const u8 = null,
    line: c_long = 0,
    pub const svn_err_best_message = __root.svn_err_best_message;
    pub const svn_error_quick_wrap = __root.svn_error_quick_wrap;
    pub const svn_error_quick_wrapf = __root.svn_error_quick_wrapf;
    pub const svn_error_compose_create = __root.svn_error_compose_create;
    pub const svn_error_compose = __root.svn_error_compose;
    pub const svn_error_root_cause = __root.svn_error_root_cause;
    pub const svn_error_find_cause = __root.svn_error_find_cause;
    pub const svn_error_dup = __root.svn_error_dup;
    pub const svn_error_clear = __root.svn_error_clear;
    pub const svn_handle_error2 = __root.svn_handle_error2;
    pub const svn_handle_error = __root.svn_handle_error;
    pub const svn_error_purge_tracing = __root.svn_error_purge_tracing;
    pub const wrap = __root.svn_error_quick_wrap;
    pub const wrapf = __root.svn_error_quick_wrapf;
    pub const create = __root.svn_error_compose_create;
    pub const compose = __root.svn_error_compose;
    pub const cause = __root.svn_error_root_cause;
    pub const dup = __root.svn_error_dup;
    pub const clear = __root.svn_error_clear;
    pub const error2 = __root.svn_handle_error2;
    pub const @"error" = __root.svn_handle_error;
    pub const tracing = __root.svn_error_purge_tracing;
};
pub const svn_node_none: c_int = 0;
pub const svn_node_file: c_int = 1;
pub const svn_node_dir: c_int = 2;
pub const svn_node_unknown: c_int = 3;
pub const svn_node_symlink: c_int = 4;
pub const enum_svn_node_kind_t = c_uint;
pub const svn_node_kind_t = enum_svn_node_kind_t;
pub const svn_tristate_false: c_int = 2;
pub const svn_tristate_true: c_int = 3;
pub const svn_tristate_unknown: c_int = 4;
pub const enum_svn_tristate_t = c_uint;
pub const svn_tristate_t = enum_svn_tristate_t;
pub const svn_revnum_t = c_long;
pub const svn_depth_unknown: c_int = -2;
pub const svn_depth_exclude: c_int = -1;
pub const svn_depth_empty: c_int = 0;
pub const svn_depth_files: c_int = 1;
pub const svn_depth_immediates: c_int = 2;
pub const svn_depth_infinity: c_int = 3;
pub const enum_svn_depth_t = c_int;
pub const svn_depth_t = enum_svn_depth_t;
pub const div_t = extern struct {
    quot: c_int = 0,
    rem: c_int = 0,
};
pub const ldiv_t = extern struct {
    quot: c_long = 0,
    rem: c_long = 0,
};
pub const lldiv_t = extern struct {
    quot: c_longlong = 0,
    rem: c_longlong = 0,
};
pub extern fn __ctype_get_mb_cur_max() usize;
pub extern fn atof(__nptr: [*c]const u8) f64;
pub extern fn atoi(__nptr: [*c]const u8) c_int;
pub extern fn atol(__nptr: [*c]const u8) c_long;
pub extern fn atoll(__nptr: [*c]const u8) c_longlong;
pub extern fn strtod(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8) f64;
pub extern fn strtof(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8) f32;
pub extern fn strtold(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8) c_longdouble;
pub extern fn strtol(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8, __base: c_int) c_long;
pub extern fn strtoul(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8, __base: c_int) c_ulong;
pub extern fn strtoq(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8, __base: c_int) c_longlong;
pub extern fn strtouq(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8, __base: c_int) c_ulonglong;
pub extern fn strtoll(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8, __base: c_int) c_longlong;
pub extern fn strtoull(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8, __base: c_int) c_ulonglong;
pub extern fn l64a(__n: c_long) [*c]u8;
pub extern fn a64l(__s: [*c]const u8) c_long;
pub extern fn random() c_long;
pub extern fn srandom(__seed: c_uint) void;
pub extern fn initstate(__seed: c_uint, __statebuf: [*c]u8, __statelen: usize) [*c]u8;
pub extern fn setstate(__statebuf: [*c]u8) [*c]u8;
pub const struct_random_data = extern struct {
    fptr: [*c]i32 = null,
    rptr: [*c]i32 = null,
    state: [*c]i32 = null,
    rand_type: c_int = 0,
    rand_deg: c_int = 0,
    rand_sep: c_int = 0,
    end_ptr: [*c]i32 = null,
    pub const random_r = __root.random_r;
    pub const r = __root.random_r;
};
pub extern fn random_r(noalias __buf: [*c]struct_random_data, noalias __result: [*c]i32) c_int;
pub extern fn srandom_r(__seed: c_uint, __buf: [*c]struct_random_data) c_int;
pub extern fn initstate_r(__seed: c_uint, noalias __statebuf: [*c]u8, __statelen: usize, noalias __buf: [*c]struct_random_data) c_int;
pub extern fn setstate_r(noalias __statebuf: [*c]u8, noalias __buf: [*c]struct_random_data) c_int;
pub extern fn rand() c_int;
pub extern fn srand(__seed: c_uint) void;
pub extern fn rand_r(__seed: [*c]c_uint) c_int;
pub extern fn drand48() f64;
pub extern fn erand48(__xsubi: [*c]c_ushort) f64;
pub extern fn lrand48() c_long;
pub extern fn nrand48(__xsubi: [*c]c_ushort) c_long;
pub extern fn mrand48() c_long;
pub extern fn jrand48(__xsubi: [*c]c_ushort) c_long;
pub extern fn srand48(__seedval: c_long) void;
pub extern fn seed48(__seed16v: [*c]c_ushort) [*c]c_ushort;
pub extern fn lcong48(__param: [*c]c_ushort) void;
pub const struct_drand48_data = extern struct {
    __x: [3]c_ushort = @import("std").mem.zeroes([3]c_ushort),
    __old_x: [3]c_ushort = @import("std").mem.zeroes([3]c_ushort),
    __c: c_ushort = 0,
    __init: c_ushort = 0,
    __a: c_ulonglong = 0,
    pub const drand48_r = __root.drand48_r;
    pub const lrand48_r = __root.lrand48_r;
    pub const mrand48_r = __root.mrand48_r;
    pub const r = __root.drand48_r;
};
pub extern fn drand48_r(noalias __buffer: [*c]struct_drand48_data, noalias __result: [*c]f64) c_int;
pub extern fn erand48_r(__xsubi: [*c]c_ushort, noalias __buffer: [*c]struct_drand48_data, noalias __result: [*c]f64) c_int;
pub extern fn lrand48_r(noalias __buffer: [*c]struct_drand48_data, noalias __result: [*c]c_long) c_int;
pub extern fn nrand48_r(__xsubi: [*c]c_ushort, noalias __buffer: [*c]struct_drand48_data, noalias __result: [*c]c_long) c_int;
pub extern fn mrand48_r(noalias __buffer: [*c]struct_drand48_data, noalias __result: [*c]c_long) c_int;
pub extern fn jrand48_r(__xsubi: [*c]c_ushort, noalias __buffer: [*c]struct_drand48_data, noalias __result: [*c]c_long) c_int;
pub extern fn srand48_r(__seedval: c_long, __buffer: [*c]struct_drand48_data) c_int;
pub extern fn seed48_r(__seed16v: [*c]c_ushort, __buffer: [*c]struct_drand48_data) c_int;
pub extern fn lcong48_r(__param: [*c]c_ushort, __buffer: [*c]struct_drand48_data) c_int;
pub extern fn malloc(__size: usize) ?*anyopaque;
pub extern fn calloc(__nmemb: usize, __size: usize) ?*anyopaque;
pub extern fn realloc(__ptr: ?*anyopaque, __size: usize) ?*anyopaque;
pub extern fn free(__ptr: ?*anyopaque) void;
pub extern fn reallocarray(__ptr: ?*anyopaque, __nmemb: usize, __size: usize) ?*anyopaque;
pub extern fn alloca(__size: usize) ?*anyopaque;
pub extern fn valloc(__size: usize) ?*anyopaque;
pub extern fn posix_memalign(__memptr: [*c]?*anyopaque, __alignment: usize, __size: usize) c_int;
pub extern fn aligned_alloc(__alignment: usize, __size: usize) ?*anyopaque;
pub extern fn abort() noreturn;
pub extern fn atexit(__func: ?*const fn () callconv(.c) void) c_int;
pub extern fn at_quick_exit(__func: ?*const fn () callconv(.c) void) c_int;
pub extern fn on_exit(__func: ?*const fn (__status: c_int, __arg: ?*anyopaque) callconv(.c) void, __arg: ?*anyopaque) c_int;
pub extern fn exit(__status: c_int) noreturn;
pub extern fn quick_exit(__status: c_int) noreturn;
pub extern fn _Exit(__status: c_int) noreturn;
pub extern fn getenv(__name: [*c]const u8) [*c]u8;
pub extern fn putenv(__string: [*c]u8) c_int;
pub extern fn setenv(__name: [*c]const u8, __value: [*c]const u8, __replace: c_int) c_int;
pub extern fn unsetenv(__name: [*c]const u8) c_int;
pub extern fn clearenv() c_int;
pub extern fn mktemp(__template: [*c]u8) [*c]u8;
pub extern fn mkstemp(__template: [*c]u8) c_int;
pub extern fn mkstemps(__template: [*c]u8, __suffixlen: c_int) c_int;
pub extern fn mkdtemp(__template: [*c]u8) [*c]u8;
pub extern fn system(__command: [*c]const u8) c_int;
pub extern fn realpath(noalias __name: [*c]const u8, noalias __resolved: [*c]u8) [*c]u8;
pub const __compar_fn_t = ?*const fn (?*const anyopaque, ?*const anyopaque) callconv(.c) c_int;
pub extern fn bsearch(__key: ?*const anyopaque, __base: ?*const anyopaque, __nmemb: usize, __size: usize, __compar: __compar_fn_t) ?*anyopaque;
pub extern fn qsort(__base: ?*anyopaque, __nmemb: usize, __size: usize, __compar: __compar_fn_t) void;
pub extern fn abs(__x: c_int) c_int;
pub extern fn labs(__x: c_long) c_long;
pub extern fn llabs(__x: c_longlong) c_longlong;
pub extern fn div(__numer: c_int, __denom: c_int) div_t;
pub extern fn ldiv(__numer: c_long, __denom: c_long) ldiv_t;
pub extern fn lldiv(__numer: c_longlong, __denom: c_longlong) lldiv_t;
pub extern fn ecvt(__value: f64, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int) [*c]u8;
pub extern fn fcvt(__value: f64, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int) [*c]u8;
pub extern fn gcvt(__value: f64, __ndigit: c_int, __buf: [*c]u8) [*c]u8;
pub extern fn qecvt(__value: c_longdouble, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int) [*c]u8;
pub extern fn qfcvt(__value: c_longdouble, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int) [*c]u8;
pub extern fn qgcvt(__value: c_longdouble, __ndigit: c_int, __buf: [*c]u8) [*c]u8;
pub extern fn ecvt_r(__value: f64, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int, noalias __buf: [*c]u8, __len: usize) c_int;
pub extern fn fcvt_r(__value: f64, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int, noalias __buf: [*c]u8, __len: usize) c_int;
pub extern fn qecvt_r(__value: c_longdouble, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int, noalias __buf: [*c]u8, __len: usize) c_int;
pub extern fn qfcvt_r(__value: c_longdouble, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int, noalias __buf: [*c]u8, __len: usize) c_int;
pub extern fn mblen(__s: [*c]const u8, __n: usize) c_int;
pub extern fn mbtowc(noalias __pwc: [*c]wchar_t, noalias __s: [*c]const u8, __n: usize) c_int;
pub extern fn wctomb(__s: [*c]u8, __wchar: wchar_t) c_int;
pub extern fn mbstowcs(noalias __pwcs: [*c]wchar_t, noalias __s: [*c]const u8, __n: usize) usize;
pub extern fn wcstombs(noalias __s: [*c]u8, noalias __pwcs: [*c]const wchar_t, __n: usize) usize;
pub extern fn rpmatch(__response: [*c]const u8) c_int;
pub extern fn getsubopt(noalias __optionp: [*c][*c]u8, noalias __tokens: [*c]const [*c]u8, noalias __valuep: [*c][*c]u8) c_int;
pub extern fn getloadavg(__loadavg: [*c]f64, __nelem: c_int) c_int;
pub const apr_version_t = extern struct {
    major: c_int = 0,
    minor: c_int = 0,
    patch: c_int = 0,
    is_dev: c_int = 0,
    pub const apr_version = __root.apr_version;
    pub const version = __root.apr_version;
};
pub extern fn apr_version(pvsn: [*c]apr_version_t) void;
pub extern fn apr_version_string() [*c]const u8;
pub const svn_boolean_t = c_int;
pub const struct_svn__null_pointer_constant_stdarg_sentinel_t = opaque {};
pub const svn_error_t = struct_svn_error_t;
pub const struct_svn_version_t = extern struct {
    major: c_int = 0,
    minor: c_int = 0,
    patch: c_int = 0,
    tag: [*c]const u8 = null,
    pub const svn_ver_compatible = __root.svn_ver_compatible;
    pub const svn_ver_equal = __root.svn_ver_equal;
    pub const svn_ver_check_list2 = __root.svn_ver_check_list2;
    pub const svn_ver_check_list = __root.svn_ver_check_list;
    pub const compatible = __root.svn_ver_compatible;
    pub const equal = __root.svn_ver_equal;
    pub const list2 = __root.svn_ver_check_list2;
    pub const list = __root.svn_ver_check_list;
};
pub const svn_version_t = struct_svn_version_t;
pub extern fn svn_node_kind_to_word(kind: svn_node_kind_t) [*c]const u8;
pub extern fn svn_node_kind_from_word(word: [*c]const u8) svn_node_kind_t;
pub extern fn svn_tristate__to_word(tristate: svn_tristate_t) [*c]const u8;
pub extern fn svn_tristate__from_word(word: [*c]const u8) svn_tristate_t;
pub extern fn svn_revnum_parse(rev: [*c]svn_revnum_t, str: [*c]const u8, endptr: [*c][*c]const u8) [*c]svn_error_t;
pub const svn_filesize_t = apr_int64_t;
pub const svn_nonrecursive: c_int = 1;
pub const svn_recursive: c_int = 2;
pub const enum_svn_recurse_kind = c_uint;
pub extern fn svn_depth_to_word(depth: svn_depth_t) [*c]const u8;
pub extern fn svn_depth_from_word(word: [*c]const u8) svn_depth_t;
pub const struct_svn_dirent_t = extern struct {
    kind: svn_node_kind_t = @import("std").mem.zeroes(svn_node_kind_t),
    size: svn_filesize_t = 0,
    has_props: svn_boolean_t = 0,
    created_rev: svn_revnum_t = 0,
    time: apr_time_t = 0,
    last_author: [*c]const u8 = null,
    pub const svn_dirent_dup = __root.svn_dirent_dup;
    pub const dup = __root.svn_dirent_dup;
};
pub const svn_dirent_t = struct_svn_dirent_t;
pub extern fn svn_dirent_dup(dirent: [*c]const svn_dirent_t, pool: ?*apr_pool_t) [*c]svn_dirent_t;
pub extern fn svn_dirent_create(result_pool: ?*apr_pool_t) [*c]svn_dirent_t;
pub const struct_svn_commit_info_t = extern struct {
    revision: svn_revnum_t = 0,
    date: [*c]const u8 = null,
    author: [*c]const u8 = null,
    post_commit_err: [*c]const u8 = null,
    repos_root: [*c]const u8 = null,
    pub const svn_commit_info_dup = __root.svn_commit_info_dup;
    pub const dup = __root.svn_commit_info_dup;
};
pub const svn_commit_info_t = struct_svn_commit_info_t;
pub extern fn svn_create_commit_info(pool: ?*apr_pool_t) [*c]svn_commit_info_t;
pub extern fn svn_commit_info_dup(src_commit_info: [*c]const svn_commit_info_t, pool: ?*apr_pool_t) [*c]svn_commit_info_t;
pub const struct_svn_log_changed_path2_t = extern struct {
    action: u8 = 0,
    copyfrom_path: [*c]const u8 = null,
    copyfrom_rev: svn_revnum_t = 0,
    node_kind: svn_node_kind_t = @import("std").mem.zeroes(svn_node_kind_t),
    text_modified: svn_tristate_t = @import("std").mem.zeroes(svn_tristate_t),
    props_modified: svn_tristate_t = @import("std").mem.zeroes(svn_tristate_t),
    pub const svn_log_changed_path2_dup = __root.svn_log_changed_path2_dup;
    pub const dup = __root.svn_log_changed_path2_dup;
};
pub const svn_log_changed_path2_t = struct_svn_log_changed_path2_t;
pub extern fn svn_log_changed_path2_create(pool: ?*apr_pool_t) [*c]svn_log_changed_path2_t;
pub extern fn svn_log_changed_path2_dup(changed_path: [*c]const svn_log_changed_path2_t, pool: ?*apr_pool_t) [*c]svn_log_changed_path2_t;
pub const struct_svn_log_changed_path_t = extern struct {
    action: u8 = 0,
    copyfrom_path: [*c]const u8 = null,
    copyfrom_rev: svn_revnum_t = 0,
    pub const svn_log_changed_path_dup = __root.svn_log_changed_path_dup;
    pub const dup = __root.svn_log_changed_path_dup;
};
pub const svn_log_changed_path_t = struct_svn_log_changed_path_t;
pub extern fn svn_log_changed_path_dup(changed_path: [*c]const svn_log_changed_path_t, pool: ?*apr_pool_t) [*c]svn_log_changed_path_t;
pub const struct_svn_log_entry_t = extern struct {
    changed_paths: ?*apr_hash_t = null,
    revision: svn_revnum_t = 0,
    revprops: ?*apr_hash_t = null,
    has_children: svn_boolean_t = 0,
    changed_paths2: ?*apr_hash_t = null,
    non_inheritable: svn_boolean_t = 0,
    subtractive_merge: svn_boolean_t = 0,
    pub const svn_log_entry_dup = __root.svn_log_entry_dup;
    pub const dup = __root.svn_log_entry_dup;
};
pub const svn_log_entry_t = struct_svn_log_entry_t;
pub extern fn svn_log_entry_create(pool: ?*apr_pool_t) [*c]svn_log_entry_t;
pub extern fn svn_log_entry_dup(log_entry: [*c]const svn_log_entry_t, pool: ?*apr_pool_t) [*c]svn_log_entry_t;
pub const svn_log_entry_receiver_t = ?*const fn (baton: ?*anyopaque, log_entry: [*c]svn_log_entry_t, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t;
pub const svn_log_message_receiver_t = ?*const fn (baton: ?*anyopaque, changed_paths: ?*apr_hash_t, revision: svn_revnum_t, author: [*c]const u8, date: [*c]const u8, message: [*c]const u8, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t;
pub const svn_commit_callback2_t = ?*const fn (commit_info: [*c]const svn_commit_info_t, baton: ?*anyopaque, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t;
pub const svn_commit_callback_t = ?*const fn (new_revision: svn_revnum_t, date: [*c]const u8, author: [*c]const u8, baton: ?*anyopaque) callconv(.c) [*c]svn_error_t;
pub extern fn svn_mime_type_validate(mime_type: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_mime_type_is_binary(mime_type: [*c]const u8) svn_boolean_t;
pub const svn_cancel_func_t = ?*const fn (cancel_baton: ?*anyopaque) callconv(.c) [*c]svn_error_t;
pub const struct_svn_lock_t = extern struct {
    path: [*c]const u8 = null,
    token: [*c]const u8 = null,
    owner: [*c]const u8 = null,
    comment: [*c]const u8 = null,
    is_dav_comment: svn_boolean_t = 0,
    creation_date: apr_time_t = 0,
    expiration_date: apr_time_t = 0,
    pub const svn_lock_dup = __root.svn_lock_dup;
    pub const dup = __root.svn_lock_dup;
};
pub const svn_lock_t = struct_svn_lock_t;
pub extern fn svn_lock_create(pool: ?*apr_pool_t) [*c]svn_lock_t;
pub extern fn svn_lock_dup(lock: [*c]const svn_lock_t, pool: ?*apr_pool_t) [*c]svn_lock_t;
pub extern fn svn_uuid_generate(pool: ?*apr_pool_t) [*c]const u8;
pub const struct_svn_merge_range_t = extern struct {
    start: svn_revnum_t = 0,
    end: svn_revnum_t = 0,
    inheritable: svn_boolean_t = 0,
    pub const svn_merge_range_dup = __root.svn_merge_range_dup;
    pub const svn_merge_range_contains_rev = __root.svn_merge_range_contains_rev;
    pub const dup = __root.svn_merge_range_dup;
    pub const rev = __root.svn_merge_range_contains_rev;
};
pub const svn_merge_range_t = struct_svn_merge_range_t;
pub extern fn svn_merge_range_dup(range: [*c]const svn_merge_range_t, pool: ?*apr_pool_t) [*c]svn_merge_range_t;
pub extern fn svn_merge_range_contains_rev(range: [*c]const svn_merge_range_t, rev: svn_revnum_t) svn_boolean_t;
pub const struct_svn_location_segment_t = extern struct {
    range_start: svn_revnum_t = 0,
    range_end: svn_revnum_t = 0,
    path: [*c]const u8 = null,
    pub const svn_location_segment_dup = __root.svn_location_segment_dup;
    pub const dup = __root.svn_location_segment_dup;
};
pub const svn_location_segment_t = struct_svn_location_segment_t;
pub const svn_location_segment_receiver_t = ?*const fn (segment: [*c]svn_location_segment_t, baton: ?*anyopaque, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t;
pub extern fn svn_location_segment_dup(segment: [*c]const svn_location_segment_t, pool: ?*apr_pool_t) [*c]svn_location_segment_t;
pub const svn_linenum_t = c_ulong;
pub const SVN_WARNING: c_int = 120001;
pub const SVN_ERR_BAD_CONTAINING_POOL: c_int = 125000;
pub const SVN_ERR_BAD_FILENAME: c_int = 125001;
pub const SVN_ERR_BAD_URL: c_int = 125002;
pub const SVN_ERR_BAD_DATE: c_int = 125003;
pub const SVN_ERR_BAD_MIME_TYPE: c_int = 125004;
pub const SVN_ERR_BAD_PROPERTY_VALUE: c_int = 125005;
pub const SVN_ERR_BAD_VERSION_FILE_FORMAT: c_int = 125006;
pub const SVN_ERR_BAD_RELATIVE_PATH: c_int = 125007;
pub const SVN_ERR_BAD_UUID: c_int = 125008;
pub const SVN_ERR_BAD_CONFIG_VALUE: c_int = 125009;
pub const SVN_ERR_BAD_SERVER_SPECIFICATION: c_int = 125010;
pub const SVN_ERR_BAD_CHECKSUM_KIND: c_int = 125011;
pub const SVN_ERR_BAD_CHECKSUM_PARSE: c_int = 125012;
pub const SVN_ERR_BAD_TOKEN: c_int = 125013;
pub const SVN_ERR_BAD_CHANGELIST_NAME: c_int = 125014;
pub const SVN_ERR_BAD_ATOMIC: c_int = 125015;
pub const SVN_ERR_BAD_COMPRESSION_METHOD: c_int = 125016;
pub const SVN_ERR_BAD_PROPERTY_VALUE_EOL: c_int = 125017;
pub const SVN_ERR_XML_ATTRIB_NOT_FOUND: c_int = 130000;
pub const SVN_ERR_XML_MISSING_ANCESTRY: c_int = 130001;
pub const SVN_ERR_XML_UNKNOWN_ENCODING: c_int = 130002;
pub const SVN_ERR_XML_MALFORMED: c_int = 130003;
pub const SVN_ERR_XML_UNESCAPABLE_DATA: c_int = 130004;
pub const SVN_ERR_XML_UNEXPECTED_ELEMENT: c_int = 130005;
pub const SVN_ERR_IO_INCONSISTENT_EOL: c_int = 135000;
pub const SVN_ERR_IO_UNKNOWN_EOL: c_int = 135001;
pub const SVN_ERR_IO_CORRUPT_EOL: c_int = 135002;
pub const SVN_ERR_IO_UNIQUE_NAMES_EXHAUSTED: c_int = 135003;
pub const SVN_ERR_IO_PIPE_FRAME_ERROR: c_int = 135004;
pub const SVN_ERR_IO_PIPE_READ_ERROR: c_int = 135005;
pub const SVN_ERR_IO_WRITE_ERROR: c_int = 135006;
pub const SVN_ERR_IO_PIPE_WRITE_ERROR: c_int = 135007;
pub const SVN_ERR_STREAM_UNEXPECTED_EOF: c_int = 140000;
pub const SVN_ERR_STREAM_MALFORMED_DATA: c_int = 140001;
pub const SVN_ERR_STREAM_UNRECOGNIZED_DATA: c_int = 140002;
pub const SVN_ERR_STREAM_SEEK_NOT_SUPPORTED: c_int = 140003;
pub const SVN_ERR_STREAM_NOT_SUPPORTED: c_int = 140004;
pub const SVN_ERR_NODE_UNKNOWN_KIND: c_int = 145000;
pub const SVN_ERR_NODE_UNEXPECTED_KIND: c_int = 145001;
pub const SVN_ERR_ENTRY_NOT_FOUND: c_int = 150000;
pub const SVN_ERR_ENTRY_EXISTS: c_int = 150002;
pub const SVN_ERR_ENTRY_MISSING_REVISION: c_int = 150003;
pub const SVN_ERR_ENTRY_MISSING_URL: c_int = 150004;
pub const SVN_ERR_ENTRY_ATTRIBUTE_INVALID: c_int = 150005;
pub const SVN_ERR_ENTRY_FORBIDDEN: c_int = 150006;
pub const SVN_ERR_WC_OBSTRUCTED_UPDATE: c_int = 155000;
pub const SVN_ERR_WC_UNWIND_MISMATCH: c_int = 155001;
pub const SVN_ERR_WC_UNWIND_EMPTY: c_int = 155002;
pub const SVN_ERR_WC_UNWIND_NOT_EMPTY: c_int = 155003;
pub const SVN_ERR_WC_LOCKED: c_int = 155004;
pub const SVN_ERR_WC_NOT_LOCKED: c_int = 155005;
pub const SVN_ERR_WC_INVALID_LOCK: c_int = 155006;
pub const SVN_ERR_WC_NOT_WORKING_COPY: c_int = 155007;
pub const SVN_ERR_WC_NOT_DIRECTORY: c_int = 155007;
pub const SVN_ERR_WC_NOT_FILE: c_int = 155008;
pub const SVN_ERR_WC_BAD_ADM_LOG: c_int = 155009;
pub const SVN_ERR_WC_PATH_NOT_FOUND: c_int = 155010;
pub const SVN_ERR_WC_NOT_UP_TO_DATE: c_int = 155011;
pub const SVN_ERR_WC_LEFT_LOCAL_MOD: c_int = 155012;
pub const SVN_ERR_WC_SCHEDULE_CONFLICT: c_int = 155013;
pub const SVN_ERR_WC_PATH_FOUND: c_int = 155014;
pub const SVN_ERR_WC_FOUND_CONFLICT: c_int = 155015;
pub const SVN_ERR_WC_CORRUPT: c_int = 155016;
pub const SVN_ERR_WC_CORRUPT_TEXT_BASE: c_int = 155017;
pub const SVN_ERR_WC_NODE_KIND_CHANGE: c_int = 155018;
pub const SVN_ERR_WC_INVALID_OP_ON_CWD: c_int = 155019;
pub const SVN_ERR_WC_BAD_ADM_LOG_START: c_int = 155020;
pub const SVN_ERR_WC_UNSUPPORTED_FORMAT: c_int = 155021;
pub const SVN_ERR_WC_BAD_PATH: c_int = 155022;
pub const SVN_ERR_WC_INVALID_SCHEDULE: c_int = 155023;
pub const SVN_ERR_WC_INVALID_RELOCATION: c_int = 155024;
pub const SVN_ERR_WC_INVALID_SWITCH: c_int = 155025;
pub const SVN_ERR_WC_MISMATCHED_CHANGELIST: c_int = 155026;
pub const SVN_ERR_WC_CONFLICT_RESOLVER_FAILURE: c_int = 155027;
pub const SVN_ERR_WC_COPYFROM_PATH_NOT_FOUND: c_int = 155028;
pub const SVN_ERR_WC_CHANGELIST_MOVE: c_int = 155029;
pub const SVN_ERR_WC_CANNOT_DELETE_FILE_EXTERNAL: c_int = 155030;
pub const SVN_ERR_WC_CANNOT_MOVE_FILE_EXTERNAL: c_int = 155031;
pub const SVN_ERR_WC_DB_ERROR: c_int = 155032;
pub const SVN_ERR_WC_MISSING: c_int = 155033;
pub const SVN_ERR_WC_NOT_SYMLINK: c_int = 155034;
pub const SVN_ERR_WC_PATH_UNEXPECTED_STATUS: c_int = 155035;
pub const SVN_ERR_WC_UPGRADE_REQUIRED: c_int = 155036;
pub const SVN_ERR_WC_CLEANUP_REQUIRED: c_int = 155037;
pub const SVN_ERR_WC_INVALID_OPERATION_DEPTH: c_int = 155038;
pub const SVN_ERR_WC_PATH_ACCESS_DENIED: c_int = 155039;
pub const SVN_ERR_WC_MIXED_REVISIONS: c_int = 155040;
pub const SVN_ERR_WC_DUPLICATE_EXTERNALS_TARGET: c_int = 155041;
pub const SVN_ERR_WC_INCOMPATIBLE_SETTINGS: c_int = 155042;
pub const SVN_ERR_WC_DEPRECATED_API_STORE_PRISTINE: c_int = 155043;
pub const SVN_ERR_WC_PRISTINE_DEHYDRATED: c_int = 155044;
pub const SVN_ERR_FS_GENERAL: c_int = 160000;
pub const SVN_ERR_FS_CLEANUP: c_int = 160001;
pub const SVN_ERR_FS_ALREADY_OPEN: c_int = 160002;
pub const SVN_ERR_FS_NOT_OPEN: c_int = 160003;
pub const SVN_ERR_FS_CORRUPT: c_int = 160004;
pub const SVN_ERR_FS_PATH_SYNTAX: c_int = 160005;
pub const SVN_ERR_FS_NO_SUCH_REVISION: c_int = 160006;
pub const SVN_ERR_FS_NO_SUCH_TRANSACTION: c_int = 160007;
pub const SVN_ERR_FS_NO_SUCH_ENTRY: c_int = 160008;
pub const SVN_ERR_FS_NO_SUCH_REPRESENTATION: c_int = 160009;
pub const SVN_ERR_FS_NO_SUCH_STRING: c_int = 160010;
pub const SVN_ERR_FS_NO_SUCH_COPY: c_int = 160011;
pub const SVN_ERR_FS_TRANSACTION_NOT_MUTABLE: c_int = 160012;
pub const SVN_ERR_FS_NOT_FOUND: c_int = 160013;
pub const SVN_ERR_FS_ID_NOT_FOUND: c_int = 160014;
pub const SVN_ERR_FS_NOT_ID: c_int = 160015;
pub const SVN_ERR_FS_NOT_DIRECTORY: c_int = 160016;
pub const SVN_ERR_FS_NOT_FILE: c_int = 160017;
pub const SVN_ERR_FS_NOT_SINGLE_PATH_COMPONENT: c_int = 160018;
pub const SVN_ERR_FS_NOT_MUTABLE: c_int = 160019;
pub const SVN_ERR_FS_ALREADY_EXISTS: c_int = 160020;
pub const SVN_ERR_FS_ROOT_DIR: c_int = 160021;
pub const SVN_ERR_FS_NOT_TXN_ROOT: c_int = 160022;
pub const SVN_ERR_FS_NOT_REVISION_ROOT: c_int = 160023;
pub const SVN_ERR_FS_CONFLICT: c_int = 160024;
pub const SVN_ERR_FS_REP_CHANGED: c_int = 160025;
pub const SVN_ERR_FS_REP_NOT_MUTABLE: c_int = 160026;
pub const SVN_ERR_FS_MALFORMED_SKEL: c_int = 160027;
pub const SVN_ERR_FS_TXN_OUT_OF_DATE: c_int = 160028;
pub const SVN_ERR_FS_BERKELEY_DB: c_int = 160029;
pub const SVN_ERR_FS_BERKELEY_DB_DEADLOCK: c_int = 160030;
pub const SVN_ERR_FS_TRANSACTION_DEAD: c_int = 160031;
pub const SVN_ERR_FS_TRANSACTION_NOT_DEAD: c_int = 160032;
pub const SVN_ERR_FS_UNKNOWN_FS_TYPE: c_int = 160033;
pub const SVN_ERR_FS_NO_USER: c_int = 160034;
pub const SVN_ERR_FS_PATH_ALREADY_LOCKED: c_int = 160035;
pub const SVN_ERR_FS_PATH_NOT_LOCKED: c_int = 160036;
pub const SVN_ERR_FS_BAD_LOCK_TOKEN: c_int = 160037;
pub const SVN_ERR_FS_NO_LOCK_TOKEN: c_int = 160038;
pub const SVN_ERR_FS_LOCK_OWNER_MISMATCH: c_int = 160039;
pub const SVN_ERR_FS_NO_SUCH_LOCK: c_int = 160040;
pub const SVN_ERR_FS_LOCK_EXPIRED: c_int = 160041;
pub const SVN_ERR_FS_OUT_OF_DATE: c_int = 160042;
pub const SVN_ERR_FS_UNSUPPORTED_FORMAT: c_int = 160043;
pub const SVN_ERR_FS_REP_BEING_WRITTEN: c_int = 160044;
pub const SVN_ERR_FS_TXN_NAME_TOO_LONG: c_int = 160045;
pub const SVN_ERR_FS_NO_SUCH_NODE_ORIGIN: c_int = 160046;
pub const SVN_ERR_FS_UNSUPPORTED_UPGRADE: c_int = 160047;
pub const SVN_ERR_FS_NO_SUCH_CHECKSUM_REP: c_int = 160048;
pub const SVN_ERR_FS_PROP_BASEVALUE_MISMATCH: c_int = 160049;
pub const SVN_ERR_FS_INCORRECT_EDITOR_COMPLETION: c_int = 160050;
pub const SVN_ERR_FS_PACKED_REVPROP_READ_FAILURE: c_int = 160051;
pub const SVN_ERR_FS_REVPROP_CACHE_INIT_FAILURE: c_int = 160052;
pub const SVN_ERR_FS_MALFORMED_TXN_ID: c_int = 160053;
pub const SVN_ERR_FS_INDEX_CORRUPTION: c_int = 160054;
pub const SVN_ERR_FS_INDEX_REVISION: c_int = 160055;
pub const SVN_ERR_FS_INDEX_OVERFLOW: c_int = 160056;
pub const SVN_ERR_FS_CONTAINER_INDEX: c_int = 160057;
pub const SVN_ERR_FS_INDEX_INCONSISTENT: c_int = 160058;
pub const SVN_ERR_FS_LOCK_OPERATION_FAILED: c_int = 160059;
pub const SVN_ERR_FS_UNSUPPORTED_TYPE: c_int = 160060;
pub const SVN_ERR_FS_CONTAINER_SIZE: c_int = 160061;
pub const SVN_ERR_FS_MALFORMED_NODEREV_ID: c_int = 160062;
pub const SVN_ERR_FS_INVALID_GENERATION: c_int = 160063;
pub const SVN_ERR_FS_CORRUPT_REVPROP_MANIFEST: c_int = 160064;
pub const SVN_ERR_FS_CORRUPT_PROPLIST: c_int = 160065;
pub const SVN_ERR_FS_AMBIGUOUS_CHECKSUM_REP: c_int = 160067;
pub const SVN_ERR_FS_UNRECOGNIZED_IOCTL_CODE: c_int = 160068;
pub const SVN_ERR_FS_REP_SHARING_NOT_ALLOWED: c_int = 160069;
pub const SVN_ERR_FS_REP_SHARING_NOT_SUPPORTED: c_int = 160070;
pub const SVN_ERR_REPOS_LOCKED: c_int = 165000;
pub const SVN_ERR_REPOS_HOOK_FAILURE: c_int = 165001;
pub const SVN_ERR_REPOS_BAD_ARGS: c_int = 165002;
pub const SVN_ERR_REPOS_NO_DATA_FOR_REPORT: c_int = 165003;
pub const SVN_ERR_REPOS_BAD_REVISION_REPORT: c_int = 165004;
pub const SVN_ERR_REPOS_UNSUPPORTED_VERSION: c_int = 165005;
pub const SVN_ERR_REPOS_DISABLED_FEATURE: c_int = 165006;
pub const SVN_ERR_REPOS_POST_COMMIT_HOOK_FAILED: c_int = 165007;
pub const SVN_ERR_REPOS_POST_LOCK_HOOK_FAILED: c_int = 165008;
pub const SVN_ERR_REPOS_POST_UNLOCK_HOOK_FAILED: c_int = 165009;
pub const SVN_ERR_REPOS_UNSUPPORTED_UPGRADE: c_int = 165010;
pub const SVN_ERR_RA_ILLEGAL_URL: c_int = 170000;
pub const SVN_ERR_RA_NOT_AUTHORIZED: c_int = 170001;
pub const SVN_ERR_RA_UNKNOWN_AUTH: c_int = 170002;
pub const SVN_ERR_RA_NOT_IMPLEMENTED: c_int = 170003;
pub const SVN_ERR_RA_OUT_OF_DATE: c_int = 170004;
pub const SVN_ERR_RA_NO_REPOS_UUID: c_int = 170005;
pub const SVN_ERR_RA_UNSUPPORTED_ABI_VERSION: c_int = 170006;
pub const SVN_ERR_RA_NOT_LOCKED: c_int = 170007;
pub const SVN_ERR_RA_PARTIAL_REPLAY_NOT_SUPPORTED: c_int = 170008;
pub const SVN_ERR_RA_UUID_MISMATCH: c_int = 170009;
pub const SVN_ERR_RA_REPOS_ROOT_URL_MISMATCH: c_int = 170010;
pub const SVN_ERR_RA_SESSION_URL_MISMATCH: c_int = 170011;
pub const SVN_ERR_RA_CANNOT_CREATE_TUNNEL: c_int = 170012;
pub const SVN_ERR_RA_CANNOT_CREATE_SESSION: c_int = 170013;
pub const SVN_ERR_RA_DAV_SOCK_INIT: c_int = 175000;
pub const SVN_ERR_RA_DAV_CREATING_REQUEST: c_int = 175001;
pub const SVN_ERR_RA_DAV_REQUEST_FAILED: c_int = 175002;
pub const SVN_ERR_RA_DAV_OPTIONS_REQ_FAILED: c_int = 175003;
pub const SVN_ERR_RA_DAV_PROPS_NOT_FOUND: c_int = 175004;
pub const SVN_ERR_RA_DAV_ALREADY_EXISTS: c_int = 175005;
pub const SVN_ERR_RA_DAV_INVALID_CONFIG_VALUE: c_int = 175006;
pub const SVN_ERR_RA_DAV_PATH_NOT_FOUND: c_int = 175007;
pub const SVN_ERR_RA_DAV_PROPPATCH_FAILED: c_int = 175008;
pub const SVN_ERR_RA_DAV_MALFORMED_DATA: c_int = 175009;
pub const SVN_ERR_RA_DAV_RESPONSE_HEADER_BADNESS: c_int = 175010;
pub const SVN_ERR_RA_DAV_RELOCATED: c_int = 175011;
pub const SVN_ERR_RA_DAV_CONN_TIMEOUT: c_int = 175012;
pub const SVN_ERR_RA_DAV_FORBIDDEN: c_int = 175013;
pub const SVN_ERR_RA_DAV_PRECONDITION_FAILED: c_int = 175014;
pub const SVN_ERR_RA_DAV_METHOD_NOT_ALLOWED: c_int = 175015;
pub const SVN_ERR_RA_LOCAL_REPOS_NOT_FOUND: c_int = 180000;
pub const SVN_ERR_RA_LOCAL_REPOS_OPEN_FAILED: c_int = 180001;
pub const SVN_ERR_SVNDIFF_INVALID_HEADER: c_int = 185000;
pub const SVN_ERR_SVNDIFF_CORRUPT_WINDOW: c_int = 185001;
pub const SVN_ERR_SVNDIFF_BACKWARD_VIEW: c_int = 185002;
pub const SVN_ERR_SVNDIFF_INVALID_OPS: c_int = 185003;
pub const SVN_ERR_SVNDIFF_UNEXPECTED_END: c_int = 185004;
pub const SVN_ERR_SVNDIFF_INVALID_COMPRESSED_DATA: c_int = 185005;
pub const SVN_ERR_APMOD_MISSING_PATH_TO_FS: c_int = 190000;
pub const SVN_ERR_APMOD_MALFORMED_URI: c_int = 190001;
pub const SVN_ERR_APMOD_ACTIVITY_NOT_FOUND: c_int = 190002;
pub const SVN_ERR_APMOD_BAD_BASELINE: c_int = 190003;
pub const SVN_ERR_APMOD_CONNECTION_ABORTED: c_int = 190004;
pub const SVN_ERR_CLIENT_VERSIONED_PATH_REQUIRED: c_int = 195000;
pub const SVN_ERR_CLIENT_RA_ACCESS_REQUIRED: c_int = 195001;
pub const SVN_ERR_CLIENT_BAD_REVISION: c_int = 195002;
pub const SVN_ERR_CLIENT_DUPLICATE_COMMIT_URL: c_int = 195003;
pub const SVN_ERR_CLIENT_IS_BINARY_FILE: c_int = 195004;
pub const SVN_ERR_CLIENT_INVALID_EXTERNALS_DESCRIPTION: c_int = 195005;
pub const SVN_ERR_CLIENT_MODIFIED: c_int = 195006;
pub const SVN_ERR_CLIENT_IS_DIRECTORY: c_int = 195007;
pub const SVN_ERR_CLIENT_REVISION_RANGE: c_int = 195008;
pub const SVN_ERR_CLIENT_INVALID_RELOCATION: c_int = 195009;
pub const SVN_ERR_CLIENT_REVISION_AUTHOR_CONTAINS_NEWLINE: c_int = 195010;
pub const SVN_ERR_CLIENT_PROPERTY_NAME: c_int = 195011;
pub const SVN_ERR_CLIENT_UNRELATED_RESOURCES: c_int = 195012;
pub const SVN_ERR_CLIENT_MISSING_LOCK_TOKEN: c_int = 195013;
pub const SVN_ERR_CLIENT_MULTIPLE_SOURCES_DISALLOWED: c_int = 195014;
pub const SVN_ERR_CLIENT_NO_VERSIONED_PARENT: c_int = 195015;
pub const SVN_ERR_CLIENT_NOT_READY_TO_MERGE: c_int = 195016;
pub const SVN_ERR_CLIENT_FILE_EXTERNAL_OVERWRITE_VERSIONED: c_int = 195017;
pub const SVN_ERR_CLIENT_PATCH_BAD_STRIP_COUNT: c_int = 195018;
pub const SVN_ERR_CLIENT_CYCLE_DETECTED: c_int = 195019;
pub const SVN_ERR_CLIENT_MERGE_UPDATE_REQUIRED: c_int = 195020;
pub const SVN_ERR_CLIENT_INVALID_MERGEINFO_NO_MERGETRACKING: c_int = 195021;
pub const SVN_ERR_CLIENT_NO_LOCK_TOKEN: c_int = 195022;
pub const SVN_ERR_CLIENT_FORBIDDEN_BY_SERVER: c_int = 195023;
pub const SVN_ERR_CLIENT_CONFLICT_OPTION_NOT_APPLICABLE: c_int = 195024;
pub const SVN_ERR_BASE: c_int = 200000;
pub const SVN_ERR_PLUGIN_LOAD_FAILURE: c_int = 200001;
pub const SVN_ERR_MALFORMED_FILE: c_int = 200002;
pub const SVN_ERR_INCOMPLETE_DATA: c_int = 200003;
pub const SVN_ERR_INCORRECT_PARAMS: c_int = 200004;
pub const SVN_ERR_UNVERSIONED_RESOURCE: c_int = 200005;
pub const SVN_ERR_TEST_FAILED: c_int = 200006;
pub const SVN_ERR_UNSUPPORTED_FEATURE: c_int = 200007;
pub const SVN_ERR_BAD_PROP_KIND: c_int = 200008;
pub const SVN_ERR_ILLEGAL_TARGET: c_int = 200009;
pub const SVN_ERR_DELTA_MD5_CHECKSUM_ABSENT: c_int = 200010;
pub const SVN_ERR_DIR_NOT_EMPTY: c_int = 200011;
pub const SVN_ERR_EXTERNAL_PROGRAM: c_int = 200012;
pub const SVN_ERR_SWIG_PY_EXCEPTION_SET: c_int = 200013;
pub const SVN_ERR_CHECKSUM_MISMATCH: c_int = 200014;
pub const SVN_ERR_CANCELLED: c_int = 200015;
pub const SVN_ERR_INVALID_DIFF_OPTION: c_int = 200016;
pub const SVN_ERR_PROPERTY_NOT_FOUND: c_int = 200017;
pub const SVN_ERR_NO_AUTH_FILE_PATH: c_int = 200018;
pub const SVN_ERR_VERSION_MISMATCH: c_int = 200019;
pub const SVN_ERR_MERGEINFO_PARSE_ERROR: c_int = 200020;
pub const SVN_ERR_CEASE_INVOCATION: c_int = 200021;
pub const SVN_ERR_REVNUM_PARSE_FAILURE: c_int = 200022;
pub const SVN_ERR_ITER_BREAK: c_int = 200023;
pub const SVN_ERR_UNKNOWN_CHANGELIST: c_int = 200024;
pub const SVN_ERR_RESERVED_FILENAME_SPECIFIED: c_int = 200025;
pub const SVN_ERR_UNKNOWN_CAPABILITY: c_int = 200026;
pub const SVN_ERR_TEST_SKIPPED: c_int = 200027;
pub const SVN_ERR_NO_APR_MEMCACHE: c_int = 200028;
pub const SVN_ERR_ATOMIC_INIT_FAILURE: c_int = 200029;
pub const SVN_ERR_SQLITE_ERROR: c_int = 200030;
pub const SVN_ERR_SQLITE_READONLY: c_int = 200031;
pub const SVN_ERR_SQLITE_UNSUPPORTED_SCHEMA: c_int = 200032;
pub const SVN_ERR_SQLITE_BUSY: c_int = 200033;
pub const SVN_ERR_SQLITE_RESETTING_FOR_ROLLBACK: c_int = 200034;
pub const SVN_ERR_SQLITE_CONSTRAINT: c_int = 200035;
pub const SVN_ERR_TOO_MANY_MEMCACHED_SERVERS: c_int = 200036;
pub const SVN_ERR_MALFORMED_VERSION_STRING: c_int = 200037;
pub const SVN_ERR_CORRUPTED_ATOMIC_STORAGE: c_int = 200038;
pub const SVN_ERR_UTF8PROC_ERROR: c_int = 200039;
pub const SVN_ERR_UTF8_GLOB: c_int = 200040;
pub const SVN_ERR_CORRUPT_PACKED_DATA: c_int = 200041;
pub const SVN_ERR_COMPOSED_ERROR: c_int = 200042;
pub const SVN_ERR_INVALID_INPUT: c_int = 200043;
pub const SVN_ERR_SQLITE_ROLLBACK_FAILED: c_int = 200044;
pub const SVN_ERR_LZ4_COMPRESSION_FAILED: c_int = 200045;
pub const SVN_ERR_LZ4_DECOMPRESSION_FAILED: c_int = 200046;
pub const SVN_ERR_CANONICALIZATION_FAILED: c_int = 200047;
pub const SVN_ERR_BCRYPT: c_int = 200048;
pub const SVN_ERR_OPT_REVISION_PARSE_ERROR: c_int = 200049;
pub const SVN_ERR_CL_ARG_PARSING_ERROR: c_int = 205000;
pub const SVN_ERR_CL_INSUFFICIENT_ARGS: c_int = 205001;
pub const SVN_ERR_CL_MUTUALLY_EXCLUSIVE_ARGS: c_int = 205002;
pub const SVN_ERR_CL_ADM_DIR_RESERVED: c_int = 205003;
pub const SVN_ERR_CL_LOG_MESSAGE_IS_VERSIONED_FILE: c_int = 205004;
pub const SVN_ERR_CL_LOG_MESSAGE_IS_PATHNAME: c_int = 205005;
pub const SVN_ERR_CL_COMMIT_IN_ADDED_DIR: c_int = 205006;
pub const SVN_ERR_CL_NO_EXTERNAL_EDITOR: c_int = 205007;
pub const SVN_ERR_CL_BAD_LOG_MESSAGE: c_int = 205008;
pub const SVN_ERR_CL_UNNECESSARY_LOG_MESSAGE: c_int = 205009;
pub const SVN_ERR_CL_NO_EXTERNAL_MERGE_TOOL: c_int = 205010;
pub const SVN_ERR_CL_ERROR_PROCESSING_EXTERNALS: c_int = 205011;
pub const SVN_ERR_CL_REPOS_VERIFY_FAILED: c_int = 205012;
pub const SVN_ERR_RA_SVN_CMD_ERR: c_int = 210000;
pub const SVN_ERR_RA_SVN_UNKNOWN_CMD: c_int = 210001;
pub const SVN_ERR_RA_SVN_CONNECTION_CLOSED: c_int = 210002;
pub const SVN_ERR_RA_SVN_IO_ERROR: c_int = 210003;
pub const SVN_ERR_RA_SVN_MALFORMED_DATA: c_int = 210004;
pub const SVN_ERR_RA_SVN_REPOS_NOT_FOUND: c_int = 210005;
pub const SVN_ERR_RA_SVN_BAD_VERSION: c_int = 210006;
pub const SVN_ERR_RA_SVN_NO_MECHANISMS: c_int = 210007;
pub const SVN_ERR_RA_SVN_EDIT_ABORTED: c_int = 210008;
pub const SVN_ERR_RA_SVN_REQUEST_SIZE: c_int = 210009;
pub const SVN_ERR_RA_SVN_RESPONSE_SIZE: c_int = 210010;
pub const SVN_ERR_AUTHN_CREDS_UNAVAILABLE: c_int = 215000;
pub const SVN_ERR_AUTHN_NO_PROVIDER: c_int = 215001;
pub const SVN_ERR_AUTHN_PROVIDERS_EXHAUSTED: c_int = 215002;
pub const SVN_ERR_AUTHN_CREDS_NOT_SAVED: c_int = 215003;
pub const SVN_ERR_AUTHN_FAILED: c_int = 215004;
pub const SVN_ERR_AUTHZ_ROOT_UNREADABLE: c_int = 220000;
pub const SVN_ERR_AUTHZ_UNREADABLE: c_int = 220001;
pub const SVN_ERR_AUTHZ_PARTIALLY_READABLE: c_int = 220002;
pub const SVN_ERR_AUTHZ_INVALID_CONFIG: c_int = 220003;
pub const SVN_ERR_AUTHZ_UNWRITABLE: c_int = 220004;
pub const SVN_ERR_DIFF_DATASOURCE_MODIFIED: c_int = 225000;
pub const SVN_ERR_DIFF_UNEXPECTED_DATA: c_int = 225001;
pub const SVN_ERR_RA_SERF_SSPI_INITIALISATION_FAILED: c_int = 230000;
pub const SVN_ERR_RA_SERF_SSL_CERT_UNTRUSTED: c_int = 230001;
pub const SVN_ERR_RA_SERF_GSSAPI_INITIALISATION_FAILED: c_int = 230002;
pub const SVN_ERR_RA_SERF_WRAPPED_ERROR: c_int = 230003;
pub const SVN_ERR_RA_SERF_STREAM_BUCKET_READ_ERROR: c_int = 230004;
pub const SVN_ERR_ASSERTION_FAIL: c_int = 235000;
pub const SVN_ERR_ASSERTION_ONLY_TRACING_LINKS: c_int = 235001;
pub const SVN_ERR_ASN1_OUT_OF_DATA: c_int = 240000;
pub const SVN_ERR_ASN1_UNEXPECTED_TAG: c_int = 240001;
pub const SVN_ERR_ASN1_INVALID_LENGTH: c_int = 240002;
pub const SVN_ERR_ASN1_LENGTH_MISMATCH: c_int = 240003;
pub const SVN_ERR_ASN1_INVALID_DATA: c_int = 240004;
pub const SVN_ERR_X509_FEATURE_UNAVAILABLE: c_int = 240005;
pub const SVN_ERR_X509_CERT_INVALID_PEM: c_int = 240006;
pub const SVN_ERR_X509_CERT_INVALID_FORMAT: c_int = 240007;
pub const SVN_ERR_X509_CERT_INVALID_VERSION: c_int = 240008;
pub const SVN_ERR_X509_CERT_INVALID_SERIAL: c_int = 240009;
pub const SVN_ERR_X509_CERT_INVALID_ALG: c_int = 240010;
pub const SVN_ERR_X509_CERT_INVALID_NAME: c_int = 240011;
pub const SVN_ERR_X509_CERT_INVALID_DATE: c_int = 240012;
pub const SVN_ERR_X509_CERT_INVALID_PUBKEY: c_int = 240013;
pub const SVN_ERR_X509_CERT_INVALID_SIGNATURE: c_int = 240014;
pub const SVN_ERR_X509_CERT_INVALID_EXTENSIONS: c_int = 240015;
pub const SVN_ERR_X509_CERT_UNKNOWN_VERSION: c_int = 240016;
pub const SVN_ERR_X509_CERT_UNKNOWN_PK_ALG: c_int = 240017;
pub const SVN_ERR_X509_CERT_SIG_MISMATCH: c_int = 240018;
pub const SVN_ERR_X509_CERT_VERIFY_FAILED: c_int = 240019;
pub const SVN_ERR_LAST: c_int = 240020;
pub const enum_svn_errno_t = c_uint;
pub const svn_errno_t = enum_svn_errno_t;
pub extern fn svn_strerror(statcode: apr_status_t, buf: [*c]u8, bufsize: apr_size_t) [*c]u8;
pub extern fn svn_error_symbolic_name(statcode: apr_status_t) [*c]const u8;
pub extern fn svn_err_best_message(err: [*c]const svn_error_t, buf: [*c]u8, bufsize: apr_size_t) [*c]const u8;
pub extern fn svn_error_create(apr_err: apr_status_t, child: [*c]svn_error_t, message: [*c]const u8) [*c]svn_error_t;
pub extern fn svn_error_createf(apr_err: apr_status_t, child: [*c]svn_error_t, fmt: [*c]const u8, ...) [*c]svn_error_t;
pub extern fn svn_error_wrap_apr(status: apr_status_t, fmt: [*c]const u8, ...) [*c]svn_error_t;
pub extern fn svn_error_quick_wrap(child: [*c]svn_error_t, new_msg: [*c]const u8) [*c]svn_error_t;
pub extern fn svn_error_quick_wrapf(child: [*c]svn_error_t, fmt: [*c]const u8, ...) [*c]svn_error_t;
pub extern fn svn_error_compose_create(err1: [*c]svn_error_t, err2: [*c]svn_error_t) [*c]svn_error_t;
pub extern fn svn_error_compose(chain: [*c]svn_error_t, new_err: [*c]svn_error_t) void;
pub extern fn svn_error_root_cause(err: [*c]svn_error_t) [*c]svn_error_t;
pub extern fn svn_error_find_cause(err: [*c]svn_error_t, apr_err: apr_status_t) [*c]svn_error_t;
pub extern fn svn_error_dup(err: [*c]const svn_error_t) [*c]svn_error_t;
pub extern fn svn_error_clear(@"error": [*c]svn_error_t) void;
pub extern fn svn_handle_error2(@"error": [*c]svn_error_t, stream: [*c]FILE, fatal: svn_boolean_t, prefix: [*c]const u8) void;
pub extern fn svn_handle_error(@"error": [*c]svn_error_t, stream: [*c]FILE, fatal: svn_boolean_t) void;
pub extern fn svn_handle_warning2(stream: [*c]FILE, @"error": [*c]const svn_error_t, prefix: [*c]const u8) void;
pub extern fn svn_handle_warning(stream: [*c]FILE, @"error": [*c]svn_error_t) void;
pub extern fn svn_error_purge_tracing(err: [*c]svn_error_t) [*c]svn_error_t;
pub extern fn svn_error__malfunction(can_return: svn_boolean_t, file: [*c]const u8, line: c_int, expr: [*c]const u8) [*c]svn_error_t;
pub const svn_error_malfunction_handler_t = ?*const fn (can_return: svn_boolean_t, file: [*c]const u8, line: c_int, expr: [*c]const u8) callconv(.c) [*c]svn_error_t;
pub extern fn svn_error_set_malfunction_handler(func: svn_error_malfunction_handler_t) svn_error_malfunction_handler_t;
pub extern fn svn_error_get_malfunction_handler() svn_error_malfunction_handler_t;
pub extern fn svn_error_raise_on_malfunction(can_return: svn_boolean_t, file: [*c]const u8, line: c_int, expr: [*c]const u8) [*c]svn_error_t;
pub extern fn svn_error_abort_on_malfunction(can_return: svn_boolean_t, file: [*c]const u8, line: c_int, expr: [*c]const u8) [*c]svn_error_t;
pub const struct_svn_string_t = extern struct {
    data: [*c]const u8 = null,
    len: apr_size_t = 0,
    pub const svn_string_isempty = __root.svn_string_isempty;
    pub const svn_string_dup = __root.svn_string_dup;
    pub const svn_string_compare = __root.svn_string_compare;
    pub const svn_string_first_non_whitespace = __root.svn_string_first_non_whitespace;
    pub const svn_string_find_char_backward = __root.svn_string_find_char_backward;
    pub const svn_stringbuf_create_from_string = __root.svn_stringbuf_create_from_string;
    pub const svn_string_compare_stringbuf = __root.svn_string_compare_stringbuf;
    pub const svn_stream_from_string = __root.svn_stream_from_string;
    pub const svn_txdelta_send_string = __root.svn_txdelta_send_string;
    pub const isempty = __root.svn_string_isempty;
    pub const dup = __root.svn_string_dup;
    pub const compare = __root.svn_string_compare;
    pub const whitespace = __root.svn_string_first_non_whitespace;
    pub const backward = __root.svn_string_find_char_backward;
    pub const string = __root.svn_stringbuf_create_from_string;
    pub const stringbuf = __root.svn_string_compare_stringbuf;
};
pub const svn_string_t = struct_svn_string_t;
pub const struct_svn_stringbuf_t = extern struct {
    pool: ?*apr_pool_t = null,
    data: [*c]u8 = null,
    len: apr_size_t = 0,
    blocksize: apr_size_t = 0,
    pub const svn_string_create_from_buf = __root.svn_string_create_from_buf;
    pub const svn_stringbuf_ensure = __root.svn_stringbuf_ensure;
    pub const svn_stringbuf_set = __root.svn_stringbuf_set;
    pub const svn_stringbuf_setempty = __root.svn_stringbuf_setempty;
    pub const svn_stringbuf_isempty = __root.svn_stringbuf_isempty;
    pub const svn_stringbuf_chop = __root.svn_stringbuf_chop;
    pub const svn_stringbuf_leftchop = __root.svn_stringbuf_leftchop;
    pub const svn_stringbuf_fillchar = __root.svn_stringbuf_fillchar;
    pub const svn_stringbuf_appendbyte = __root.svn_stringbuf_appendbyte;
    pub const svn_stringbuf_appendbytes = __root.svn_stringbuf_appendbytes;
    pub const svn_stringbuf_appendfill = __root.svn_stringbuf_appendfill;
    pub const svn_stringbuf_appendstr = __root.svn_stringbuf_appendstr;
    pub const svn_stringbuf_appendcstr = __root.svn_stringbuf_appendcstr;
    pub const svn_stringbuf_insert = __root.svn_stringbuf_insert;
    pub const svn_stringbuf_remove = __root.svn_stringbuf_remove;
    pub const svn_stringbuf_replace = __root.svn_stringbuf_replace;
    pub const svn_stringbuf_replace_all = __root.svn_stringbuf_replace_all;
    pub const svn_stringbuf_dup = __root.svn_stringbuf_dup;
    pub const svn_stringbuf_compare = __root.svn_stringbuf_compare;
    pub const svn_stringbuf_first_non_whitespace = __root.svn_stringbuf_first_non_whitespace;
    pub const svn_stringbuf_strip_whitespace = __root.svn_stringbuf_strip_whitespace;
    pub const svn_stringbuf_find_char_backward = __root.svn_stringbuf_find_char_backward;
    pub const svn_stream_from_stringbuf = __root.svn_stream_from_stringbuf;
    pub const svn_fs_print_modules = __root.svn_fs_print_modules;
    pub const buf = __root.svn_string_create_from_buf;
    pub const ensure = __root.svn_stringbuf_ensure;
    pub const set = __root.svn_stringbuf_set;
    pub const setempty = __root.svn_stringbuf_setempty;
    pub const isempty = __root.svn_stringbuf_isempty;
    pub const chop = __root.svn_stringbuf_chop;
    pub const leftchop = __root.svn_stringbuf_leftchop;
    pub const fillchar = __root.svn_stringbuf_fillchar;
    pub const appendbyte = __root.svn_stringbuf_appendbyte;
    pub const appendbytes = __root.svn_stringbuf_appendbytes;
    pub const appendfill = __root.svn_stringbuf_appendfill;
    pub const appendstr = __root.svn_stringbuf_appendstr;
    pub const appendcstr = __root.svn_stringbuf_appendcstr;
    pub const insert = __root.svn_stringbuf_insert;
    pub const replace = __root.svn_stringbuf_replace;
    pub const all = __root.svn_stringbuf_replace_all;
    pub const dup = __root.svn_stringbuf_dup;
    pub const compare = __root.svn_stringbuf_compare;
    pub const whitespace = __root.svn_stringbuf_first_non_whitespace;
    pub const backward = __root.svn_stringbuf_find_char_backward;
    pub const stringbuf = __root.svn_stream_from_stringbuf;
    pub const modules = __root.svn_fs_print_modules;
};
pub const svn_stringbuf_t = struct_svn_stringbuf_t;
pub extern fn svn_string_create(cstring: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_string_t;
pub extern fn svn_string_create_empty(pool: ?*apr_pool_t) [*c]svn_string_t;
pub extern fn svn_string_ncreate(bytes: [*c]const u8, size: apr_size_t, pool: ?*apr_pool_t) [*c]svn_string_t;
pub extern fn svn_string_create_from_buf(strbuf: [*c]const svn_stringbuf_t, pool: ?*apr_pool_t) [*c]svn_string_t;
pub extern fn svn_string_createf(pool: ?*apr_pool_t, fmt: [*c]const u8, ...) [*c]svn_string_t;
pub extern fn svn_string_createv(pool: ?*apr_pool_t, fmt: [*c]const u8, ap: [*c]struct___va_list_tag_43) [*c]svn_string_t;
pub extern fn svn_string_isempty(str: [*c]const svn_string_t) svn_boolean_t;
pub extern fn svn_string_dup(original_string: [*c]const svn_string_t, pool: ?*apr_pool_t) [*c]svn_string_t;
pub extern fn svn_string_compare(str1: [*c]const svn_string_t, str2: [*c]const svn_string_t) svn_boolean_t;
pub extern fn svn_string_first_non_whitespace(str: [*c]const svn_string_t) apr_size_t;
pub extern fn svn_string_find_char_backward(str: [*c]const svn_string_t, ch: u8) apr_size_t;
pub extern fn svn_stringbuf_create(cstring: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_stringbuf_t;
pub extern fn svn_stringbuf_ncreate(bytes: [*c]const u8, size: apr_size_t, pool: ?*apr_pool_t) [*c]svn_stringbuf_t;
pub extern fn svn_stringbuf_create_empty(pool: ?*apr_pool_t) [*c]svn_stringbuf_t;
pub extern fn svn_stringbuf_create_ensure(minimum_size: apr_size_t, pool: ?*apr_pool_t) [*c]svn_stringbuf_t;
pub extern fn svn_stringbuf_create_from_string(str: [*c]const svn_string_t, pool: ?*apr_pool_t) [*c]svn_stringbuf_t;
pub extern fn svn_stringbuf_create_wrap(str: [*c]u8, pool: ?*apr_pool_t) [*c]svn_stringbuf_t;
pub extern fn svn_stringbuf_createf(pool: ?*apr_pool_t, fmt: [*c]const u8, ...) [*c]svn_stringbuf_t;
pub extern fn svn_stringbuf_createv(pool: ?*apr_pool_t, fmt: [*c]const u8, ap: [*c]struct___va_list_tag_43) [*c]svn_stringbuf_t;
pub extern fn svn_stringbuf_ensure(str: [*c]svn_stringbuf_t, minimum_size: apr_size_t) void;
pub extern fn svn_stringbuf_set(str: [*c]svn_stringbuf_t, value: [*c]const u8) void;
pub extern fn svn_stringbuf_setempty(str: [*c]svn_stringbuf_t) void;
pub extern fn svn_stringbuf_isempty(str: [*c]const svn_stringbuf_t) svn_boolean_t;
pub extern fn svn_stringbuf_chop(str: [*c]svn_stringbuf_t, nbytes: apr_size_t) void;
pub extern fn svn_stringbuf_leftchop(str: [*c]svn_stringbuf_t, nbytes: apr_size_t) void;
pub extern fn svn_stringbuf_fillchar(str: [*c]svn_stringbuf_t, c: u8) void;
pub extern fn svn_stringbuf_appendbyte(targetstr: [*c]svn_stringbuf_t, byte: u8) void;
pub extern fn svn_stringbuf_appendbytes(targetstr: [*c]svn_stringbuf_t, bytes: [*c]const u8, count: apr_size_t) void;
pub extern fn svn_stringbuf_appendfill(targetstr: [*c]svn_stringbuf_t, byte: u8, count: apr_size_t) void;
pub extern fn svn_stringbuf_appendstr(targetstr: [*c]svn_stringbuf_t, appendstr: [*c]const svn_stringbuf_t) void;
pub extern fn svn_stringbuf_appendcstr(targetstr: [*c]svn_stringbuf_t, cstr: [*c]const u8) void;
pub extern fn svn_stringbuf_insert(str: [*c]svn_stringbuf_t, pos: apr_size_t, bytes: [*c]const u8, count: apr_size_t) void;
pub extern fn svn_stringbuf_remove(str: [*c]svn_stringbuf_t, pos: apr_size_t, count: apr_size_t) void;
pub extern fn svn_stringbuf_replace(str: [*c]svn_stringbuf_t, pos: apr_size_t, old_count: apr_size_t, bytes: [*c]const u8, new_count: apr_size_t) void;
pub extern fn svn_stringbuf_replace_all(str: [*c]svn_stringbuf_t, to_find: [*c]const u8, replacement: [*c]const u8) apr_size_t;
pub extern fn svn_stringbuf_dup(original_string: [*c]const svn_stringbuf_t, pool: ?*apr_pool_t) [*c]svn_stringbuf_t;
pub extern fn svn_stringbuf_compare(str1: [*c]const svn_stringbuf_t, str2: [*c]const svn_stringbuf_t) svn_boolean_t;
pub extern fn svn_stringbuf_first_non_whitespace(str: [*c]const svn_stringbuf_t) apr_size_t;
pub extern fn svn_stringbuf_strip_whitespace(str: [*c]svn_stringbuf_t) void;
pub extern fn svn_stringbuf_find_char_backward(str: [*c]const svn_stringbuf_t, ch: u8) apr_size_t;
pub extern fn svn_string_compare_stringbuf(str1: [*c]const svn_string_t, str2: [*c]const svn_stringbuf_t) svn_boolean_t;
pub extern fn svn_cstring_split(input: [*c]const u8, sep_chars: [*c]const u8, chop_whitespace: svn_boolean_t, pool: ?*apr_pool_t) [*c]apr_array_header_t;
pub extern fn svn_cstring_split_append(array: [*c]apr_array_header_t, input: [*c]const u8, sep_chars: [*c]const u8, chop_whitespace: svn_boolean_t, pool: ?*apr_pool_t) void;
pub extern fn svn_cstring_match_glob_list(str: [*c]const u8, list: [*c]const apr_array_header_t) svn_boolean_t;
pub extern fn svn_cstring_match_list(str: [*c]const u8, list: [*c]const apr_array_header_t) svn_boolean_t;
pub extern fn svn_cstring_tokenize(sep: [*c]const u8, str: [*c][*c]u8) [*c]u8;
pub extern fn svn_cstring_count_newlines(msg: [*c]const u8) c_int;
pub extern fn svn_cstring_join2(strings: [*c]const apr_array_header_t, separator: [*c]const u8, trailing_separator: svn_boolean_t, pool: ?*apr_pool_t) [*c]u8;
pub extern fn svn_cstring_join(strings: [*c]const apr_array_header_t, separator: [*c]const u8, pool: ?*apr_pool_t) [*c]u8;
pub extern fn svn_cstring_casecmp(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn svn_cstring_strtoi64(n: [*c]apr_int64_t, str: [*c]const u8, minval: apr_int64_t, maxval: apr_int64_t, base: c_int) [*c]svn_error_t;
pub extern fn svn_cstring_atoi64(n: [*c]apr_int64_t, str: [*c]const u8) [*c]svn_error_t;
pub extern fn svn_cstring_atoi(n: [*c]c_int, str: [*c]const u8) [*c]svn_error_t;
pub extern fn svn_cstring_strtoui64(n: [*c]apr_uint64_t, str: [*c]const u8, minval: apr_uint64_t, maxval: apr_uint64_t, base: c_int) [*c]svn_error_t;
pub extern fn svn_cstring_atoui64(n: [*c]apr_uint64_t, str: [*c]const u8) [*c]svn_error_t;
pub extern fn svn_cstring_atoui(n: [*c]c_uint, str: [*c]const u8) [*c]svn_error_t;
pub extern fn svn_cstring_skip_prefix(str: [*c]const u8, prefix: [*c]const u8) [*c]const u8;
pub extern fn svn_pool_create_ex(parent_pool: ?*apr_pool_t, allocator: ?*apr_allocator_t) ?*apr_pool_t;
pub extern fn svn_pool_create_ex_debug(parent_pool: ?*apr_pool_t, allocator: ?*apr_allocator_t, file_line: [*c]const u8) ?*apr_pool_t;
pub extern fn svn_pool_create_allocator(thread_safe: svn_boolean_t) ?*apr_allocator_t;
pub const apr_perms_setfn_t = fn (object: ?*anyopaque, perms: apr_fileperms_t, uid: apr_uid_t, gid: apr_gid_t) callconv(.c) apr_status_t;
pub const struct_timezone = extern struct {
    tz_minuteswest: c_int = 0,
    tz_dsttime: c_int = 0,
};
pub extern fn gettimeofday(noalias __tv: [*c]struct_timeval, noalias __tz: ?*anyopaque) c_int;
pub extern fn settimeofday(__tv: [*c]const struct_timeval, __tz: [*c]const struct_timezone) c_int;
pub extern fn adjtime(__delta: [*c]const struct_timeval, __olddelta: [*c]struct_timeval) c_int;
pub const ITIMER_REAL: c_int = 0;
pub const ITIMER_VIRTUAL: c_int = 1;
pub const ITIMER_PROF: c_int = 2;
pub const enum___itimer_which = c_uint;
pub const struct_itimerval = extern struct {
    it_interval: struct_timeval = @import("std").mem.zeroes(struct_timeval),
    it_value: struct_timeval = @import("std").mem.zeroes(struct_timeval),
};
pub const __itimer_which_t = c_int;
pub extern fn getitimer(__which: __itimer_which_t, __value: [*c]struct_itimerval) c_int;
pub extern fn setitimer(__which: __itimer_which_t, noalias __new: [*c]const struct_itimerval, noalias __old: [*c]struct_itimerval) c_int;
pub extern fn utimes(__file: [*c]const u8, __tvp: [*c]const struct_timeval) c_int;
pub extern fn lutimes(__file: [*c]const u8, __tvp: [*c]const struct_timeval) c_int;
pub extern fn futimes(__fd: c_int, __tvp: [*c]const struct_timeval) c_int;
pub const RLIMIT_CPU: c_int = 0;
pub const RLIMIT_FSIZE: c_int = 1;
pub const RLIMIT_DATA: c_int = 2;
pub const RLIMIT_STACK: c_int = 3;
pub const RLIMIT_CORE: c_int = 4;
pub const __RLIMIT_RSS: c_int = 5;
pub const RLIMIT_NOFILE: c_int = 7;
pub const __RLIMIT_OFILE: c_int = 7;
pub const RLIMIT_AS: c_int = 9;
pub const __RLIMIT_NPROC: c_int = 6;
pub const __RLIMIT_MEMLOCK: c_int = 8;
pub const __RLIMIT_LOCKS: c_int = 10;
pub const __RLIMIT_SIGPENDING: c_int = 11;
pub const __RLIMIT_MSGQUEUE: c_int = 12;
pub const __RLIMIT_NICE: c_int = 13;
pub const __RLIMIT_RTPRIO: c_int = 14;
pub const __RLIMIT_RTTIME: c_int = 15;
pub const __RLIMIT_NLIMITS: c_int = 16;
pub const __RLIM_NLIMITS: c_int = 16;
pub const enum___rlimit_resource = c_uint;
pub const rlim_t = __rlim_t;
pub const struct_rlimit = extern struct {
    rlim_cur: rlim_t = 0,
    rlim_max: rlim_t = 0,
};
pub const RUSAGE_SELF: c_int = 0;
pub const RUSAGE_CHILDREN: c_int = -1;
pub const enum___rusage_who = c_int;
pub const PRIO_PROCESS: c_int = 0;
pub const PRIO_PGRP: c_int = 1;
pub const PRIO_USER: c_int = 2;
pub const enum___priority_which = c_uint;
pub const __rlimit_resource_t = c_int;
pub const __rusage_who_t = c_int;
pub const __priority_which_t = c_int;
pub extern fn getrlimit(__resource: __rlimit_resource_t, __rlimits: [*c]struct_rlimit) c_int;
pub extern fn setrlimit(__resource: __rlimit_resource_t, __rlimits: [*c]const struct_rlimit) c_int;
pub extern fn getrusage(__who: __rusage_who_t, __usage: [*c]struct_rusage) c_int;
pub extern fn getpriority(__which: __priority_which_t, __who: id_t) c_int;
pub extern fn setpriority(__which: __priority_which_t, __who: id_t, __prio: c_int) c_int;
pub const APR_SHELLCMD: c_int = 0;
pub const APR_PROGRAM: c_int = 1;
pub const APR_PROGRAM_ENV: c_int = 2;
pub const APR_PROGRAM_PATH: c_int = 3;
pub const APR_SHELLCMD_ENV: c_int = 4;
pub const apr_cmdtype_e = c_uint;
pub const APR_WAIT: c_int = 0;
pub const APR_NOWAIT: c_int = 1;
pub const apr_wait_how_e = c_uint;
pub const APR_PROC_EXIT: c_int = 1;
pub const APR_PROC_SIGNAL: c_int = 2;
pub const APR_PROC_SIGNAL_CORE: c_int = 4;
pub const apr_exit_why_e = c_uint;
pub const struct_apr_proc_t = extern struct {
    pid: pid_t = 0,
    in: ?*apr_file_t = null,
    out: ?*apr_file_t = null,
    err: ?*apr_file_t = null,
    pub const apr_proc_fork = __root.apr_proc_fork;
    pub const apr_proc_create = __root.apr_proc_create;
    pub const apr_proc_wait = __root.apr_proc_wait;
    pub const apr_proc_wait_all_procs = __root.apr_proc_wait_all_procs;
    pub const apr_proc_other_child_register = __root.apr_proc_other_child_register;
    pub const apr_proc_other_child_alert = __root.apr_proc_other_child_alert;
    pub const apr_proc_kill = __root.apr_proc_kill;
    pub const svn_io_start_cmd3 = __root.svn_io_start_cmd3;
    pub const svn_io_start_cmd2 = __root.svn_io_start_cmd2;
    pub const svn_io_start_cmd = __root.svn_io_start_cmd;
    pub const svn_io_wait_for_cmd = __root.svn_io_wait_for_cmd;
    pub const fork = __root.apr_proc_fork;
    pub const create = __root.apr_proc_create;
    pub const procs = __root.apr_proc_wait_all_procs;
    pub const register = __root.apr_proc_other_child_register;
    pub const alert = __root.apr_proc_other_child_alert;
    pub const cmd3 = __root.svn_io_start_cmd3;
    pub const cmd2 = __root.svn_io_start_cmd2;
    pub const cmd = __root.svn_io_start_cmd;
};
pub const apr_proc_t = struct_apr_proc_t;
pub const apr_child_errfn_t = fn (proc: ?*apr_pool_t, err: apr_status_t, description: [*c]const u8) callconv(.c) void;
pub const struct_apr_thread_t = opaque {
    pub const apr_thread_exit = __root.apr_thread_exit;
    pub const apr_thread_detach = __root.apr_thread_detach;
    pub const apr_thread_pool_get = __root.apr_thread_pool_get;
    pub const detach = __root.apr_thread_detach;
    pub const get = __root.apr_thread_pool_get;
};
pub const apr_thread_t = struct_apr_thread_t;
pub const struct_apr_threadattr_t = opaque {
    pub const apr_threadattr_detach_set = __root.apr_threadattr_detach_set;
    pub const apr_threadattr_detach_get = __root.apr_threadattr_detach_get;
    pub const apr_threadattr_stacksize_set = __root.apr_threadattr_stacksize_set;
    pub const apr_threadattr_guardsize_set = __root.apr_threadattr_guardsize_set;
    pub const set = __root.apr_threadattr_detach_set;
    pub const get = __root.apr_threadattr_detach_get;
};
pub const apr_threadattr_t = struct_apr_threadattr_t;
pub const struct_apr_procattr_t = opaque {
    pub const apr_procattr_io_set = __root.apr_procattr_io_set;
    pub const apr_procattr_child_in_set = __root.apr_procattr_child_in_set;
    pub const apr_procattr_child_out_set = __root.apr_procattr_child_out_set;
    pub const apr_procattr_child_err_set = __root.apr_procattr_child_err_set;
    pub const apr_procattr_dir_set = __root.apr_procattr_dir_set;
    pub const apr_procattr_cmdtype_set = __root.apr_procattr_cmdtype_set;
    pub const apr_procattr_detach_set = __root.apr_procattr_detach_set;
    pub const apr_procattr_limit_set = __root.apr_procattr_limit_set;
    pub const apr_procattr_child_errfn_set = __root.apr_procattr_child_errfn_set;
    pub const apr_procattr_error_check_set = __root.apr_procattr_error_check_set;
    pub const apr_procattr_addrspace_set = __root.apr_procattr_addrspace_set;
    pub const apr_procattr_user_set = __root.apr_procattr_user_set;
    pub const apr_procattr_group_set = __root.apr_procattr_group_set;
    pub const apr_procattr_perms_set_register = __root.apr_procattr_perms_set_register;
    pub const set = __root.apr_procattr_io_set;
    pub const register = __root.apr_procattr_perms_set_register;
};
pub const apr_procattr_t = struct_apr_procattr_t;
pub const struct_apr_thread_once_t = opaque {
    pub const apr_thread_once = __root.apr_thread_once;
    pub const once = __root.apr_thread_once;
};
pub const apr_thread_once_t = struct_apr_thread_once_t;
pub const struct_apr_threadkey_t = opaque {
    pub const apr_threadkey_private_delete = __root.apr_threadkey_private_delete;
    pub const delete = __root.apr_threadkey_private_delete;
};
pub const apr_threadkey_t = struct_apr_threadkey_t;
pub const struct_apr_other_child_rec_t = opaque {
    pub const apr_proc_other_child_refresh = __root.apr_proc_other_child_refresh;
    pub const refresh = __root.apr_proc_other_child_refresh;
};
pub const apr_other_child_rec_t = struct_apr_other_child_rec_t;
pub const apr_thread_start_t = ?*const fn (?*apr_thread_t, ?*anyopaque) callconv(.c) ?*anyopaque;
pub const APR_KILL_NEVER: c_int = 0;
pub const APR_KILL_ALWAYS: c_int = 1;
pub const APR_KILL_AFTER_TIMEOUT: c_int = 2;
pub const APR_JUST_WAIT: c_int = 3;
pub const APR_KILL_ONLY_ONCE: c_int = 4;
pub const apr_kill_conditions_e = c_uint;
pub extern fn apr_threadattr_create(new_attr: [*c]?*apr_threadattr_t, cont: ?*apr_pool_t) apr_status_t;
pub extern fn apr_threadattr_detach_set(attr: ?*apr_threadattr_t, on: apr_int32_t) apr_status_t;
pub extern fn apr_threadattr_detach_get(attr: ?*apr_threadattr_t) apr_status_t;
pub extern fn apr_threadattr_stacksize_set(attr: ?*apr_threadattr_t, stacksize: apr_size_t) apr_status_t;
pub extern fn apr_threadattr_guardsize_set(attr: ?*apr_threadattr_t, guardsize: apr_size_t) apr_status_t;
pub extern fn apr_thread_create(new_thread: [*c]?*apr_thread_t, attr: ?*apr_threadattr_t, func: apr_thread_start_t, data: ?*anyopaque, cont: ?*apr_pool_t) apr_status_t;
pub extern fn apr_thread_exit(thd: ?*apr_thread_t, retval: apr_status_t) apr_status_t;
pub extern fn apr_thread_join(retval: [*c]apr_status_t, thd: ?*apr_thread_t) apr_status_t;
pub extern fn apr_thread_yield() void;
pub extern fn apr_thread_once_init(control: [*c]?*apr_thread_once_t, p: ?*apr_pool_t) apr_status_t;
pub extern fn apr_thread_once(control: ?*apr_thread_once_t, func: ?*const fn () callconv(.c) void) apr_status_t;
pub extern fn apr_thread_detach(thd: ?*apr_thread_t) apr_status_t;
pub extern fn apr_thread_data_get(data: [*c]?*anyopaque, key: [*c]const u8, thread: ?*apr_thread_t) apr_status_t;
pub extern fn apr_thread_data_set(data: ?*anyopaque, key: [*c]const u8, cleanup: ?*const fn (?*anyopaque) callconv(.c) apr_status_t, thread: ?*apr_thread_t) apr_status_t;
pub extern fn apr_threadkey_private_create(key: [*c]?*apr_threadkey_t, dest: ?*const fn (?*anyopaque) callconv(.c) void, cont: ?*apr_pool_t) apr_status_t;
pub extern fn apr_threadkey_private_get(new_mem: [*c]?*anyopaque, key: ?*apr_threadkey_t) apr_status_t;
pub extern fn apr_threadkey_private_set(priv: ?*anyopaque, key: ?*apr_threadkey_t) apr_status_t;
pub extern fn apr_threadkey_private_delete(key: ?*apr_threadkey_t) apr_status_t;
pub extern fn apr_threadkey_data_get(data: [*c]?*anyopaque, key: [*c]const u8, threadkey: ?*apr_threadkey_t) apr_status_t;
pub extern fn apr_threadkey_data_set(data: ?*anyopaque, key: [*c]const u8, cleanup: ?*const fn (?*anyopaque) callconv(.c) apr_status_t, threadkey: ?*apr_threadkey_t) apr_status_t;
pub extern fn apr_procattr_create(new_attr: [*c]?*apr_procattr_t, cont: ?*apr_pool_t) apr_status_t;
pub extern fn apr_procattr_io_set(attr: ?*apr_procattr_t, in: apr_int32_t, out: apr_int32_t, err: apr_int32_t) apr_status_t;
pub extern fn apr_procattr_child_in_set(attr: ?*struct_apr_procattr_t, child_in: ?*apr_file_t, parent_in: ?*apr_file_t) apr_status_t;
pub extern fn apr_procattr_child_out_set(attr: ?*struct_apr_procattr_t, child_out: ?*apr_file_t, parent_out: ?*apr_file_t) apr_status_t;
pub extern fn apr_procattr_child_err_set(attr: ?*struct_apr_procattr_t, child_err: ?*apr_file_t, parent_err: ?*apr_file_t) apr_status_t;
pub extern fn apr_procattr_dir_set(attr: ?*apr_procattr_t, dir: [*c]const u8) apr_status_t;
pub extern fn apr_procattr_cmdtype_set(attr: ?*apr_procattr_t, cmd: apr_cmdtype_e) apr_status_t;
pub extern fn apr_procattr_detach_set(attr: ?*apr_procattr_t, detach: apr_int32_t) apr_status_t;
pub extern fn apr_procattr_limit_set(attr: ?*apr_procattr_t, what: apr_int32_t, limit: [*c]struct_rlimit) apr_status_t;
pub extern fn apr_procattr_child_errfn_set(attr: ?*apr_procattr_t, errfn: ?*const apr_child_errfn_t) apr_status_t;
pub extern fn apr_procattr_error_check_set(attr: ?*apr_procattr_t, chk: apr_int32_t) apr_status_t;
pub extern fn apr_procattr_addrspace_set(attr: ?*apr_procattr_t, @"addrspace": apr_int32_t) apr_status_t;
pub extern fn apr_procattr_user_set(attr: ?*apr_procattr_t, username: [*c]const u8, password: [*c]const u8) apr_status_t;
pub extern fn apr_procattr_group_set(attr: ?*apr_procattr_t, groupname: [*c]const u8) apr_status_t;
pub extern fn apr_procattr_perms_set_register(attr: ?*apr_procattr_t, perms_set_fn: ?*const apr_perms_setfn_t, data: ?*anyopaque, perms: apr_fileperms_t) apr_status_t;
pub extern fn apr_proc_fork(proc: [*c]apr_proc_t, cont: ?*apr_pool_t) apr_status_t;
pub extern fn apr_proc_create(new_proc: [*c]apr_proc_t, progname: [*c]const u8, args: [*c]const [*c]const u8, env: [*c]const [*c]const u8, attr: ?*apr_procattr_t, pool: ?*apr_pool_t) apr_status_t;
pub extern fn apr_proc_wait(proc: [*c]apr_proc_t, exitcode: [*c]c_int, exitwhy: [*c]apr_exit_why_e, waithow: apr_wait_how_e) apr_status_t;
pub extern fn apr_proc_wait_all_procs(proc: [*c]apr_proc_t, exitcode: [*c]c_int, exitwhy: [*c]apr_exit_why_e, waithow: apr_wait_how_e, p: ?*apr_pool_t) apr_status_t;
pub extern fn apr_proc_detach(daemonize: c_int) apr_status_t;
pub extern fn apr_proc_other_child_register(proc: [*c]apr_proc_t, maintenance: ?*const fn (reason: c_int, ?*anyopaque, status: c_int) callconv(.c) void, data: ?*anyopaque, write_fd: ?*apr_file_t, p: ?*apr_pool_t) void;
pub extern fn apr_proc_other_child_unregister(data: ?*anyopaque) void;
pub extern fn apr_proc_other_child_alert(proc: [*c]apr_proc_t, reason: c_int, status: c_int) apr_status_t;
pub extern fn apr_proc_other_child_refresh(ocr: ?*apr_other_child_rec_t, reason: c_int) void;
pub extern fn apr_proc_other_child_refresh_all(reason: c_int) void;
pub extern fn apr_proc_kill(proc: [*c]apr_proc_t, sig: c_int) apr_status_t;
pub extern fn apr_pool_note_subprocess(a: ?*apr_pool_t, proc: [*c]apr_proc_t, how: apr_kill_conditions_e) void;
pub extern fn apr_setup_signal_thread() apr_status_t;
pub extern fn apr_signal_thread(signal_handler: ?*const fn (signum: c_int) callconv(.c) c_int) apr_status_t;
pub extern fn apr_thread_pool_get(thethread: ?*const apr_thread_t) ?*apr_pool_t;
pub const svn_checksum_md5: c_int = 0;
pub const svn_checksum_sha1: c_int = 1;
pub const svn_checksum_fnv1a_32: c_int = 2;
pub const svn_checksum_fnv1a_32x4: c_int = 3;
pub const enum_svn_checksum_kind_t = c_uint;
pub const svn_checksum_kind_t = enum_svn_checksum_kind_t;
pub const struct_svn_checksum_t = extern struct {
    digest: [*c]const u8 = null,
    kind: svn_checksum_kind_t = @import("std").mem.zeroes(svn_checksum_kind_t),
    pub const svn_checksum_clear = __root.svn_checksum_clear;
    pub const svn_checksum_match = __root.svn_checksum_match;
    pub const svn_checksum_dup = __root.svn_checksum_dup;
    pub const svn_checksum_to_cstring_display = __root.svn_checksum_to_cstring_display;
    pub const svn_checksum_to_cstring = __root.svn_checksum_to_cstring;
    pub const svn_checksum_serialize = __root.svn_checksum_serialize;
    pub const svn_checksum_size = __root.svn_checksum_size;
    pub const svn_checksum_is_empty_checksum = __root.svn_checksum_is_empty_checksum;
    pub const svn_checksum_mismatch_err = __root.svn_checksum_mismatch_err;
    pub const clear = __root.svn_checksum_clear;
    pub const match = __root.svn_checksum_match;
    pub const dup = __root.svn_checksum_dup;
    pub const display = __root.svn_checksum_to_cstring_display;
    pub const cstring = __root.svn_checksum_to_cstring;
    pub const serialize = __root.svn_checksum_serialize;
    pub const size = __root.svn_checksum_size;
    pub const checksum = __root.svn_checksum_is_empty_checksum;
    pub const err = __root.svn_checksum_mismatch_err;
};
pub const svn_checksum_t = struct_svn_checksum_t;
pub const struct_svn_checksum_ctx_t = opaque {
    pub const svn_checksum_ctx_reset = __root.svn_checksum_ctx_reset;
    pub const svn_checksum_update = __root.svn_checksum_update;
    pub const reset = __root.svn_checksum_ctx_reset;
    pub const update = __root.svn_checksum_update;
};
pub const svn_checksum_ctx_t = struct_svn_checksum_ctx_t;
pub extern fn svn_checksum_create(kind: svn_checksum_kind_t, pool: ?*apr_pool_t) [*c]svn_checksum_t;
pub extern fn svn_checksum_clear(checksum: [*c]svn_checksum_t) [*c]svn_error_t;
pub extern fn svn_checksum_match(checksum1: [*c]const svn_checksum_t, checksum2: [*c]const svn_checksum_t) svn_boolean_t;
pub extern fn svn_checksum_dup(checksum: [*c]const svn_checksum_t, pool: ?*apr_pool_t) [*c]svn_checksum_t;
pub extern fn svn_checksum_to_cstring_display(checksum: [*c]const svn_checksum_t, pool: ?*apr_pool_t) [*c]const u8;
pub extern fn svn_checksum_to_cstring(checksum: [*c]const svn_checksum_t, pool: ?*apr_pool_t) [*c]const u8;
pub extern fn svn_checksum_serialize(checksum: [*c]const svn_checksum_t, result_pool: ?*apr_pool_t, scratch_pool: ?*apr_pool_t) [*c]const u8;
pub extern fn svn_checksum_deserialize(checksum: [*c][*c]const svn_checksum_t, data: [*c]const u8, result_pool: ?*apr_pool_t, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_checksum_parse_hex(checksum: [*c][*c]svn_checksum_t, kind: svn_checksum_kind_t, hex: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_checksum(checksum: [*c][*c]svn_checksum_t, kind: svn_checksum_kind_t, data: ?*const anyopaque, len: apr_size_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_checksum_empty_checksum(kind: svn_checksum_kind_t, pool: ?*apr_pool_t) [*c]svn_checksum_t;
pub extern fn svn_checksum_ctx_create(kind: svn_checksum_kind_t, pool: ?*apr_pool_t) ?*svn_checksum_ctx_t;
pub extern fn svn_checksum_ctx_reset(ctx: ?*svn_checksum_ctx_t) [*c]svn_error_t;
pub extern fn svn_checksum_update(ctx: ?*svn_checksum_ctx_t, data: ?*const anyopaque, len: apr_size_t) [*c]svn_error_t;
pub extern fn svn_checksum_final(checksum: [*c][*c]svn_checksum_t, ctx: ?*const svn_checksum_ctx_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_checksum_size(checksum: [*c]const svn_checksum_t) apr_size_t;
pub extern fn svn_checksum_is_empty_checksum(checksum: [*c]svn_checksum_t) svn_boolean_t;
pub extern fn svn_checksum_mismatch_err(expected: [*c]const svn_checksum_t, actual: [*c]const svn_checksum_t, scratch_pool: ?*apr_pool_t, fmt: [*c]const u8, ...) [*c]svn_error_t;
pub const svn_io_file_del_none: c_int = 0;
pub const svn_io_file_del_on_close: c_int = 1;
pub const svn_io_file_del_on_pool_cleanup: c_int = 2;
pub const enum_svn_io_file_del_t = c_uint;
pub const svn_io_file_del_t = enum_svn_io_file_del_t;
pub const struct_svn_io_dirent2_t = extern struct {
    kind: svn_node_kind_t = @import("std").mem.zeroes(svn_node_kind_t),
    special: svn_boolean_t = 0,
    filesize: svn_filesize_t = 0,
    mtime: apr_time_t = 0,
    pub const svn_io_dirent2_dup = __root.svn_io_dirent2_dup;
    pub const dup = __root.svn_io_dirent2_dup;
};
pub const svn_io_dirent2_t = struct_svn_io_dirent2_t;
pub extern fn svn_io_dirent2_create(result_pool: ?*apr_pool_t) [*c]svn_io_dirent2_t;
pub extern fn svn_io_dirent2_dup(item: [*c]const svn_io_dirent2_t, result_pool: ?*apr_pool_t) [*c]svn_io_dirent2_t;
pub const struct_svn_io_dirent_t = extern struct {
    kind: svn_node_kind_t = @import("std").mem.zeroes(svn_node_kind_t),
    special: svn_boolean_t = 0,
};
pub const svn_io_dirent_t = struct_svn_io_dirent_t;
pub extern fn svn_io_check_path(path: [*c]const u8, kind: [*c]svn_node_kind_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_check_special_path(path: [*c]const u8, kind: [*c]svn_node_kind_t, is_special: [*c]svn_boolean_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_check_resolved_path(path: [*c]const u8, kind: [*c]svn_node_kind_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_open_uniquely_named(file: [*c]?*apr_file_t, unique_name: [*c][*c]const u8, dirpath: [*c]const u8, filename: [*c]const u8, suffix: [*c]const u8, delete_when: svn_io_file_del_t, result_pool: ?*apr_pool_t, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_open_unique_file3(file: [*c]?*apr_file_t, temp_path: [*c][*c]const u8, dirpath: [*c]const u8, delete_when: svn_io_file_del_t, result_pool: ?*apr_pool_t, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_open_unique_file2(f: [*c]?*apr_file_t, unique_name_p: [*c][*c]const u8, path: [*c]const u8, suffix: [*c]const u8, delete_when: svn_io_file_del_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_open_unique_file(f: [*c]?*apr_file_t, unique_name_p: [*c][*c]const u8, path: [*c]const u8, suffix: [*c]const u8, delete_on_close: svn_boolean_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_create_unique_link(unique_name_p: [*c][*c]const u8, path: [*c]const u8, dest: [*c]const u8, suffix: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_read_link(dest: [*c][*c]svn_string_t, path: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_temp_dir(dir: [*c][*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_copy_file(src: [*c]const u8, dst: [*c]const u8, copy_perms: svn_boolean_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_copy_perms(src: [*c]const u8, dst: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_copy_link(src: [*c]const u8, dst: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_copy_dir_recursively(src: [*c]const u8, dst_parent: [*c]const u8, dst_basename: [*c]const u8, copy_perms: svn_boolean_t, cancel_func: svn_cancel_func_t, cancel_baton: ?*anyopaque, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_make_dir_recursively(path: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_dir_empty(is_empty_p: [*c]svn_boolean_t, path: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_append_file(src: [*c]const u8, dst: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_set_file_read_only(path: [*c]const u8, ignore_enoent: svn_boolean_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_set_file_read_write(path: [*c]const u8, ignore_enoent: svn_boolean_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_set_file_read_write_carefully(path: [*c]const u8, enable_write: svn_boolean_t, ignore_enoent: svn_boolean_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_set_file_executable(path: [*c]const u8, executable: svn_boolean_t, ignore_enoent: svn_boolean_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_is_file_executable(executable: [*c]svn_boolean_t, path: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_read_length_line(file: ?*apr_file_t, buf: [*c]u8, limit: [*c]apr_size_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_file_affected_time(apr_time: [*c]apr_time_t, path: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_set_file_affected_time(apr_time: apr_time_t, path: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_sleep_for_timestamps(path: [*c]const u8, pool: ?*apr_pool_t) void;
pub extern fn svn_io_filesizes_different_p(different_p: [*c]svn_boolean_t, file1: [*c]const u8, file2: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_filesizes_three_different_p(different_p12: [*c]svn_boolean_t, different_p23: [*c]svn_boolean_t, different_p13: [*c]svn_boolean_t, file1: [*c]const u8, file2: [*c]const u8, file3: [*c]const u8, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_file_checksum2(checksum: [*c][*c]svn_checksum_t, file: [*c]const u8, kind: svn_checksum_kind_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_file_checksum(digest: [*c]u8, file: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_files_contents_same_p(same: [*c]svn_boolean_t, file1: [*c]const u8, file2: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_files_contents_three_same_p(same12: [*c]svn_boolean_t, same23: [*c]svn_boolean_t, same13: [*c]svn_boolean_t, file1: [*c]const u8, file2: [*c]const u8, file3: [*c]const u8, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_file_create(file: [*c]const u8, contents: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_file_create_bytes(file: [*c]const u8, contents: ?*const anyopaque, length: apr_size_t, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_file_create_empty(file: [*c]const u8, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_file_lock(lock_file: [*c]const u8, exclusive: svn_boolean_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_file_lock2(lock_file: [*c]const u8, exclusive: svn_boolean_t, nonblocking: svn_boolean_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_lock_open_file(lockfile_handle: ?*apr_file_t, exclusive: svn_boolean_t, nonblocking: svn_boolean_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_unlock_open_file(lockfile_handle: ?*apr_file_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_file_flush_to_disk(file: ?*apr_file_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_dir_file_copy(src_path: [*c]const u8, dest_path: [*c]const u8, file: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub const struct_svn_stream_t = opaque {
    pub const svn_stream_set_baton = __root.svn_stream_set_baton;
    pub const svn_stream_set_read2 = __root.svn_stream_set_read2;
    pub const svn_stream_set_read = __root.svn_stream_set_read;
    pub const svn_stream_set_skip = __root.svn_stream_set_skip;
    pub const svn_stream_set_write = __root.svn_stream_set_write;
    pub const svn_stream_set_close = __root.svn_stream_set_close;
    pub const svn_stream_set_mark = __root.svn_stream_set_mark;
    pub const svn_stream_set_seek = __root.svn_stream_set_seek;
    pub const svn_stream_set_data_available = __root.svn_stream_set_data_available;
    pub const svn_stream_set_readline = __root.svn_stream_set_readline;
    pub const svn_stream_disown = __root.svn_stream_disown;
    pub const svn_stream_compressed = __root.svn_stream_compressed;
    pub const svn_stream_checksummed2 = __root.svn_stream_checksummed2;
    pub const svn_stream_checksummed = __root.svn_stream_checksummed;
    pub const svn_stream_read_full = __root.svn_stream_read_full;
    pub const svn_stream_supports_partial_read = __root.svn_stream_supports_partial_read;
    pub const svn_stream_read2 = __root.svn_stream_read2;
    pub const svn_stream_read = __root.svn_stream_read;
    pub const svn_stream_skip = __root.svn_stream_skip;
    pub const svn_stream_write = __root.svn_stream_write;
    pub const svn_stream_close = __root.svn_stream_close;
    pub const svn_stream_reset = __root.svn_stream_reset;
    pub const svn_stream_supports_mark = __root.svn_stream_supports_mark;
    pub const svn_stream_supports_seek = __root.svn_stream_supports_seek;
    pub const svn_stream_supports_reset = __root.svn_stream_supports_reset;
    pub const svn_stream_mark = __root.svn_stream_mark;
    pub const svn_stream_seek = __root.svn_stream_seek;
    pub const svn_stream_data_available = __root.svn_stream_data_available;
    pub const svn_stream_tee = __root.svn_stream_tee;
    pub const svn_stream_puts = __root.svn_stream_puts;
    pub const svn_stream_printf = __root.svn_stream_printf;
    pub const svn_stream_printf_from_utf8 = __root.svn_stream_printf_from_utf8;
    pub const svn_stream_readline = __root.svn_stream_readline;
    pub const svn_stream_copy3 = __root.svn_stream_copy3;
    pub const svn_stream_copy2 = __root.svn_stream_copy2;
    pub const svn_stream_copy = __root.svn_stream_copy;
    pub const svn_txdelta_run = __root.svn_txdelta_run;
    pub const svn_txdelta_send_stream = __root.svn_txdelta_send_stream;
    pub const svn_txdelta_apply2 = __root.svn_txdelta_apply2;
    pub const svn_txdelta_apply = __root.svn_txdelta_apply;
    pub const svn_txdelta_to_svndiff = __root.svn_txdelta_to_svndiff;
    pub const baton = __root.svn_stream_set_baton;
    pub const read2 = __root.svn_stream_set_read2;
    pub const read = __root.svn_stream_set_read;
    pub const skip = __root.svn_stream_set_skip;
    pub const write = __root.svn_stream_set_write;
    pub const close = __root.svn_stream_set_close;
    pub const mark = __root.svn_stream_set_mark;
    pub const seek = __root.svn_stream_set_seek;
    pub const available = __root.svn_stream_set_data_available;
    pub const readline = __root.svn_stream_set_readline;
    pub const disown = __root.svn_stream_disown;
    pub const compressed = __root.svn_stream_compressed;
    pub const checksummed2 = __root.svn_stream_checksummed2;
    pub const checksummed = __root.svn_stream_checksummed;
    pub const full = __root.svn_stream_read_full;
    pub const reset = __root.svn_stream_reset;
    pub const tee = __root.svn_stream_tee;
    pub const utf8 = __root.svn_stream_printf_from_utf8;
    pub const copy3 = __root.svn_stream_copy3;
    pub const copy2 = __root.svn_stream_copy2;
    pub const copy = __root.svn_stream_copy;
    pub const run = __root.svn_txdelta_run;
    pub const stream = __root.svn_txdelta_send_stream;
    pub const apply2 = __root.svn_txdelta_apply2;
    pub const apply = __root.svn_txdelta_apply;
    pub const svndiff = __root.svn_txdelta_to_svndiff;
};
pub const svn_stream_t = struct_svn_stream_t;
pub const svn_read_fn_t = ?*const fn (baton: ?*anyopaque, buffer: [*c]u8, len: [*c]apr_size_t) callconv(.c) [*c]svn_error_t;
pub const svn_stream_skip_fn_t = ?*const fn (baton: ?*anyopaque, len: apr_size_t) callconv(.c) [*c]svn_error_t;
pub const svn_write_fn_t = ?*const fn (baton: ?*anyopaque, data: [*c]const u8, len: [*c]apr_size_t) callconv(.c) [*c]svn_error_t;
pub const svn_close_fn_t = ?*const fn (baton: ?*anyopaque) callconv(.c) [*c]svn_error_t;
pub const struct_svn_stream_mark_t = opaque {};
pub const svn_stream_mark_t = struct_svn_stream_mark_t;
pub const svn_stream_mark_fn_t = ?*const fn (baton: ?*anyopaque, mark: [*c]?*svn_stream_mark_t, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t;
pub const svn_stream_seek_fn_t = ?*const fn (baton: ?*anyopaque, mark: ?*const svn_stream_mark_t) callconv(.c) [*c]svn_error_t;
pub const svn_stream_data_available_fn_t = ?*const fn (baton: ?*anyopaque, data_available: [*c]svn_boolean_t) callconv(.c) [*c]svn_error_t;
pub const svn_stream_readline_fn_t = ?*const fn (baton: ?*anyopaque, stringbuf: [*c][*c]svn_stringbuf_t, eol: [*c]const u8, eof: [*c]svn_boolean_t, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t;
pub extern fn svn_stream_create(baton: ?*anyopaque, pool: ?*apr_pool_t) ?*svn_stream_t;
pub extern fn svn_stream_set_baton(stream: ?*svn_stream_t, baton: ?*anyopaque) void;
pub extern fn svn_stream_set_read2(stream: ?*svn_stream_t, read_fn: svn_read_fn_t, read_full_fn: svn_read_fn_t) void;
pub extern fn svn_stream_set_read(stream: ?*svn_stream_t, read_fn: svn_read_fn_t) void;
pub extern fn svn_stream_set_skip(stream: ?*svn_stream_t, skip_fn: svn_stream_skip_fn_t) void;
pub extern fn svn_stream_set_write(stream: ?*svn_stream_t, write_fn: svn_write_fn_t) void;
pub extern fn svn_stream_set_close(stream: ?*svn_stream_t, close_fn: svn_close_fn_t) void;
pub extern fn svn_stream_set_mark(stream: ?*svn_stream_t, mark_fn: svn_stream_mark_fn_t) void;
pub extern fn svn_stream_set_seek(stream: ?*svn_stream_t, seek_fn: svn_stream_seek_fn_t) void;
pub extern fn svn_stream_set_data_available(stream: ?*svn_stream_t, data_available: svn_stream_data_available_fn_t) void;
pub extern fn svn_stream_set_readline(stream: ?*svn_stream_t, readline_fn: svn_stream_readline_fn_t) void;
pub extern fn svn_stream_empty(pool: ?*apr_pool_t) ?*svn_stream_t;
pub extern fn svn_stream_disown(stream: ?*svn_stream_t, pool: ?*apr_pool_t) ?*svn_stream_t;
pub extern fn svn_stream_open_readonly(stream: [*c]?*svn_stream_t, path: [*c]const u8, result_pool: ?*apr_pool_t, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_stream_open_writable(stream: [*c]?*svn_stream_t, path: [*c]const u8, result_pool: ?*apr_pool_t, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_stream_open_unique(stream: [*c]?*svn_stream_t, temp_path: [*c][*c]const u8, dirpath: [*c]const u8, delete_when: svn_io_file_del_t, result_pool: ?*apr_pool_t, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_stream_from_aprfile2(file: ?*apr_file_t, disown: svn_boolean_t, pool: ?*apr_pool_t) ?*svn_stream_t;
pub extern fn svn_stream_from_aprfile(file: ?*apr_file_t, pool: ?*apr_pool_t) ?*svn_stream_t;
pub extern fn svn_stream_for_stdin2(in: [*c]?*svn_stream_t, buffered: svn_boolean_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_stream_for_stdin(in: [*c]?*svn_stream_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_stream_for_stderr(err: [*c]?*svn_stream_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_stream_for_stdout(out: [*c]?*svn_stream_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_stringbuf_from_stream(result: [*c][*c]svn_stringbuf_t, stream: ?*svn_stream_t, len_hint: apr_size_t, result_pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_stream_from_stringbuf(str: [*c]svn_stringbuf_t, pool: ?*apr_pool_t) ?*svn_stream_t;
pub extern fn svn_stream_from_string(str: [*c]const svn_string_t, pool: ?*apr_pool_t) ?*svn_stream_t;
pub extern fn svn_stream_buffered(result_pool: ?*apr_pool_t) ?*svn_stream_t;
pub extern fn svn_stream_compressed(stream: ?*svn_stream_t, pool: ?*apr_pool_t) ?*svn_stream_t;
pub extern fn svn_stream_checksummed2(stream: ?*svn_stream_t, read_checksum: [*c][*c]svn_checksum_t, write_checksum: [*c][*c]svn_checksum_t, checksum_kind: svn_checksum_kind_t, read_all: svn_boolean_t, pool: ?*apr_pool_t) ?*svn_stream_t;
pub extern fn svn_stream_checksummed(stream: ?*svn_stream_t, read_digest: [*c][*c]const u8, write_digest: [*c][*c]const u8, read_all: svn_boolean_t, pool: ?*apr_pool_t) ?*svn_stream_t;
pub extern fn svn_stream_contents_checksum(checksum: [*c][*c]svn_checksum_t, stream: ?*svn_stream_t, kind: svn_checksum_kind_t, result_pool: ?*apr_pool_t, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_stream_read_full(stream: ?*svn_stream_t, buffer: [*c]u8, len: [*c]apr_size_t) [*c]svn_error_t;
pub extern fn svn_stream_supports_partial_read(stream: ?*svn_stream_t) svn_boolean_t;
pub extern fn svn_stream_read2(stream: ?*svn_stream_t, buffer: [*c]u8, len: [*c]apr_size_t) [*c]svn_error_t;
pub extern fn svn_stream_read(stream: ?*svn_stream_t, buffer: [*c]u8, len: [*c]apr_size_t) [*c]svn_error_t;
pub extern fn svn_stream_skip(stream: ?*svn_stream_t, len: apr_size_t) [*c]svn_error_t;
pub extern fn svn_stream_write(stream: ?*svn_stream_t, data: [*c]const u8, len: [*c]apr_size_t) [*c]svn_error_t;
pub extern fn svn_stream_close(stream: ?*svn_stream_t) [*c]svn_error_t;
pub extern fn svn_stream_reset(stream: ?*svn_stream_t) [*c]svn_error_t;
pub extern fn svn_stream_supports_mark(stream: ?*svn_stream_t) svn_boolean_t;
pub extern fn svn_stream_supports_seek(stream: ?*svn_stream_t) svn_boolean_t;
pub extern fn svn_stream_supports_reset(stream: ?*svn_stream_t) svn_boolean_t;
pub extern fn svn_stream_mark(stream: ?*svn_stream_t, mark: [*c]?*svn_stream_mark_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_stream_seek(stream: ?*svn_stream_t, mark: ?*const svn_stream_mark_t) [*c]svn_error_t;
pub extern fn svn_stream_data_available(stream: ?*svn_stream_t, data_available: [*c]svn_boolean_t) [*c]svn_error_t;
pub extern fn svn_stream_tee(out1: ?*svn_stream_t, out2: ?*svn_stream_t, pool: ?*apr_pool_t) ?*svn_stream_t;
pub extern fn svn_stream_puts(stream: ?*svn_stream_t, str: [*c]const u8) [*c]svn_error_t;
pub extern fn svn_stream_printf(stream: ?*svn_stream_t, pool: ?*apr_pool_t, fmt: [*c]const u8, ...) [*c]svn_error_t;
pub extern fn svn_stream_printf_from_utf8(stream: ?*svn_stream_t, encoding: [*c]const u8, pool: ?*apr_pool_t, fmt: [*c]const u8, ...) [*c]svn_error_t;
pub extern fn svn_stream_readline(stream: ?*svn_stream_t, stringbuf: [*c][*c]svn_stringbuf_t, eol: [*c]const u8, eof: [*c]svn_boolean_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_stream_copy3(from: ?*svn_stream_t, to: ?*svn_stream_t, cancel_func: svn_cancel_func_t, cancel_baton: ?*anyopaque, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_stream_copy2(from: ?*svn_stream_t, to: ?*svn_stream_t, cancel_func: svn_cancel_func_t, cancel_baton: ?*anyopaque, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_stream_copy(from: ?*svn_stream_t, to: ?*svn_stream_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_stream_contents_same2(same: [*c]svn_boolean_t, stream1: ?*svn_stream_t, stream2: ?*svn_stream_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_stream_contents_same(same: [*c]svn_boolean_t, stream1: ?*svn_stream_t, stream2: ?*svn_stream_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_string_from_stream2(result: [*c][*c]svn_string_t, stream: ?*svn_stream_t, len_hint: apr_size_t, result_pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_string_from_stream(result: [*c][*c]svn_string_t, stream: ?*svn_stream_t, result_pool: ?*apr_pool_t, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub const svn_stream_lazyopen_func_t = ?*const fn (stream: [*c]?*svn_stream_t, baton: ?*anyopaque, result_pool: ?*apr_pool_t, scratch_pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t;
pub extern fn svn_stream_lazyopen_create(open_func: svn_stream_lazyopen_func_t, open_baton: ?*anyopaque, open_on_close: svn_boolean_t, result_pool: ?*apr_pool_t) ?*svn_stream_t;
pub extern fn svn_stringbuf_from_file2(result: [*c][*c]svn_stringbuf_t, filename: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_stringbuf_from_file(result: [*c][*c]svn_stringbuf_t, filename: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_stringbuf_from_aprfile(result: [*c][*c]svn_stringbuf_t, file: ?*apr_file_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_remove_file2(path: [*c]const u8, ignore_enoent: svn_boolean_t, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_remove_file(path: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_remove_dir2(path: [*c]const u8, ignore_enoent: svn_boolean_t, cancel_func: svn_cancel_func_t, cancel_baton: ?*anyopaque, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_remove_dir(path: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_get_dir_filenames(dirents: [*c]?*apr_hash_t, path: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_get_dirents3(dirents: [*c]?*apr_hash_t, path: [*c]const u8, only_check_type: svn_boolean_t, result_pool: ?*apr_pool_t, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_get_dirents2(dirents: [*c]?*apr_hash_t, path: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_get_dirents(dirents: [*c]?*apr_hash_t, path: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_stat_dirent2(dirent_p: [*c][*c]const svn_io_dirent2_t, path: [*c]const u8, verify_truename: svn_boolean_t, ignore_enoent: svn_boolean_t, result_pool: ?*apr_pool_t, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_stat_dirent(dirent_p: [*c][*c]const svn_io_dirent2_t, path: [*c]const u8, ignore_enoent: svn_boolean_t, result_pool: ?*apr_pool_t, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub const svn_io_walk_func_t = ?*const fn (baton: ?*anyopaque, path: [*c]const u8, finfo: [*c]const apr_finfo_t, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t;
pub extern fn svn_io_dir_walk2(dirname: [*c]const u8, wanted: apr_int32_t, walk_func: svn_io_walk_func_t, walk_baton: ?*anyopaque, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_dir_walk(dirname: [*c]const u8, wanted: apr_int32_t, walk_func: svn_io_walk_func_t, walk_baton: ?*anyopaque, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_start_cmd3(cmd_proc: [*c]apr_proc_t, path: [*c]const u8, cmd: [*c]const u8, args: [*c]const [*c]const u8, env: [*c]const [*c]const u8, inherit: svn_boolean_t, infile_pipe: svn_boolean_t, infile: ?*apr_file_t, outfile_pipe: svn_boolean_t, outfile: ?*apr_file_t, errfile_pipe: svn_boolean_t, errfile: ?*apr_file_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_start_cmd2(cmd_proc: [*c]apr_proc_t, path: [*c]const u8, cmd: [*c]const u8, args: [*c]const [*c]const u8, inherit: svn_boolean_t, infile_pipe: svn_boolean_t, infile: ?*apr_file_t, outfile_pipe: svn_boolean_t, outfile: ?*apr_file_t, errfile_pipe: svn_boolean_t, errfile: ?*apr_file_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_start_cmd(cmd_proc: [*c]apr_proc_t, path: [*c]const u8, cmd: [*c]const u8, args: [*c]const [*c]const u8, inherit: svn_boolean_t, infile: ?*apr_file_t, outfile: ?*apr_file_t, errfile: ?*apr_file_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_wait_for_cmd(cmd_proc: [*c]apr_proc_t, cmd: [*c]const u8, exitcode: [*c]c_int, exitwhy: [*c]apr_exit_why_e, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_run_cmd(path: [*c]const u8, cmd: [*c]const u8, args: [*c]const [*c]const u8, exitcode: [*c]c_int, exitwhy: [*c]apr_exit_why_e, inherit: svn_boolean_t, infile: ?*apr_file_t, outfile: ?*apr_file_t, errfile: ?*apr_file_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_run_diff2(dir: [*c]const u8, user_args: [*c]const [*c]const u8, num_user_args: c_int, label1: [*c]const u8, label2: [*c]const u8, from: [*c]const u8, to: [*c]const u8, exitcode: [*c]c_int, outfile: ?*apr_file_t, errfile: ?*apr_file_t, diff_cmd: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_run_diff(dir: [*c]const u8, user_args: [*c]const [*c]const u8, num_user_args: c_int, label1: [*c]const u8, label2: [*c]const u8, from: [*c]const u8, to: [*c]const u8, exitcode: [*c]c_int, outfile: ?*apr_file_t, errfile: ?*apr_file_t, diff_cmd: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_run_diff3_3(exitcode: [*c]c_int, dir: [*c]const u8, mine: [*c]const u8, older: [*c]const u8, yours: [*c]const u8, mine_label: [*c]const u8, older_label: [*c]const u8, yours_label: [*c]const u8, merged: ?*apr_file_t, diff3_cmd: [*c]const u8, user_args: [*c]const apr_array_header_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_run_diff3_2(exitcode: [*c]c_int, dir: [*c]const u8, mine: [*c]const u8, older: [*c]const u8, yours: [*c]const u8, mine_label: [*c]const u8, older_label: [*c]const u8, yours_label: [*c]const u8, merged: ?*apr_file_t, diff3_cmd: [*c]const u8, user_args: [*c]const apr_array_header_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_run_diff3(dir: [*c]const u8, mine: [*c]const u8, older: [*c]const u8, yours: [*c]const u8, mine_label: [*c]const u8, older_label: [*c]const u8, yours_label: [*c]const u8, merged: ?*apr_file_t, exitcode: [*c]c_int, diff3_cmd: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_parse_mimetypes_file(type_map: [*c]?*apr_hash_t, mimetypes_file: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_detect_mimetype2(mimetype: [*c][*c]const u8, file: [*c]const u8, mimetype_map: ?*apr_hash_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_detect_mimetype(mimetype: [*c][*c]const u8, file: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_is_binary_data(buf: ?*const anyopaque, len: apr_size_t) svn_boolean_t;
pub extern fn svn_io_file_open(new_file: [*c]?*apr_file_t, fname: [*c]const u8, flag: apr_int32_t, perm: apr_fileperms_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_file_close(file: ?*apr_file_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_file_getc(ch: [*c]u8, file: ?*apr_file_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_file_putc(ch: u8, file: ?*apr_file_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_file_info_get(finfo: [*c]apr_finfo_t, wanted: apr_int32_t, file: ?*apr_file_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_file_size_get(filesize_p: [*c]svn_filesize_t, file: ?*apr_file_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_file_get_offset(offset_p: [*c]apr_off_t, file: ?*apr_file_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_file_read(file: ?*apr_file_t, buf: ?*anyopaque, nbytes: [*c]apr_size_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_file_read_full2(file: ?*apr_file_t, buf: ?*anyopaque, nbytes: apr_size_t, bytes_read: [*c]apr_size_t, hit_eof: [*c]svn_boolean_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_file_read_full(file: ?*apr_file_t, buf: ?*anyopaque, nbytes: apr_size_t, bytes_read: [*c]apr_size_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_file_seek(file: ?*apr_file_t, where: apr_seek_where_t, offset: [*c]apr_off_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_file_aligned_seek(file: ?*apr_file_t, block_size: apr_off_t, buffer_start: [*c]apr_off_t, offset: apr_off_t, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_file_write(file: ?*apr_file_t, buf: ?*const anyopaque, nbytes: [*c]apr_size_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_file_flush(file: ?*apr_file_t, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_file_write_full(file: ?*apr_file_t, buf: ?*const anyopaque, nbytes: apr_size_t, bytes_written: [*c]apr_size_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_write_atomic2(final_path: [*c]const u8, buf: ?*const anyopaque, nbytes: apr_size_t, copy_perms_path: [*c]const u8, flush_to_disk: svn_boolean_t, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_write_atomic(final_path: [*c]const u8, buf: ?*const anyopaque, nbytes: apr_size_t, copy_perms_path: [*c]const u8, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_write_unique(tmp_path: [*c][*c]const u8, dirpath: [*c]const u8, buf: ?*const anyopaque, nbytes: apr_size_t, delete_when: svn_io_file_del_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_file_trunc(file: ?*apr_file_t, offset: apr_off_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_stat(finfo: [*c]apr_finfo_t, fname: [*c]const u8, wanted: apr_int32_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_file_rename2(from_path: [*c]const u8, to_path: [*c]const u8, flush_to_disk: svn_boolean_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_file_rename(from_path: [*c]const u8, to_path: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_file_move(from_path: [*c]const u8, to_path: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_dir_make(path: [*c]const u8, perm: apr_fileperms_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_dir_make_hidden(path: [*c]const u8, perm: apr_fileperms_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_dir_make_sgid(path: [*c]const u8, perm: apr_fileperms_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_dir_open(new_dir: [*c]?*apr_dir_t, dirname: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_dir_close(thedir: ?*apr_dir_t) [*c]svn_error_t;
pub extern fn svn_io_dir_remove_nonrecursive(dirname: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_dir_read(finfo: [*c]apr_finfo_t, wanted: apr_int32_t, thedir: ?*apr_dir_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_file_name_get(filename: [*c][*c]const u8, file: ?*apr_file_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_read_version_file(version: [*c]c_int, path: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_write_version_file(path: [*c]const u8, version: c_int, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_io_file_readline(file: ?*apr_file_t, stringbuf: [*c][*c]svn_stringbuf_t, eol: [*c][*c]const u8, eof: [*c]svn_boolean_t, max_len: apr_size_t, result_pool: ?*apr_pool_t, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_delta_version() [*c]const svn_version_t;
pub const svn_txdelta_source: c_int = 0;
pub const svn_txdelta_target: c_int = 1;
pub const svn_txdelta_new: c_int = 2;
pub const enum_svn_delta_action = c_uint;
pub const struct_svn_txdelta_op_t = extern struct {
    action_code: enum_svn_delta_action = @import("std").mem.zeroes(enum_svn_delta_action),
    offset: apr_size_t = 0,
    length: apr_size_t = 0,
};
pub const svn_txdelta_op_t = struct_svn_txdelta_op_t;
pub const struct_svn_txdelta_window_t = extern struct {
    sview_offset: svn_filesize_t = 0,
    sview_len: apr_size_t = 0,
    tview_len: apr_size_t = 0,
    num_ops: c_int = 0,
    src_ops: c_int = 0,
    ops: [*c]const svn_txdelta_op_t = null,
    new_data: [*c]const svn_string_t = null,
    pub const svn_txdelta_window_dup = __root.svn_txdelta_window_dup;
    pub const svn_txdelta_compose_windows = __root.svn_txdelta_compose_windows;
    pub const svn_txdelta_apply_instructions = __root.svn_txdelta_apply_instructions;
    pub const svn_delta_noop_window_handler = __root.svn_delta_noop_window_handler;
    pub const dup = __root.svn_txdelta_window_dup;
    pub const windows = __root.svn_txdelta_compose_windows;
    pub const instructions = __root.svn_txdelta_apply_instructions;
    pub const handler = __root.svn_delta_noop_window_handler;
};
pub const svn_txdelta_window_t = struct_svn_txdelta_window_t;
pub extern fn svn_txdelta_window_dup(window: [*c]const svn_txdelta_window_t, pool: ?*apr_pool_t) [*c]svn_txdelta_window_t;
pub extern fn svn_txdelta_compose_windows(window_A: [*c]const svn_txdelta_window_t, window_B: [*c]const svn_txdelta_window_t, pool: ?*apr_pool_t) [*c]svn_txdelta_window_t;
pub extern fn svn_txdelta_apply_instructions(window: [*c]svn_txdelta_window_t, sbuf: [*c]const u8, tbuf: [*c]u8, tlen: [*c]apr_size_t) void;
pub const svn_txdelta_window_handler_t = ?*const fn (window: [*c]svn_txdelta_window_t, baton: ?*anyopaque) callconv(.c) [*c]svn_error_t;
pub extern fn svn_txdelta_run(source: ?*svn_stream_t, target: ?*svn_stream_t, handler: svn_txdelta_window_handler_t, handler_baton: ?*anyopaque, checksum_kind: svn_checksum_kind_t, checksum: [*c][*c]svn_checksum_t, cancel_func: svn_cancel_func_t, cancel_baton: ?*anyopaque, result_pool: ?*apr_pool_t, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub const struct_svn_txdelta_stream_t = opaque {
    pub const svn_txdelta_md5_digest = __root.svn_txdelta_md5_digest;
    pub const svn_txdelta_send_txstream = __root.svn_txdelta_send_txstream;
    pub const svn_txdelta_to_svndiff_stream = __root.svn_txdelta_to_svndiff_stream;
    pub const digest = __root.svn_txdelta_md5_digest;
    pub const txstream = __root.svn_txdelta_send_txstream;
    pub const stream = __root.svn_txdelta_to_svndiff_stream;
};
pub const svn_txdelta_stream_t = struct_svn_txdelta_stream_t;
pub const svn_txdelta_next_window_fn_t = ?*const fn (window: [*c][*c]svn_txdelta_window_t, baton: ?*anyopaque, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t;
pub const svn_txdelta_md5_digest_fn_t = ?*const fn (baton: ?*anyopaque) callconv(.c) [*c]const u8;
pub const svn_txdelta_stream_open_func_t = ?*const fn (txdelta_stream: [*c]?*svn_txdelta_stream_t, baton: ?*anyopaque, result_pool: ?*apr_pool_t, scratch_pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t;
pub extern fn svn_txdelta_stream_create(baton: ?*anyopaque, next_window: svn_txdelta_next_window_fn_t, md5_digest: svn_txdelta_md5_digest_fn_t, pool: ?*apr_pool_t) ?*svn_txdelta_stream_t;
pub extern fn svn_txdelta_next_window(window: [*c][*c]svn_txdelta_window_t, stream: ?*svn_txdelta_stream_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_txdelta_md5_digest(stream: ?*svn_txdelta_stream_t) [*c]const u8;
pub extern fn svn_txdelta2(stream: [*c]?*svn_txdelta_stream_t, source: ?*svn_stream_t, target: ?*svn_stream_t, calculate_checksum: svn_boolean_t, pool: ?*apr_pool_t) void;
pub extern fn svn_txdelta(stream: [*c]?*svn_txdelta_stream_t, source: ?*svn_stream_t, target: ?*svn_stream_t, pool: ?*apr_pool_t) void;
pub extern fn svn_txdelta_target_push(handler: svn_txdelta_window_handler_t, handler_baton: ?*anyopaque, source: ?*svn_stream_t, pool: ?*apr_pool_t) ?*svn_stream_t;
pub extern fn svn_txdelta_send_string(string: [*c]const svn_string_t, handler: svn_txdelta_window_handler_t, handler_baton: ?*anyopaque, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_txdelta_send_stream(stream: ?*svn_stream_t, handler: svn_txdelta_window_handler_t, handler_baton: ?*anyopaque, digest: [*c]u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_txdelta_send_txstream(txstream: ?*svn_txdelta_stream_t, handler: svn_txdelta_window_handler_t, handler_baton: ?*anyopaque, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_txdelta_send_contents(contents: [*c]const u8, len: apr_size_t, handler: svn_txdelta_window_handler_t, handler_baton: ?*anyopaque, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_txdelta_apply2(source: ?*svn_stream_t, target: ?*svn_stream_t, result_digest: [*c]u8, error_info: [*c]const u8, pool: ?*apr_pool_t, handler: [*c]svn_txdelta_window_handler_t, handler_baton: [*c]?*anyopaque) void;
pub extern fn svn_txdelta_apply(source: ?*svn_stream_t, target: ?*svn_stream_t, result_digest: [*c]u8, error_info: [*c]const u8, pool: ?*apr_pool_t, handler: [*c]svn_txdelta_window_handler_t, handler_baton: [*c]?*anyopaque) void;
pub extern fn svn_txdelta_to_svndiff3(handler: [*c]svn_txdelta_window_handler_t, handler_baton: [*c]?*anyopaque, output: ?*svn_stream_t, svndiff_version: c_int, compression_level: c_int, pool: ?*apr_pool_t) void;
pub extern fn svn_txdelta_to_svndiff2(handler: [*c]svn_txdelta_window_handler_t, handler_baton: [*c]?*anyopaque, output: ?*svn_stream_t, svndiff_version: c_int, pool: ?*apr_pool_t) void;
pub extern fn svn_txdelta_to_svndiff(output: ?*svn_stream_t, pool: ?*apr_pool_t, handler: [*c]svn_txdelta_window_handler_t, handler_baton: [*c]?*anyopaque) void;
pub extern fn svn_txdelta_to_svndiff_stream(txstream: ?*svn_txdelta_stream_t, svndiff_version: c_int, compression_level: c_int, pool: ?*apr_pool_t) ?*svn_stream_t;
pub extern fn svn_txdelta_parse_svndiff(handler: svn_txdelta_window_handler_t, handler_baton: ?*anyopaque, error_on_early_close: svn_boolean_t, pool: ?*apr_pool_t) ?*svn_stream_t;
pub extern fn svn_txdelta_read_svndiff_window(window: [*c][*c]svn_txdelta_window_t, stream: ?*svn_stream_t, svndiff_version: c_int, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_txdelta_skip_svndiff_window(file: ?*apr_file_t, svndiff_version: c_int, pool: ?*apr_pool_t) [*c]svn_error_t;
pub const struct_svn_delta_editor_t = extern struct {
    set_target_revision: ?*const fn (edit_baton: ?*anyopaque, target_revision: svn_revnum_t, scratch_pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    open_root: ?*const fn (edit_baton: ?*anyopaque, base_revision: svn_revnum_t, result_pool: ?*apr_pool_t, root_baton: [*c]?*anyopaque) callconv(.c) [*c]svn_error_t = null,
    delete_entry: ?*const fn (path: [*c]const u8, revision: svn_revnum_t, parent_baton: ?*anyopaque, scratch_pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    add_directory: ?*const fn (path: [*c]const u8, parent_baton: ?*anyopaque, copyfrom_path: [*c]const u8, copyfrom_revision: svn_revnum_t, result_pool: ?*apr_pool_t, child_baton: [*c]?*anyopaque) callconv(.c) [*c]svn_error_t = null,
    open_directory: ?*const fn (path: [*c]const u8, parent_baton: ?*anyopaque, base_revision: svn_revnum_t, result_pool: ?*apr_pool_t, child_baton: [*c]?*anyopaque) callconv(.c) [*c]svn_error_t = null,
    change_dir_prop: ?*const fn (dir_baton: ?*anyopaque, name: [*c]const u8, value: [*c]const svn_string_t, scratch_pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    close_directory: ?*const fn (dir_baton: ?*anyopaque, scratch_pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    absent_directory: ?*const fn (path: [*c]const u8, parent_baton: ?*anyopaque, scratch_pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    add_file: ?*const fn (path: [*c]const u8, parent_baton: ?*anyopaque, copyfrom_path: [*c]const u8, copyfrom_revision: svn_revnum_t, result_pool: ?*apr_pool_t, file_baton: [*c]?*anyopaque) callconv(.c) [*c]svn_error_t = null,
    open_file: ?*const fn (path: [*c]const u8, parent_baton: ?*anyopaque, base_revision: svn_revnum_t, result_pool: ?*apr_pool_t, file_baton: [*c]?*anyopaque) callconv(.c) [*c]svn_error_t = null,
    apply_textdelta: ?*const fn (file_baton: ?*anyopaque, base_checksum: [*c]const u8, result_pool: ?*apr_pool_t, handler: [*c]svn_txdelta_window_handler_t, handler_baton: [*c]?*anyopaque) callconv(.c) [*c]svn_error_t = null,
    change_file_prop: ?*const fn (file_baton: ?*anyopaque, name: [*c]const u8, value: [*c]const svn_string_t, scratch_pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    close_file: ?*const fn (file_baton: ?*anyopaque, text_checksum: [*c]const u8, scratch_pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    absent_file: ?*const fn (path: [*c]const u8, parent_baton: ?*anyopaque, scratch_pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    close_edit: ?*const fn (edit_baton: ?*anyopaque, scratch_pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    abort_edit: ?*const fn (edit_baton: ?*anyopaque, scratch_pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    apply_textdelta_stream: ?*const fn (editor: [*c]const struct_svn_delta_editor_t, file_baton: ?*anyopaque, base_checksum: [*c]const u8, open_func: svn_txdelta_stream_open_func_t, open_baton: ?*anyopaque, scratch_pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    pub const svn_delta_path_driver3 = __root.svn_delta_path_driver3;
    pub const svn_delta_path_driver2 = __root.svn_delta_path_driver2;
    pub const svn_delta_path_driver = __root.svn_delta_path_driver;
    pub const driver3 = __root.svn_delta_path_driver3;
    pub const driver2 = __root.svn_delta_path_driver2;
    pub const driver = __root.svn_delta_path_driver;
};
pub const svn_delta_editor_t = struct_svn_delta_editor_t;
pub extern fn svn_delta_default_editor(pool: ?*apr_pool_t) [*c]svn_delta_editor_t;
pub extern fn svn_delta_noop_window_handler(window: [*c]svn_txdelta_window_t, baton: ?*anyopaque) [*c]svn_error_t;
pub extern fn svn_delta_get_cancellation_editor(cancel_func: svn_cancel_func_t, cancel_baton: ?*anyopaque, wrapped_editor: [*c]const svn_delta_editor_t, wrapped_baton: ?*anyopaque, editor: [*c][*c]const svn_delta_editor_t, edit_baton: [*c]?*anyopaque, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_delta_depth_filter_editor(editor: [*c][*c]const svn_delta_editor_t, edit_baton: [*c]?*anyopaque, wrapped_editor: [*c]const svn_delta_editor_t, wrapped_edit_baton: ?*anyopaque, requested_depth: svn_depth_t, has_target: svn_boolean_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub const svn_delta_path_driver_cb_func2_t = ?*const fn (dir_baton: [*c]?*anyopaque, editor: [*c]const svn_delta_editor_t, edit_baton: ?*anyopaque, parent_baton: ?*anyopaque, callback_baton: ?*anyopaque, relpath: [*c]const u8, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t;
pub const svn_delta_path_driver_cb_func_t = ?*const fn (dir_baton: [*c]?*anyopaque, parent_baton: ?*anyopaque, callback_baton: ?*anyopaque, path: [*c]const u8, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t;
pub extern fn svn_delta_path_driver3(editor: [*c]const svn_delta_editor_t, edit_baton: ?*anyopaque, relpaths: [*c]const apr_array_header_t, sort_paths: svn_boolean_t, callback_func: svn_delta_path_driver_cb_func2_t, callback_baton: ?*anyopaque, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_delta_path_driver2(editor: [*c]const svn_delta_editor_t, edit_baton: ?*anyopaque, paths: [*c]const apr_array_header_t, sort_paths: svn_boolean_t, callback_func: svn_delta_path_driver_cb_func_t, callback_baton: ?*anyopaque, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_delta_path_driver(editor: [*c]const svn_delta_editor_t, edit_baton: ?*anyopaque, revision: svn_revnum_t, paths: [*c]const apr_array_header_t, callback_func: svn_delta_path_driver_cb_func_t, callback_baton: ?*anyopaque, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub const struct_svn_delta_path_driver_state_t = opaque {
    pub const svn_delta_path_driver_step = __root.svn_delta_path_driver_step;
    pub const svn_delta_path_driver_finish = __root.svn_delta_path_driver_finish;
    pub const step = __root.svn_delta_path_driver_step;
    pub const finish = __root.svn_delta_path_driver_finish;
};
pub const svn_delta_path_driver_state_t = struct_svn_delta_path_driver_state_t;
pub extern fn svn_delta_path_driver_start(state_p: [*c]?*svn_delta_path_driver_state_t, editor: [*c]const svn_delta_editor_t, edit_baton: ?*anyopaque, callback_func: svn_delta_path_driver_cb_func2_t, callback_baton: ?*anyopaque, result_pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_delta_path_driver_step(state: ?*svn_delta_path_driver_state_t, relpath: [*c]const u8, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_delta_path_driver_finish(state: ?*svn_delta_path_driver_state_t, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub const svn_file_rev_handler_t = ?*const fn (baton: ?*anyopaque, path: [*c]const u8, rev: svn_revnum_t, rev_props: ?*apr_hash_t, result_of_merge: svn_boolean_t, delta_handler: [*c]svn_txdelta_window_handler_t, delta_baton: [*c]?*anyopaque, prop_diffs: [*c]apr_array_header_t, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t;
pub const svn_file_rev_handler_old_t = ?*const fn (baton: ?*anyopaque, path: [*c]const u8, rev: svn_revnum_t, rev_props: ?*apr_hash_t, delta_handler: [*c]svn_txdelta_window_handler_t, delta_baton: [*c]?*anyopaque, prop_diffs: [*c]apr_array_header_t, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t;
pub extern fn svn_compat_wrap_file_rev_handler(handler2: [*c]svn_file_rev_handler_t, handler2_baton: [*c]?*anyopaque, handler: svn_file_rev_handler_old_t, handler_baton: ?*anyopaque, pool: ?*apr_pool_t) void;
pub const svn_rangelist_t = apr_array_header_t;
pub const svn_mergeinfo_t = ?*apr_hash_t;
pub const svn_mergeinfo_catalog_t = ?*apr_hash_t;
pub extern fn svn_mergeinfo_parse(mergeinfo: [*c]svn_mergeinfo_t, input: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_mergeinfo_diff2(deleted: [*c]svn_mergeinfo_t, added: [*c]svn_mergeinfo_t, mergefrom: svn_mergeinfo_t, mergeto: svn_mergeinfo_t, consider_inheritance: svn_boolean_t, result_pool: ?*apr_pool_t, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_mergeinfo_diff(deleted: [*c]svn_mergeinfo_t, added: [*c]svn_mergeinfo_t, mergefrom: svn_mergeinfo_t, mergeto: svn_mergeinfo_t, consider_inheritance: svn_boolean_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_mergeinfo_merge2(mergeinfo: svn_mergeinfo_t, changes: svn_mergeinfo_t, result_pool: ?*apr_pool_t, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_mergeinfo_merge(mergeinfo: svn_mergeinfo_t, changes: svn_mergeinfo_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_mergeinfo_catalog_merge(mergeinfo_catalog: svn_mergeinfo_catalog_t, changes_catalog: svn_mergeinfo_catalog_t, result_pool: ?*apr_pool_t, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_mergeinfo_remove(mergeinfo: [*c]svn_mergeinfo_t, eraser: svn_mergeinfo_t, whiteboard: svn_mergeinfo_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_mergeinfo_remove2(mergeinfo: [*c]svn_mergeinfo_t, eraser: svn_mergeinfo_t, whiteboard: svn_mergeinfo_t, consider_inheritance: svn_boolean_t, result_pool: ?*apr_pool_t, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_rangelist_diff(deleted: [*c][*c]svn_rangelist_t, added: [*c][*c]svn_rangelist_t, from: [*c]const svn_rangelist_t, to: [*c]const svn_rangelist_t, consider_inheritance: svn_boolean_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_rangelist_merge2(rangelist: [*c]svn_rangelist_t, changes: [*c]const svn_rangelist_t, result_pool: ?*apr_pool_t, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_rangelist_merge(rangelist: [*c][*c]svn_rangelist_t, changes: [*c]const svn_rangelist_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_rangelist_remove(output: [*c][*c]svn_rangelist_t, eraser: [*c]const svn_rangelist_t, whiteboard: [*c]const svn_rangelist_t, consider_inheritance: svn_boolean_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_mergeinfo_intersect2(mergeinfo: [*c]svn_mergeinfo_t, mergeinfo1: svn_mergeinfo_t, mergeinfo2: svn_mergeinfo_t, consider_inheritance: svn_boolean_t, result_pool: ?*apr_pool_t, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_mergeinfo_intersect(mergeinfo: [*c]svn_mergeinfo_t, mergeinfo1: svn_mergeinfo_t, mergeinfo2: svn_mergeinfo_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_rangelist_intersect(rangelist: [*c][*c]svn_rangelist_t, rangelist1: [*c]const svn_rangelist_t, rangelist2: [*c]const svn_rangelist_t, consider_inheritance: svn_boolean_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_rangelist_reverse(rangelist: [*c]svn_rangelist_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_rangelist_to_string(output: [*c][*c]svn_string_t, rangelist: [*c]const svn_rangelist_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_rangelist_inheritable2(inheritable_rangelist: [*c][*c]svn_rangelist_t, rangelist: [*c]const svn_rangelist_t, start: svn_revnum_t, end: svn_revnum_t, inheritable: svn_boolean_t, result_pool: ?*apr_pool_t, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_rangelist_inheritable(inheritable_rangelist: [*c][*c]svn_rangelist_t, rangelist: [*c]const svn_rangelist_t, start: svn_revnum_t, end: svn_revnum_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_mergeinfo_inheritable2(inheritable_mergeinfo: [*c]svn_mergeinfo_t, mergeinfo: svn_mergeinfo_t, path: [*c]const u8, start: svn_revnum_t, end: svn_revnum_t, inheritable: svn_boolean_t, result_pool: ?*apr_pool_t, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_mergeinfo_inheritable(inheritable_mergeinfo: [*c]svn_mergeinfo_t, mergeinfo: svn_mergeinfo_t, path: [*c]const u8, start: svn_revnum_t, end: svn_revnum_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_mergeinfo_to_string(output: [*c][*c]svn_string_t, mergeinput: svn_mergeinfo_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_mergeinfo_sort(mergeinfo: svn_mergeinfo_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_mergeinfo_catalog_dup(mergeinfo_catalog: svn_mergeinfo_catalog_t, pool: ?*apr_pool_t) svn_mergeinfo_catalog_t;
pub extern fn svn_mergeinfo_dup(mergeinfo: svn_mergeinfo_t, pool: ?*apr_pool_t) svn_mergeinfo_t;
pub extern fn svn_rangelist_dup(rangelist: [*c]const svn_rangelist_t, pool: ?*apr_pool_t) [*c]svn_rangelist_t;
pub const svn_mergeinfo_explicit: c_int = 0;
pub const svn_mergeinfo_inherited: c_int = 1;
pub const svn_mergeinfo_nearest_ancestor: c_int = 2;
pub const enum_svn_mergeinfo_inheritance_t = c_uint;
pub const svn_mergeinfo_inheritance_t = enum_svn_mergeinfo_inheritance_t;
pub extern fn svn_inheritance_to_word(inherit: svn_mergeinfo_inheritance_t) [*c]const u8;
pub extern fn svn_inheritance_from_word(word: [*c]const u8) svn_mergeinfo_inheritance_t;
pub extern fn svn_fs_version() [*c]const svn_version_t;
pub const svn_fs_warning_callback_t = ?*const fn (baton: ?*anyopaque, err: [*c]svn_error_t) callconv(.c) void;
pub const struct_svn_fs_access_t = extern struct {
    username: [*c]const u8 = null,
    lock_tokens: ?*apr_hash_t = null,
    pub const svn_fs_access_add_lock_token2 = __root.svn_fs_access_add_lock_token2;
    pub const svn_fs_access_add_lock_token = __root.svn_fs_access_add_lock_token;
    pub const token2 = __root.svn_fs_access_add_lock_token2;
    pub const token = __root.svn_fs_access_add_lock_token;
};
pub const svn_fs_access_t = struct_svn_fs_access_t;
pub const svn_fs_t = struct_svn_fs_t;
pub const svn_fs_path_change_modify: c_int = 0;
pub const svn_fs_path_change_add: c_int = 1;
pub const svn_fs_path_change_delete: c_int = 2;
pub const svn_fs_path_change_replace: c_int = 3;
pub const svn_fs_path_change_reset: c_int = 4;
pub const enum_svn_fs_path_change_kind_t = c_uint;
pub const svn_fs_path_change_kind_t = enum_svn_fs_path_change_kind_t;
pub const struct_svn_fs_path_change3_t = extern struct {
    path: svn_string_t = @import("std").mem.zeroes(svn_string_t),
    change_kind: svn_fs_path_change_kind_t = @import("std").mem.zeroes(svn_fs_path_change_kind_t),
    node_kind: svn_node_kind_t = @import("std").mem.zeroes(svn_node_kind_t),
    text_mod: svn_boolean_t = 0,
    prop_mod: svn_boolean_t = 0,
    mergeinfo_mod: svn_tristate_t = @import("std").mem.zeroes(svn_tristate_t),
    copyfrom_known: svn_boolean_t = 0,
    copyfrom_rev: svn_revnum_t = 0,
    copyfrom_path: [*c]const u8 = null,
    pub const svn_fs_path_change3_dup = __root.svn_fs_path_change3_dup;
    pub const dup = __root.svn_fs_path_change3_dup;
};
pub const svn_fs_path_change3_t = struct_svn_fs_path_change3_t;
pub const struct_changes_iterator_vtable_t = extern struct {
    get: ?*const fn (change: [*c][*c]svn_fs_path_change3_t, iterator: [*c]svn_fs_path_change_iterator_t) callconv(.c) [*c]svn_error_t = null,
};
pub const changes_iterator_vtable_t = struct_changes_iterator_vtable_t;
pub const struct_svn_fs_path_change_iterator_t = extern struct {
    vtable: [*c]const changes_iterator_vtable_t = null,
    fsap_data: ?*anyopaque = null,
};
pub const svn_fs_path_change_iterator_t = struct_svn_fs_path_change_iterator_t;
pub const struct_history_vtable_t = extern struct {
    prev: ?*const fn (prev_history_p: [*c][*c]svn_fs_history_t, history: [*c]svn_fs_history_t, cross_copies: svn_boolean_t, result_pool: ?*apr_pool_t, scratch_pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    location: ?*const fn (path: [*c][*c]const u8, revision: [*c]svn_revnum_t, history: [*c]svn_fs_history_t, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
};
pub const history_vtable_t = struct_history_vtable_t;
pub const struct_svn_fs_history_t = extern struct {
    vtable: [*c]const history_vtable_t = null,
    fsap_data: ?*anyopaque = null,
};
pub const svn_fs_history_t = struct_svn_fs_history_t;
pub const svn_fs_node_unrelated: c_int = 0;
pub const svn_fs_node_unchanged: c_int = 1;
pub const svn_fs_node_common_ancestor: c_int = 2;
pub const enum_svn_fs_node_relation_t = c_uint;
pub const svn_fs_node_relation_t = enum_svn_fs_node_relation_t;
pub const struct_id_vtable_t = extern struct {
    unparse: ?*const fn (id: [*c]const svn_fs_id_t, pool: ?*apr_pool_t) callconv(.c) [*c]svn_string_t = null,
    compare: ?*const fn (a: [*c]const svn_fs_id_t, b: [*c]const svn_fs_id_t) callconv(.c) svn_fs_node_relation_t = null,
};
pub const id_vtable_t = struct_id_vtable_t;
pub const struct_svn_fs_id_t = extern struct {
    vtable: [*c]const id_vtable_t = null,
    fsap_data: ?*anyopaque = null,
    pub const svn_fs_compare_ids = __root.svn_fs_compare_ids;
    pub const svn_fs_check_related = __root.svn_fs_check_related;
    pub const svn_fs_unparse_id = __root.svn_fs_unparse_id;
    pub const svn_fs_path_change2_create = __root.svn_fs_path_change2_create;
    pub const svn_fs__path_change_create_internal = __root.svn_fs__path_change_create_internal;
    pub const ids = __root.svn_fs_compare_ids;
    pub const related = __root.svn_fs_check_related;
    pub const id = __root.svn_fs_unparse_id;
    pub const create = __root.svn_fs_path_change2_create;
    pub const internal = __root.svn_fs__path_change_create_internal;
};
pub const svn_fs_id_t = struct_svn_fs_id_t;
pub const svn_fs_process_contents_func_t = ?*const fn (contents: [*c]const u8, len: apr_size_t, baton: ?*anyopaque, scratch_pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t;
pub const svn_fs_mergeinfo_receiver_t = ?*const fn (path: [*c]const u8, mergeinfo: svn_mergeinfo_t, baton: ?*anyopaque, scratch_pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t;
pub const struct_root_vtable_t = extern struct {
    paths_changed: ?*const fn (changed_paths_p: [*c]?*apr_hash_t, root: [*c]svn_fs_root_t, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    report_changes: ?*const fn (iterator: [*c][*c]svn_fs_path_change_iterator_t, root: [*c]svn_fs_root_t, result_pool: ?*apr_pool_t, scratch_pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    check_path: ?*const fn (kind_p: [*c]svn_node_kind_t, root: [*c]svn_fs_root_t, path: [*c]const u8, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    node_history: ?*const fn (history_p: [*c][*c]svn_fs_history_t, root: [*c]svn_fs_root_t, path: [*c]const u8, result_pool: ?*apr_pool_t, scratch_pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    node_id: ?*const fn (id_p: [*c][*c]const svn_fs_id_t, root: [*c]svn_fs_root_t, path: [*c]const u8, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    node_relation: ?*const fn (relation: [*c]svn_fs_node_relation_t, root_a: [*c]svn_fs_root_t, path_a: [*c]const u8, root_b: [*c]svn_fs_root_t, path_b: [*c]const u8, scratch_pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    node_created_rev: ?*const fn (revision: [*c]svn_revnum_t, root: [*c]svn_fs_root_t, path: [*c]const u8, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    node_origin_rev: ?*const fn (revision: [*c]svn_revnum_t, root: [*c]svn_fs_root_t, path: [*c]const u8, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    node_created_path: ?*const fn (created_path: [*c][*c]const u8, root: [*c]svn_fs_root_t, path: [*c]const u8, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    delete_node: ?*const fn (root: [*c]svn_fs_root_t, path: [*c]const u8, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    copy: ?*const fn (from_root: [*c]svn_fs_root_t, from_path: [*c]const u8, to_root: [*c]svn_fs_root_t, to_path: [*c]const u8, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    revision_link: ?*const fn (from_root: [*c]svn_fs_root_t, to_root: [*c]svn_fs_root_t, path: [*c]const u8, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    copied_from: ?*const fn (rev_p: [*c]svn_revnum_t, path_p: [*c][*c]const u8, root: [*c]svn_fs_root_t, path: [*c]const u8, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    closest_copy: ?*const fn (root_p: [*c][*c]svn_fs_root_t, path_p: [*c][*c]const u8, root: [*c]svn_fs_root_t, path: [*c]const u8, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    node_prop: ?*const fn (value_p: [*c][*c]svn_string_t, root: [*c]svn_fs_root_t, path: [*c]const u8, propname: [*c]const u8, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    node_proplist: ?*const fn (table_p: [*c]?*apr_hash_t, root: [*c]svn_fs_root_t, path: [*c]const u8, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    node_has_props: ?*const fn (has_props: [*c]svn_boolean_t, root: [*c]svn_fs_root_t, path: [*c]const u8, scratch_pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    change_node_prop: ?*const fn (root: [*c]svn_fs_root_t, path: [*c]const u8, name: [*c]const u8, value: [*c]const svn_string_t, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    props_changed: ?*const fn (changed_p: [*c]c_int, root1: [*c]svn_fs_root_t, path1: [*c]const u8, root2: [*c]svn_fs_root_t, path2: [*c]const u8, strict: svn_boolean_t, scratch_pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    dir_entries: ?*const fn (entries_p: [*c]?*apr_hash_t, root: [*c]svn_fs_root_t, path: [*c]const u8, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    dir_optimal_order: ?*const fn (ordered_p: [*c][*c]apr_array_header_t, root: [*c]svn_fs_root_t, entries: ?*apr_hash_t, result_pool: ?*apr_pool_t, scratch_pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    make_dir: ?*const fn (root: [*c]svn_fs_root_t, path: [*c]const u8, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    file_length: ?*const fn (length_p: [*c]svn_filesize_t, root: [*c]svn_fs_root_t, path: [*c]const u8, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    file_checksum: ?*const fn (checksum: [*c][*c]svn_checksum_t, kind: svn_checksum_kind_t, root: [*c]svn_fs_root_t, path: [*c]const u8, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    file_contents: ?*const fn (contents: [*c]?*svn_stream_t, root: [*c]svn_fs_root_t, path: [*c]const u8, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    try_process_file_contents: ?*const fn (success: [*c]svn_boolean_t, target_root: [*c]svn_fs_root_t, target_path: [*c]const u8, processor: svn_fs_process_contents_func_t, baton: ?*anyopaque, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    make_file: ?*const fn (root: [*c]svn_fs_root_t, path: [*c]const u8, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    apply_textdelta: ?*const fn (contents_p: [*c]svn_txdelta_window_handler_t, contents_baton_p: [*c]?*anyopaque, root: [*c]svn_fs_root_t, path: [*c]const u8, base_checksum: [*c]svn_checksum_t, result_checksum: [*c]svn_checksum_t, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    apply_text: ?*const fn (contents_p: [*c]?*svn_stream_t, root: [*c]svn_fs_root_t, path: [*c]const u8, result_checksum: [*c]svn_checksum_t, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    contents_changed: ?*const fn (changed_p: [*c]c_int, root1: [*c]svn_fs_root_t, path1: [*c]const u8, root2: [*c]svn_fs_root_t, path2: [*c]const u8, strict: svn_boolean_t, scratch_pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    get_file_delta_stream: ?*const fn (stream_p: [*c]?*svn_txdelta_stream_t, source_root: [*c]svn_fs_root_t, source_path: [*c]const u8, target_root: [*c]svn_fs_root_t, target_path: [*c]const u8, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    merge: ?*const fn (conflict_p: [*c][*c]const u8, source_root: [*c]svn_fs_root_t, source_path: [*c]const u8, target_root: [*c]svn_fs_root_t, target_path: [*c]const u8, ancestor_root: [*c]svn_fs_root_t, ancestor_path: [*c]const u8, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    get_mergeinfo: ?*const fn (root: [*c]svn_fs_root_t, paths: [*c]const apr_array_header_t, inherit: svn_mergeinfo_inheritance_t, include_descendants: svn_boolean_t, adjust_inherited_mergeinfo: svn_boolean_t, receiver: svn_fs_mergeinfo_receiver_t, baton: ?*anyopaque, scratch_pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
};
pub const root_vtable_t = struct_root_vtable_t;
pub const struct_svn_fs_root_t = extern struct {
    pool: ?*apr_pool_t = null,
    fs: [*c]svn_fs_t = null,
    is_txn_root: svn_boolean_t = 0,
    txn: [*c]const u8 = null,
    txn_flags: apr_uint32_t = 0,
    rev: svn_revnum_t = 0,
    vtable: [*c]const root_vtable_t = null,
    fsap_data: ?*anyopaque = null,
    pub const svn_fs_close_root = __root.svn_fs_close_root;
    pub const svn_fs_root_fs = __root.svn_fs_root_fs;
    pub const svn_fs_is_txn_root = __root.svn_fs_is_txn_root;
    pub const svn_fs_is_revision_root = __root.svn_fs_is_revision_root;
    pub const svn_fs_txn_root_name = __root.svn_fs_txn_root_name;
    pub const svn_fs_txn_root_base_revision = __root.svn_fs_txn_root_base_revision;
    pub const svn_fs_revision_root_revision = __root.svn_fs_revision_root_revision;
    pub const svn_fs_change_node_prop = __root.svn_fs_change_node_prop;
    pub const svn_fs_get_mergeinfo3 = __root.svn_fs_get_mergeinfo3;
    pub const svn_fs_make_dir = __root.svn_fs_make_dir;
    pub const svn_fs_delete = __root.svn_fs_delete;
    pub const svn_fs_copy = __root.svn_fs_copy;
    pub const svn_fs_revision_link = __root.svn_fs_revision_link;
    pub const svn_fs_make_file = __root.svn_fs_make_file;
    pub const svn_fs_verify_root = __root.svn_fs_verify_root;
    pub const root = __root.svn_fs_close_root;
    pub const name = __root.svn_fs_txn_root_name;
    pub const revision = __root.svn_fs_txn_root_base_revision;
    pub const prop = __root.svn_fs_change_node_prop;
    pub const mergeinfo3 = __root.svn_fs_get_mergeinfo3;
    pub const dir = __root.svn_fs_make_dir;
    pub const delete = __root.svn_fs_delete;
    pub const copy = __root.svn_fs_copy;
    pub const link = __root.svn_fs_revision_link;
    pub const file = __root.svn_fs_make_file;
};
pub const svn_fs_root_t = struct_svn_fs_root_t;
pub const struct_txn_vtable_t = extern struct {
    commit: ?*const fn (conflict_p: [*c][*c]const u8, new_rev: [*c]svn_revnum_t, txn: [*c]svn_fs_txn_t, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    abort: ?*const fn (txn: [*c]svn_fs_txn_t, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    get_prop: ?*const fn (value_p: [*c][*c]svn_string_t, txn: [*c]svn_fs_txn_t, propname: [*c]const u8, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    get_proplist: ?*const fn (table_p: [*c]?*apr_hash_t, txn: [*c]svn_fs_txn_t, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    change_prop: ?*const fn (txn: [*c]svn_fs_txn_t, name: [*c]const u8, value: [*c]const svn_string_t, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    root: ?*const fn (root_p: [*c][*c]svn_fs_root_t, txn: [*c]svn_fs_txn_t, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    change_props: ?*const fn (txn: [*c]svn_fs_txn_t, props: [*c]const apr_array_header_t, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
};
pub const txn_vtable_t = struct_txn_vtable_t;
pub const struct_svn_fs_txn_t = extern struct {
    fs: [*c]svn_fs_t = null,
    base_rev: svn_revnum_t = 0,
    id: [*c]const u8 = null,
    vtable: [*c]const txn_vtable_t = null,
    fsap_data: ?*anyopaque = null,
    pub const svn_fs_abort_txn = __root.svn_fs_abort_txn;
    pub const svn_fs_txn_base_revision = __root.svn_fs_txn_base_revision;
    pub const svn_fs_change_txn_prop = __root.svn_fs_change_txn_prop;
    pub const svn_fs_change_txn_props = __root.svn_fs_change_txn_props;
    pub const txn = __root.svn_fs_abort_txn;
    pub const revision = __root.svn_fs_txn_base_revision;
    pub const prop = __root.svn_fs_change_txn_prop;
    pub const props = __root.svn_fs_change_txn_props;
};
pub const svn_fs_txn_t = struct_svn_fs_txn_t;
pub const svn_fs_lock_callback_t = ?*const fn (baton: ?*anyopaque, path: [*c]const u8, lock: [*c]const svn_lock_t, fs_err: [*c]svn_error_t, scratch_pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t;
pub const svn_fs_get_locks_callback_t = ?*const fn (baton: ?*anyopaque, lock: [*c]svn_lock_t, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t;
pub const svn_fs_freeze_func_t = ?*const fn (baton: ?*anyopaque, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t;
pub const struct_svn_fs_ioctl_code_t = extern struct {
    fs_type: [*c]const u8 = null,
    code: c_int = 0,
};
pub const svn_fs_ioctl_code_t = struct_svn_fs_ioctl_code_t;
pub const struct_fs_vtable_t = extern struct {
    youngest_rev: ?*const fn (youngest_p: [*c]svn_revnum_t, fs: [*c]svn_fs_t, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    refresh_revprops: ?*const fn (fs: [*c]svn_fs_t, scratch_pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    revision_prop: ?*const fn (value_p: [*c][*c]svn_string_t, fs: [*c]svn_fs_t, rev: svn_revnum_t, propname: [*c]const u8, refresh: svn_boolean_t, result_pool: ?*apr_pool_t, scratch_pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    revision_proplist: ?*const fn (table_p: [*c]?*apr_hash_t, fs: [*c]svn_fs_t, rev: svn_revnum_t, refresh: svn_boolean_t, result_pool: ?*apr_pool_t, scratch_pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    change_rev_prop: ?*const fn (fs: [*c]svn_fs_t, rev: svn_revnum_t, name: [*c]const u8, old_value_p: [*c]const [*c]const svn_string_t, value: [*c]const svn_string_t, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    set_uuid: ?*const fn (fs: [*c]svn_fs_t, uuid: [*c]const u8, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    revision_root: ?*const fn (root_p: [*c][*c]svn_fs_root_t, fs: [*c]svn_fs_t, rev: svn_revnum_t, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    begin_txn: ?*const fn (txn_p: [*c][*c]svn_fs_txn_t, fs: [*c]svn_fs_t, rev: svn_revnum_t, flags: apr_uint32_t, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    open_txn: ?*const fn (txn: [*c][*c]svn_fs_txn_t, fs: [*c]svn_fs_t, name: [*c]const u8, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    purge_txn: ?*const fn (fs: [*c]svn_fs_t, txn_id: [*c]const u8, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    list_transactions: ?*const fn (names_p: [*c][*c]apr_array_header_t, fs: [*c]svn_fs_t, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    deltify: ?*const fn (fs: [*c]svn_fs_t, rev: svn_revnum_t, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    lock: ?*const fn (fs: [*c]svn_fs_t, targets: ?*apr_hash_t, comment: [*c]const u8, is_dav_comment: svn_boolean_t, expiration_date: apr_time_t, steal_lock: svn_boolean_t, lock_callback: svn_fs_lock_callback_t, lock_baton: ?*anyopaque, result_pool: ?*apr_pool_t, scratch_pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    generate_lock_token: ?*const fn (token: [*c][*c]const u8, fs: [*c]svn_fs_t, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    unlock: ?*const fn (fs: [*c]svn_fs_t, targets: ?*apr_hash_t, break_lock: svn_boolean_t, lock_callback: svn_fs_lock_callback_t, lock_baton: ?*anyopaque, result_pool: ?*apr_pool_t, scratch_pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    get_lock: ?*const fn (lock: [*c][*c]svn_lock_t, fs: [*c]svn_fs_t, path: [*c]const u8, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    get_locks: ?*const fn (fs: [*c]svn_fs_t, path: [*c]const u8, depth: svn_depth_t, get_locks_func: svn_fs_get_locks_callback_t, get_locks_baton: ?*anyopaque, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    info_format: ?*const fn (fs_format: [*c]c_int, supports_version: [*c][*c]svn_version_t, fs: [*c]svn_fs_t, result_pool: ?*apr_pool_t, scratch_pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    info_config_files: ?*const fn (files: [*c][*c]apr_array_header_t, fs: [*c]svn_fs_t, result_pool: ?*apr_pool_t, scratch_pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    info_fsap: ?*const fn (fsap_info: [*c]?*const anyopaque, fs: [*c]svn_fs_t, result_pool: ?*apr_pool_t, scratch_pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    verify_root: ?*const fn (root: [*c]svn_fs_root_t, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    freeze: ?*const fn (fs: [*c]svn_fs_t, freeze_func: svn_fs_freeze_func_t, freeze_baton: ?*anyopaque, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    bdb_set_errcall: ?*const fn (fs: [*c]svn_fs_t, handler: ?*const fn (errpfx: [*c]const u8, msg: [*c]u8) callconv(.c) void) callconv(.c) [*c]svn_error_t = null,
    ioctl: ?*const fn (fs: [*c]svn_fs_t, ctlcode: svn_fs_ioctl_code_t, input: ?*anyopaque, output_p: [*c]?*anyopaque, cancel_func: svn_cancel_func_t, cancel_baton: ?*anyopaque, result_pool: ?*apr_pool_t, scratch_pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
};
pub const fs_vtable_t = struct_fs_vtable_t;
pub const struct_svn_fs_t = extern struct {
    pool: ?*apr_pool_t = null,
    path: [*c]u8 = null,
    warning: svn_fs_warning_callback_t = null,
    warning_baton: ?*anyopaque = null,
    config: ?*apr_hash_t = null,
    access_ctx: [*c]svn_fs_access_t = null,
    vtable: [*c]const fs_vtable_t = null,
    fsap_data: ?*anyopaque = null,
    uuid: [*c]const u8 = null,
    pub const svn_fs_set_warning_func = __root.svn_fs_set_warning_func;
    pub const svn_fs_path = __root.svn_fs_path;
    pub const svn_fs_config = __root.svn_fs_config;
    pub const svn_fs_freeze = __root.svn_fs_freeze;
    pub const svn_fs_set_berkeley_errcall = __root.svn_fs_set_berkeley_errcall;
    pub const svn_fs_create_berkeley = __root.svn_fs_create_berkeley;
    pub const svn_fs_open_berkeley = __root.svn_fs_open_berkeley;
    pub const svn_fs_berkeley_path = __root.svn_fs_berkeley_path;
    pub const svn_fs_set_access = __root.svn_fs_set_access;
    pub const svn_fs_purge_txn = __root.svn_fs_purge_txn;
    pub const svn_fs_deltify_revision = __root.svn_fs_deltify_revision;
    pub const svn_fs_refresh_revision_props = __root.svn_fs_refresh_revision_props;
    pub const svn_fs_change_rev_prop2 = __root.svn_fs_change_rev_prop2;
    pub const svn_fs_change_rev_prop = __root.svn_fs_change_rev_prop;
    pub const svn_fs_get_uuid = __root.svn_fs_get_uuid;
    pub const svn_fs_set_uuid = __root.svn_fs_set_uuid;
    pub const svn_fs_lock_many = __root.svn_fs_lock_many;
    pub const svn_fs_unlock_many = __root.svn_fs_unlock_many;
    pub const svn_fs_unlock = __root.svn_fs_unlock;
    pub const svn_fs_get_locks2 = __root.svn_fs_get_locks2;
    pub const svn_fs_get_locks = __root.svn_fs_get_locks;
    pub const svn_fs_ioctl = __root.svn_fs_ioctl;
    pub const svn_fs__check_fs = __root.svn_fs__check_fs;
    pub const func = __root.svn_fs_set_warning_func;
    pub const freeze = __root.svn_fs_freeze;
    pub const errcall = __root.svn_fs_set_berkeley_errcall;
    pub const berkeley = __root.svn_fs_create_berkeley;
    pub const access = __root.svn_fs_set_access;
    pub const txn = __root.svn_fs_purge_txn;
    pub const revision = __root.svn_fs_deltify_revision;
    pub const props = __root.svn_fs_refresh_revision_props;
    pub const prop2 = __root.svn_fs_change_rev_prop2;
    pub const prop = __root.svn_fs_change_rev_prop;
    pub const many = __root.svn_fs_lock_many;
    pub const unlock = __root.svn_fs_unlock;
    pub const locks2 = __root.svn_fs_get_locks2;
    pub const locks = __root.svn_fs_get_locks;
    pub const ioctl = __root.svn_fs_ioctl;
    pub const fs = __root.svn_fs__check_fs;
};
pub extern fn svn_fs_initialize(pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_set_warning_func(fs: [*c]svn_fs_t, warning: svn_fs_warning_callback_t, warning_baton: ?*anyopaque) void;
pub extern fn svn_fs_create2(fs_p: [*c][*c]svn_fs_t, path: [*c]const u8, fs_config: ?*apr_hash_t, result_pool: ?*apr_pool_t, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_create(fs_p: [*c][*c]svn_fs_t, path: [*c]const u8, fs_config: ?*apr_hash_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_open2(fs_p: [*c][*c]svn_fs_t, path: [*c]const u8, fs_config: ?*apr_hash_t, result_pool: ?*apr_pool_t, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_open(fs_p: [*c][*c]svn_fs_t, path: [*c]const u8, fs_config: ?*apr_hash_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub const svn_fs_upgrade_pack_revprops: c_int = 0;
pub const svn_fs_upgrade_cleanup_revprops: c_int = 1;
pub const svn_fs_upgrade_format_bumped: c_int = 2;
pub const enum_svn_fs_upgrade_notify_action_t = c_uint;
pub const svn_fs_upgrade_notify_action_t = enum_svn_fs_upgrade_notify_action_t;
pub const svn_fs_upgrade_notify_t = ?*const fn (baton: ?*anyopaque, number: apr_uint64_t, action: svn_fs_upgrade_notify_action_t, scratch_pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t;
pub extern fn svn_fs_upgrade2(path: [*c]const u8, notify_func: svn_fs_upgrade_notify_t, notify_baton: ?*anyopaque, cancel_func: svn_cancel_func_t, cancel_baton: ?*anyopaque, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_upgrade(path: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub const svn_fs_progress_notify_func_t = ?*const fn (revision: svn_revnum_t, baton: ?*anyopaque, pool: ?*apr_pool_t) callconv(.c) void;
pub extern fn svn_fs_type(fs_type: [*c][*c]const u8, path: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_path(fs: [*c]svn_fs_t, pool: ?*apr_pool_t) [*c]const u8;
pub extern fn svn_fs_config(fs: [*c]svn_fs_t, pool: ?*apr_pool_t) ?*apr_hash_t;
pub extern fn svn_fs_delete_fs(path: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub const svn_fs_hotcopy_notify_t = ?*const fn (baton: ?*anyopaque, start_revision: svn_revnum_t, end_revision: svn_revnum_t, scratch_pool: ?*apr_pool_t) callconv(.c) void;
pub extern fn svn_fs_hotcopy3(src_path: [*c]const u8, dest_path: [*c]const u8, clean: svn_boolean_t, incremental: svn_boolean_t, notify_func: svn_fs_hotcopy_notify_t, notify_baton: ?*anyopaque, cancel_func: svn_cancel_func_t, cancel_baton: ?*anyopaque, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_hotcopy2(src_path: [*c]const u8, dest_path: [*c]const u8, clean: svn_boolean_t, incremental: svn_boolean_t, cancel_func: svn_cancel_func_t, cancel_baton: ?*anyopaque, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_hotcopy(src_path: [*c]const u8, dest_path: [*c]const u8, clean: svn_boolean_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_recover(path: [*c]const u8, cancel_func: svn_cancel_func_t, cancel_baton: ?*anyopaque, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_freeze(fs: [*c]svn_fs_t, freeze_func: svn_fs_freeze_func_t, freeze_baton: ?*anyopaque, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_set_berkeley_errcall(fs: [*c]svn_fs_t, handler: ?*const fn (errpfx: [*c]const u8, msg: [*c]u8) callconv(.c) void) [*c]svn_error_t;
pub extern fn svn_fs_berkeley_logfiles(logfiles: [*c][*c]apr_array_header_t, path: [*c]const u8, only_unused: svn_boolean_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_new(fs_config: ?*apr_hash_t, pool: ?*apr_pool_t) [*c]svn_fs_t;
pub extern fn svn_fs_create_berkeley(fs: [*c]svn_fs_t, path: [*c]const u8) [*c]svn_error_t;
pub extern fn svn_fs_open_berkeley(fs: [*c]svn_fs_t, path: [*c]const u8) [*c]svn_error_t;
pub extern fn svn_fs_berkeley_path(fs: [*c]svn_fs_t, pool: ?*apr_pool_t) [*c]const u8;
pub extern fn svn_fs_delete_berkeley(path: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_hotcopy_berkeley(src_path: [*c]const u8, dest_path: [*c]const u8, clean_logs: svn_boolean_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_berkeley_recover(path: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_create_access(access_ctx: [*c][*c]svn_fs_access_t, username: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_set_access(fs: [*c]svn_fs_t, access_ctx: [*c]svn_fs_access_t) [*c]svn_error_t;
pub extern fn svn_fs_get_access(access_ctx: [*c][*c]svn_fs_access_t, fs: [*c]svn_fs_t) [*c]svn_error_t;
pub extern fn svn_fs_access_get_username(username: [*c][*c]const u8, access_ctx: [*c]svn_fs_access_t) [*c]svn_error_t;
pub extern fn svn_fs_access_add_lock_token2(access_ctx: [*c]svn_fs_access_t, path: [*c]const u8, token: [*c]const u8) [*c]svn_error_t;
pub extern fn svn_fs_access_add_lock_token(access_ctx: [*c]svn_fs_access_t, token: [*c]const u8) [*c]svn_error_t;
pub extern fn svn_fs_compare_ids(a: [*c]const svn_fs_id_t, b: [*c]const svn_fs_id_t) c_int;
pub extern fn svn_fs_check_related(id1: [*c]const svn_fs_id_t, id2: [*c]const svn_fs_id_t) svn_boolean_t;
pub extern fn svn_fs_parse_id(data: [*c]const u8, len: apr_size_t, pool: ?*apr_pool_t) [*c]svn_fs_id_t;
pub extern fn svn_fs_unparse_id(id: [*c]const svn_fs_id_t, pool: ?*apr_pool_t) [*c]svn_string_t;
pub extern fn svn_fs_begin_txn2(txn_p: [*c][*c]svn_fs_txn_t, fs: [*c]svn_fs_t, rev: svn_revnum_t, flags: apr_uint32_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_begin_txn(txn_p: [*c][*c]svn_fs_txn_t, fs: [*c]svn_fs_t, rev: svn_revnum_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_commit_txn(conflict_p: [*c][*c]const u8, new_rev: [*c]svn_revnum_t, txn: [*c]svn_fs_txn_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_abort_txn(txn: [*c]svn_fs_txn_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_purge_txn(fs: [*c]svn_fs_t, txn_id: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_txn_name(name_p: [*c][*c]const u8, txn: [*c]svn_fs_txn_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_txn_base_revision(txn: [*c]svn_fs_txn_t) svn_revnum_t;
pub extern fn svn_fs_open_txn(txn: [*c][*c]svn_fs_txn_t, fs: [*c]svn_fs_t, name: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_list_transactions(names_p: [*c][*c]apr_array_header_t, fs: [*c]svn_fs_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_txn_prop(value_p: [*c][*c]svn_string_t, txn: [*c]svn_fs_txn_t, propname: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_txn_proplist(table_p: [*c]?*apr_hash_t, txn: [*c]svn_fs_txn_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_change_txn_prop(txn: [*c]svn_fs_txn_t, name: [*c]const u8, value: [*c]const svn_string_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_change_txn_props(txn: [*c]svn_fs_txn_t, props: [*c]const apr_array_header_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_revision_root(root_p: [*c][*c]svn_fs_root_t, fs: [*c]svn_fs_t, rev: svn_revnum_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_txn_root(root_p: [*c][*c]svn_fs_root_t, txn: [*c]svn_fs_txn_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_close_root(root: [*c]svn_fs_root_t) void;
pub extern fn svn_fs_root_fs(root: [*c]svn_fs_root_t) [*c]svn_fs_t;
pub extern fn svn_fs_is_txn_root(root: [*c]svn_fs_root_t) svn_boolean_t;
pub extern fn svn_fs_is_revision_root(root: [*c]svn_fs_root_t) svn_boolean_t;
pub extern fn svn_fs_txn_root_name(root: [*c]svn_fs_root_t, pool: ?*apr_pool_t) [*c]const u8;
pub extern fn svn_fs_txn_root_base_revision(root: [*c]svn_fs_root_t) svn_revnum_t;
pub extern fn svn_fs_revision_root_revision(root: [*c]svn_fs_root_t) svn_revnum_t;
pub const struct_svn_fs_path_change2_t = extern struct {
    node_rev_id: [*c]const svn_fs_id_t = null,
    change_kind: svn_fs_path_change_kind_t = @import("std").mem.zeroes(svn_fs_path_change_kind_t),
    text_mod: svn_boolean_t = 0,
    prop_mod: svn_boolean_t = 0,
    node_kind: svn_node_kind_t = @import("std").mem.zeroes(svn_node_kind_t),
    copyfrom_known: svn_boolean_t = 0,
    copyfrom_rev: svn_revnum_t = 0,
    copyfrom_path: [*c]const u8 = null,
    mergeinfo_mod: svn_tristate_t = @import("std").mem.zeroes(svn_tristate_t),
};
pub const svn_fs_path_change2_t = struct_svn_fs_path_change2_t;
pub const struct_svn_fs_path_change_t = extern struct {
    node_rev_id: [*c]const svn_fs_id_t = null,
    change_kind: svn_fs_path_change_kind_t = @import("std").mem.zeroes(svn_fs_path_change_kind_t),
    text_mod: svn_boolean_t = 0,
    prop_mod: svn_boolean_t = 0,
};
pub const svn_fs_path_change_t = struct_svn_fs_path_change_t;
pub extern fn svn_fs_path_change2_create(node_rev_id: [*c]const svn_fs_id_t, change_kind: svn_fs_path_change_kind_t, pool: ?*apr_pool_t) [*c]svn_fs_path_change2_t;
pub extern fn svn_fs_path_change3_create(change_kind: svn_fs_path_change_kind_t, result_pool: ?*apr_pool_t) [*c]svn_fs_path_change3_t;
pub extern fn svn_fs_path_change3_dup(change: [*c]svn_fs_path_change3_t, result_pool: ?*apr_pool_t) [*c]svn_fs_path_change3_t;
pub extern fn svn_fs_path_change_get(change: [*c][*c]svn_fs_path_change3_t, iterator: [*c]svn_fs_path_change_iterator_t) [*c]svn_error_t;
pub extern fn svn_fs_paths_changed3(iterator: [*c][*c]svn_fs_path_change_iterator_t, root: [*c]svn_fs_root_t, result_pool: ?*apr_pool_t, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_paths_changed2(changed_paths2_p: [*c]?*apr_hash_t, root: [*c]svn_fs_root_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_paths_changed(changed_paths_p: [*c]?*apr_hash_t, root: [*c]svn_fs_root_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_check_path(kind_p: [*c]svn_node_kind_t, root: [*c]svn_fs_root_t, path: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_node_history2(history_p: [*c][*c]svn_fs_history_t, root: [*c]svn_fs_root_t, path: [*c]const u8, result_pool: ?*apr_pool_t, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_node_history(history_p: [*c][*c]svn_fs_history_t, root: [*c]svn_fs_root_t, path: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_history_prev2(prev_history_p: [*c][*c]svn_fs_history_t, history: [*c]svn_fs_history_t, cross_copies: svn_boolean_t, result_pool: ?*apr_pool_t, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_history_prev(prev_history_p: [*c][*c]svn_fs_history_t, history: [*c]svn_fs_history_t, cross_copies: svn_boolean_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_history_location(path: [*c][*c]const u8, revision: [*c]svn_revnum_t, history: [*c]svn_fs_history_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_is_dir(is_dir: [*c]svn_boolean_t, root: [*c]svn_fs_root_t, path: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_is_file(is_file: [*c]svn_boolean_t, root: [*c]svn_fs_root_t, path: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_node_id(id_p: [*c][*c]const svn_fs_id_t, root: [*c]svn_fs_root_t, path: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_node_relation(relation: [*c]svn_fs_node_relation_t, root_a: [*c]svn_fs_root_t, path_a: [*c]const u8, root_b: [*c]svn_fs_root_t, path_b: [*c]const u8, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_node_created_rev(revision: [*c]svn_revnum_t, root: [*c]svn_fs_root_t, path: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_node_origin_rev(revision: [*c]svn_revnum_t, root: [*c]svn_fs_root_t, path: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_node_created_path(created_path: [*c][*c]const u8, root: [*c]svn_fs_root_t, path: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_node_prop(value_p: [*c][*c]svn_string_t, root: [*c]svn_fs_root_t, path: [*c]const u8, propname: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_node_proplist(table_p: [*c]?*apr_hash_t, root: [*c]svn_fs_root_t, path: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_node_has_props(has_props: [*c]svn_boolean_t, root: [*c]svn_fs_root_t, path: [*c]const u8, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_change_node_prop(root: [*c]svn_fs_root_t, path: [*c]const u8, name: [*c]const u8, value: [*c]const svn_string_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_props_different(different_p: [*c]svn_boolean_t, root1: [*c]svn_fs_root_t, path1: [*c]const u8, root2: [*c]svn_fs_root_t, path2: [*c]const u8, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_props_changed(changed_p: [*c]svn_boolean_t, root1: [*c]svn_fs_root_t, path1: [*c]const u8, root2: [*c]svn_fs_root_t, path2: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_copied_from(rev_p: [*c]svn_revnum_t, path_p: [*c][*c]const u8, root: [*c]svn_fs_root_t, path: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_closest_copy(root_p: [*c][*c]svn_fs_root_t, path_p: [*c][*c]const u8, root: [*c]svn_fs_root_t, path: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_get_mergeinfo3(root: [*c]svn_fs_root_t, paths: [*c]const apr_array_header_t, inherit: svn_mergeinfo_inheritance_t, include_descendants: svn_boolean_t, adjust_inherited_mergeinfo: svn_boolean_t, receiver: svn_fs_mergeinfo_receiver_t, baton: ?*anyopaque, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_get_mergeinfo2(catalog: [*c]svn_mergeinfo_catalog_t, root: [*c]svn_fs_root_t, paths: [*c]const apr_array_header_t, inherit: svn_mergeinfo_inheritance_t, include_descendants: svn_boolean_t, adjust_inherited_mergeinfo: svn_boolean_t, result_pool: ?*apr_pool_t, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_get_mergeinfo(catalog: [*c]svn_mergeinfo_catalog_t, root: [*c]svn_fs_root_t, paths: [*c]const apr_array_header_t, inherit: svn_mergeinfo_inheritance_t, include_descendants: svn_boolean_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_merge(conflict_p: [*c][*c]const u8, source_root: [*c]svn_fs_root_t, source_path: [*c]const u8, target_root: [*c]svn_fs_root_t, target_path: [*c]const u8, ancestor_root: [*c]svn_fs_root_t, ancestor_path: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub const struct_svn_fs_dirent_t = extern struct {
    name: [*c]const u8 = null,
    id: [*c]const svn_fs_id_t = null,
    kind: svn_node_kind_t = @import("std").mem.zeroes(svn_node_kind_t),
};
pub const svn_fs_dirent_t = struct_svn_fs_dirent_t;
pub extern fn svn_fs_dir_entries(entries_p: [*c]?*apr_hash_t, root: [*c]svn_fs_root_t, path: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_dir_optimal_order(ordered_p: [*c][*c]apr_array_header_t, root: [*c]svn_fs_root_t, entries: ?*apr_hash_t, result_pool: ?*apr_pool_t, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_make_dir(root: [*c]svn_fs_root_t, path: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_delete(root: [*c]svn_fs_root_t, path: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_copy(from_root: [*c]svn_fs_root_t, from_path: [*c]const u8, to_root: [*c]svn_fs_root_t, to_path: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_revision_link(from_root: [*c]svn_fs_root_t, to_root: [*c]svn_fs_root_t, path: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_file_length(length_p: [*c]svn_filesize_t, root: [*c]svn_fs_root_t, path: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_file_checksum(checksum: [*c][*c]svn_checksum_t, kind: svn_checksum_kind_t, root: [*c]svn_fs_root_t, path: [*c]const u8, force: svn_boolean_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_file_md5_checksum(digest: [*c]u8, root: [*c]svn_fs_root_t, path: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_file_contents(contents: [*c]?*svn_stream_t, root: [*c]svn_fs_root_t, path: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_try_process_file_contents(success: [*c]svn_boolean_t, root: [*c]svn_fs_root_t, path: [*c]const u8, processor: svn_fs_process_contents_func_t, baton: ?*anyopaque, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_make_file(root: [*c]svn_fs_root_t, path: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_apply_textdelta(contents_p: [*c]svn_txdelta_window_handler_t, contents_baton_p: [*c]?*anyopaque, root: [*c]svn_fs_root_t, path: [*c]const u8, base_checksum: [*c]const u8, result_checksum: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_apply_text(contents_p: [*c]?*svn_stream_t, root: [*c]svn_fs_root_t, path: [*c]const u8, result_checksum: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_contents_different(different_p: [*c]svn_boolean_t, root1: [*c]svn_fs_root_t, path1: [*c]const u8, root2: [*c]svn_fs_root_t, path2: [*c]const u8, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_contents_changed(changed_p: [*c]svn_boolean_t, root1: [*c]svn_fs_root_t, path1: [*c]const u8, root2: [*c]svn_fs_root_t, path2: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_youngest_rev(youngest_p: [*c]svn_revnum_t, fs: [*c]svn_fs_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_info_format(fs_format: [*c]c_int, supports_version: [*c][*c]svn_version_t, fs: [*c]svn_fs_t, result_pool: ?*apr_pool_t, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_info_config_files(files: [*c][*c]apr_array_header_t, fs: [*c]svn_fs_t, result_pool: ?*apr_pool_t, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_deltify_revision(fs: [*c]svn_fs_t, revision: svn_revnum_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_refresh_revision_props(fs: [*c]svn_fs_t, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_revision_prop2(value_p: [*c][*c]svn_string_t, fs: [*c]svn_fs_t, rev: svn_revnum_t, propname: [*c]const u8, refresh: svn_boolean_t, result_pool: ?*apr_pool_t, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_revision_prop(value_p: [*c][*c]svn_string_t, fs: [*c]svn_fs_t, rev: svn_revnum_t, propname: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_revision_proplist2(table_p: [*c]?*apr_hash_t, fs: [*c]svn_fs_t, rev: svn_revnum_t, refresh: svn_boolean_t, result_pool: ?*apr_pool_t, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_revision_proplist(table_p: [*c]?*apr_hash_t, fs: [*c]svn_fs_t, rev: svn_revnum_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_change_rev_prop2(fs: [*c]svn_fs_t, rev: svn_revnum_t, name: [*c]const u8, old_value_p: [*c]const [*c]const svn_string_t, value: [*c]const svn_string_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_change_rev_prop(fs: [*c]svn_fs_t, rev: svn_revnum_t, name: [*c]const u8, value: [*c]const svn_string_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_get_file_delta_stream(stream_p: [*c]?*svn_txdelta_stream_t, source_root: [*c]svn_fs_root_t, source_path: [*c]const u8, target_root: [*c]svn_fs_root_t, target_path: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_get_uuid(fs: [*c]svn_fs_t, uuid: [*c][*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_set_uuid(fs: [*c]svn_fs_t, uuid: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub const struct_svn_fs_lock_target_t = extern struct {
    token: [*c]const u8 = null,
    current_rev: svn_revnum_t = 0,
    pub const svn_fs_lock_target_set_token = __root.svn_fs_lock_target_set_token;
};
pub const svn_fs_lock_target_t = struct_svn_fs_lock_target_t;
pub extern fn svn_fs_lock_target_create(token: [*c]const u8, current_rev: svn_revnum_t, result_pool: ?*apr_pool_t) [*c]svn_fs_lock_target_t;
pub extern fn svn_fs_lock_target_set_token(target: [*c]svn_fs_lock_target_t, token: [*c]const u8) void;
pub extern fn svn_fs_lock_many(fs: [*c]svn_fs_t, lock_targets: ?*apr_hash_t, comment: [*c]const u8, is_dav_comment: svn_boolean_t, expiration_date: apr_time_t, steal_lock: svn_boolean_t, lock_callback: svn_fs_lock_callback_t, lock_baton: ?*anyopaque, result_pool: ?*apr_pool_t, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_lock(lock: [*c][*c]svn_lock_t, fs: [*c]svn_fs_t, path: [*c]const u8, token: [*c]const u8, comment: [*c]const u8, is_dav_comment: svn_boolean_t, expiration_date: apr_time_t, current_rev: svn_revnum_t, steal_lock: svn_boolean_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_generate_lock_token(token: [*c][*c]const u8, fs: [*c]svn_fs_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_unlock_many(fs: [*c]svn_fs_t, unlock_targets: ?*apr_hash_t, break_lock: svn_boolean_t, lock_callback: svn_fs_lock_callback_t, lock_baton: ?*anyopaque, result_pool: ?*apr_pool_t, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_unlock(fs: [*c]svn_fs_t, path: [*c]const u8, token: [*c]const u8, break_lock: svn_boolean_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_get_lock(lock: [*c][*c]svn_lock_t, fs: [*c]svn_fs_t, path: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_get_locks2(fs: [*c]svn_fs_t, path: [*c]const u8, depth: svn_depth_t, get_locks_func: svn_fs_get_locks_callback_t, get_locks_baton: ?*anyopaque, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_get_locks(fs: [*c]svn_fs_t, path: [*c]const u8, get_locks_func: svn_fs_get_locks_callback_t, get_locks_baton: ?*anyopaque, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_print_modules(output: [*c]svn_stringbuf_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub const svn_fs_pack_notify_start: c_int = 0;
pub const svn_fs_pack_notify_end: c_int = 1;
pub const svn_fs_pack_notify_start_revprop: c_int = 2;
pub const svn_fs_pack_notify_end_revprop: c_int = 3;
pub const svn_fs_pack_notify_noop: c_int = 4;
pub const enum_svn_fs_pack_notify_action_t = c_uint;
pub const svn_fs_pack_notify_action_t = enum_svn_fs_pack_notify_action_t;
pub const svn_fs_pack_notify_t = ?*const fn (baton: ?*anyopaque, shard: apr_int64_t, action: svn_fs_pack_notify_action_t, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t;
pub extern fn svn_fs_pack(db_path: [*c]const u8, notify_func: svn_fs_pack_notify_t, notify_baton: ?*anyopaque, cancel_func: svn_cancel_func_t, cancel_baton: ?*anyopaque, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_verify(path: [*c]const u8, fs_config: ?*apr_hash_t, start: svn_revnum_t, end: svn_revnum_t, notify_func: svn_fs_progress_notify_func_t, notify_baton: ?*anyopaque, cancel_func: svn_cancel_func_t, cancel_baton: ?*anyopaque, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_verify_root(root: [*c]svn_fs_root_t, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub const struct_svn_fs_fsfs_info_t = extern struct {
    fs_type: [*c]const u8 = null,
    shard_size: c_int = 0,
    min_unpacked_rev: svn_revnum_t = 0,
    log_addressing: svn_boolean_t = 0,
};
pub const svn_fs_fsfs_info_t = struct_svn_fs_fsfs_info_t;
pub const struct_svn_fs_fsx_info_t = extern struct {
    fs_type: [*c]const u8 = null,
    shard_size: c_int = 0,
    min_unpacked_rev: svn_revnum_t = 0,
};
pub const svn_fs_fsx_info_t = struct_svn_fs_fsx_info_t;
pub const struct_svn_fs_info_placeholder_t = extern struct {
    fs_type: [*c]const u8 = null,
};
pub const svn_fs_info_placeholder_t = struct_svn_fs_info_placeholder_t;
pub extern fn svn_fs_info(fs_info: [*c][*c]const svn_fs_info_placeholder_t, fs: [*c]svn_fs_t, result_pool: ?*apr_pool_t, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs_info_dup(info: ?*const anyopaque, result_pool: ?*apr_pool_t, scratch_pool: ?*apr_pool_t) ?*anyopaque;
pub extern fn svn_fs_ioctl(fs: [*c]svn_fs_t, ctlcode: svn_fs_ioctl_code_t, input: ?*anyopaque, output_p: [*c]?*anyopaque, cancel_func: svn_cancel_func_t, cancel_baton: ?*anyopaque, result_pool: ?*apr_pool_t, scratch_pool: ?*apr_pool_t) [*c]svn_error_t;
pub const struct_apr_xlate_t = opaque {
    pub const apr_xlate_sb_get = __root.apr_xlate_sb_get;
    pub const apr_xlate_conv_buffer = __root.apr_xlate_conv_buffer;
    pub const apr_xlate_conv_byte = __root.apr_xlate_conv_byte;
    pub const apr_xlate_close = __root.apr_xlate_close;
    pub const get = __root.apr_xlate_sb_get;
    pub const buffer = __root.apr_xlate_conv_buffer;
    pub const byte = __root.apr_xlate_conv_byte;
    pub const close = __root.apr_xlate_close;
};
pub const apr_xlate_t = struct_apr_xlate_t;
pub extern fn apr_xlate_open(convset: [*c]?*apr_xlate_t, topage: [*c]const u8, frompage: [*c]const u8, pool: ?*apr_pool_t) apr_status_t;
pub extern fn apr_xlate_sb_get(convset: ?*apr_xlate_t, onoff: [*c]c_int) apr_status_t;
pub extern fn apr_xlate_conv_buffer(convset: ?*apr_xlate_t, inbuf: [*c]const u8, inbytes_left: [*c]apr_size_t, outbuf: [*c]u8, outbytes_left: [*c]apr_size_t) apr_status_t;
pub extern fn apr_xlate_conv_byte(convset: ?*apr_xlate_t, inchar: u8) apr_int32_t;
pub extern fn apr_xlate_close(convset: ?*apr_xlate_t) apr_status_t;
pub extern fn svn_utf_initialize2(assume_native_utf8: svn_boolean_t, pool: ?*apr_pool_t) void;
pub extern fn svn_utf_initialize(pool: ?*apr_pool_t) void;
pub extern fn svn_utf_stringbuf_to_utf8(dest: [*c][*c]svn_stringbuf_t, src: [*c]const svn_stringbuf_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_utf_string_to_utf8(dest: [*c][*c]const svn_string_t, src: [*c]const svn_string_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_utf_cstring_to_utf8(dest: [*c][*c]const u8, src: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_utf_cstring_to_utf8_ex2(dest: [*c][*c]const u8, src: [*c]const u8, frompage: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_utf_cstring_to_utf8_ex(dest: [*c][*c]const u8, src: [*c]const u8, frompage: [*c]const u8, convset_key: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_utf_stringbuf_from_utf8(dest: [*c][*c]svn_stringbuf_t, src: [*c]const svn_stringbuf_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_utf_string_from_utf8(dest: [*c][*c]const svn_string_t, src: [*c]const svn_string_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_utf_cstring_from_utf8(dest: [*c][*c]const u8, src: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_utf_cstring_from_utf8_ex2(dest: [*c][*c]const u8, src: [*c]const u8, topage: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_utf_cstring_from_utf8_ex(dest: [*c][*c]const u8, src: [*c]const u8, topage: [*c]const u8, convset_key: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_utf_cstring_from_utf8_fuzzy(src: [*c]const u8, pool: ?*apr_pool_t) [*c]const u8;
pub extern fn svn_utf_cstring_from_utf8_stringbuf(dest: [*c][*c]const u8, src: [*c]const svn_stringbuf_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_utf_cstring_from_utf8_string(dest: [*c][*c]const u8, src: [*c]const svn_string_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_utf_cstring_utf8_width(cstr: [*c]const u8) c_int;
pub extern fn svn_ver_compatible(my_version: [*c]const svn_version_t, lib_version: [*c]const svn_version_t) svn_boolean_t;
pub extern fn svn_ver_equal(my_version: [*c]const svn_version_t, lib_version: [*c]const svn_version_t) svn_boolean_t;
pub const struct_svn_version_checklist_t = extern struct {
    label: [*c]const u8 = null,
    version_query: ?*const fn () callconv(.c) [*c]const svn_version_t = null,
};
pub const svn_version_checklist_t = struct_svn_version_checklist_t;
pub extern fn svn_ver_check_list2(my_version: [*c]const svn_version_t, checklist: [*c]const svn_version_checklist_t, comparator: ?*const fn ([*c]const svn_version_t, [*c]const svn_version_t) callconv(.c) svn_boolean_t) [*c]svn_error_t;
pub extern fn svn_ver_check_list(my_version: [*c]const svn_version_t, checklist: [*c]const svn_version_checklist_t) [*c]svn_error_t;
pub const svn_version_func_t = ?*const fn () callconv(.c) [*c]const svn_version_t;
pub extern fn svn_subr_version() [*c]const svn_version_t;
pub const struct_svn_version_extended_t = opaque {
    pub const svn_version_ext_build_date = __root.svn_version_ext_build_date;
    pub const svn_version_ext_build_time = __root.svn_version_ext_build_time;
    pub const svn_version_ext_build_host = __root.svn_version_ext_build_host;
    pub const svn_version_ext_copyright = __root.svn_version_ext_copyright;
    pub const svn_version_ext_runtime_host = __root.svn_version_ext_runtime_host;
    pub const svn_version_ext_runtime_osname = __root.svn_version_ext_runtime_osname;
    pub const svn_version_ext_character_encoding = __root.svn_version_ext_character_encoding;
    pub const svn_version_ext_linked_libs = __root.svn_version_ext_linked_libs;
    pub const svn_version_ext_loaded_libs = __root.svn_version_ext_loaded_libs;
    pub const date = __root.svn_version_ext_build_date;
    pub const time = __root.svn_version_ext_build_time;
    pub const host = __root.svn_version_ext_build_host;
    pub const copyright = __root.svn_version_ext_copyright;
    pub const osname = __root.svn_version_ext_runtime_osname;
    pub const encoding = __root.svn_version_ext_character_encoding;
    pub const libs = __root.svn_version_ext_linked_libs;
};
pub const svn_version_extended_t = struct_svn_version_extended_t;
pub extern fn svn_version_extended(verbose: svn_boolean_t, pool: ?*apr_pool_t) ?*const svn_version_extended_t;
pub extern fn svn_version_ext_build_date(ext_info: ?*const svn_version_extended_t) [*c]const u8;
pub extern fn svn_version_ext_build_time(ext_info: ?*const svn_version_extended_t) [*c]const u8;
pub extern fn svn_version_ext_build_host(ext_info: ?*const svn_version_extended_t) [*c]const u8;
pub extern fn svn_version_ext_copyright(ext_info: ?*const svn_version_extended_t) [*c]const u8;
pub extern fn svn_version_ext_runtime_host(ext_info: ?*const svn_version_extended_t) [*c]const u8;
pub extern fn svn_version_ext_runtime_osname(ext_info: ?*const svn_version_extended_t) [*c]const u8;
pub extern fn svn_version_ext_character_encoding(ext_info: ?*const svn_version_extended_t) [*c]const u8;
pub const struct_svn_version_ext_linked_lib_t = extern struct {
    name: [*c]const u8 = null,
    compiled_version: [*c]const u8 = null,
    runtime_version: [*c]const u8 = null,
};
pub const svn_version_ext_linked_lib_t = struct_svn_version_ext_linked_lib_t;
pub extern fn svn_version_ext_linked_libs(ext_info: ?*const svn_version_extended_t) [*c]const apr_array_header_t;
pub const struct_svn_version_ext_loaded_lib_t = extern struct {
    name: [*c]const u8 = null,
    version: [*c]const u8 = null,
};
pub const svn_version_ext_loaded_lib_t = struct_svn_version_ext_loaded_lib_t;
pub extern fn svn_version_ext_loaded_libs(ext_info: ?*const svn_version_extended_t) [*c]const apr_array_header_t;
pub extern fn svn_fs_util__version() [*c]const svn_version_t;
pub extern fn svn_fs__is_canonical_abspath(path: [*c]const u8) svn_boolean_t;
pub extern fn svn_fs__canonicalize_abspath(path: [*c]const u8, pool: ?*apr_pool_t) [*c]const u8;
pub extern fn svn_fs__check_fs(fs: [*c]svn_fs_t, expect_open: svn_boolean_t) [*c]svn_error_t;
pub extern fn svn_fs__next_entry_name(next_p: [*c][*c]const u8, path: [*c]const u8, pool: ?*apr_pool_t) [*c]u8;
pub extern fn svn_fs__path_change_create_internal(node_rev_id: [*c]const svn_fs_id_t, change_kind: svn_fs_path_change_kind_t, pool: ?*apr_pool_t) [*c]svn_fs_path_change2_t;
pub extern fn svn_fs__path_change_create_internal2(change_kind: svn_fs_path_change_kind_t, result_pool: ?*apr_pool_t) [*c]svn_fs_path_change3_t;
pub extern fn svn_fs__append_to_merged_froms(output: [*c]svn_mergeinfo_t, input: svn_mergeinfo_t, rel_path: [*c]const u8, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs__compatible_version(compatible_version: [*c][*c]svn_version_t, config: ?*apr_hash_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_fs__prop_lists_equal(a: ?*apr_hash_t, b: ?*apr_hash_t, pool: ?*apr_pool_t) svn_boolean_t;
pub const struct_svn_prop_t = extern struct {
    name: [*c]const u8 = null,
    value: [*c]const svn_string_t = null,
    pub const svn_prop_dup = __root.svn_prop_dup;
    pub const dup = __root.svn_prop_dup;
};
pub const svn_prop_t = struct_svn_prop_t;
pub extern fn svn_prop_dup(prop: [*c]const svn_prop_t, pool: ?*apr_pool_t) [*c]svn_prop_t;
pub extern fn svn_prop_array_dup(array: [*c]const apr_array_header_t, pool: ?*apr_pool_t) [*c]apr_array_header_t;
pub const struct_svn_prop_inherited_item_t = extern struct {
    path_or_url: [*c]const u8 = null,
    prop_hash: ?*apr_hash_t = null,
};
pub const svn_prop_inherited_item_t = struct_svn_prop_inherited_item_t;
pub extern fn svn_prop_hash_to_array(hash: ?*const apr_hash_t, pool: ?*apr_pool_t) [*c]apr_array_header_t;
pub extern fn svn_prop_array_to_hash(properties: [*c]const apr_array_header_t, result: ?*apr_pool_t) ?*apr_hash_t;
pub extern fn svn_prop_hash_dup(hash: ?*const apr_hash_t, pool: ?*apr_pool_t) ?*apr_hash_t;
pub extern fn svn_prop_get_value(properties: ?*const apr_hash_t, prop_name: [*c]const u8) [*c]const u8;
pub const svn_prop_entry_kind: c_int = 0;
pub const svn_prop_wc_kind: c_int = 1;
pub const svn_prop_regular_kind: c_int = 2;
pub const enum_svn_prop_kind = c_uint;
pub const svn_prop_kind_t = enum_svn_prop_kind;
pub extern fn svn_property_kind2(prop_name: [*c]const u8) svn_prop_kind_t;
pub extern fn svn_property_kind(prefix_len: [*c]c_int, prop_name: [*c]const u8) svn_prop_kind_t;
pub extern fn svn_prop_is_svn_prop(prop_name: [*c]const u8) svn_boolean_t;
pub extern fn svn_prop_has_svn_prop(props: ?*const apr_hash_t, pool: ?*apr_pool_t) svn_boolean_t;
pub extern fn svn_prop_is_boolean(prop_name: [*c]const u8) svn_boolean_t;
pub extern fn svn_prop_is_known_svn_rev_prop(prop_name: [*c]const u8) svn_boolean_t;
pub extern fn svn_prop_is_known_svn_node_prop(prop_name: [*c]const u8) svn_boolean_t;
pub extern fn svn_prop_is_known_svn_file_prop(prop_name: [*c]const u8) svn_boolean_t;
pub extern fn svn_prop_is_known_svn_dir_prop(prop_name: [*c]const u8) svn_boolean_t;
pub extern fn svn_prop_needs_translation(prop_name: [*c]const u8) svn_boolean_t;
pub extern fn svn_categorize_props(proplist: [*c]const apr_array_header_t, entry_props: [*c][*c]apr_array_header_t, wc_props: [*c][*c]apr_array_header_t, regular_props: [*c][*c]apr_array_header_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_prop_diffs(propdiffs: [*c][*c]apr_array_header_t, target_props: ?*const apr_hash_t, source_props: ?*const apr_hash_t, pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_prop_name_is_valid(prop_name: [*c]const u8) svn_boolean_t;
pub const struct_svn_mutex__t = opaque {
    pub const svn_mutex__lock = __root.svn_mutex__lock;
    pub const svn_mutex__unlock = __root.svn_mutex__unlock;
    pub const svn_mutex__get = __root.svn_mutex__get;
    pub const lock = __root.svn_mutex__lock;
    pub const unlock = __root.svn_mutex__unlock;
    pub const get = __root.svn_mutex__get;
};
pub const svn_mutex__t = struct_svn_mutex__t;
pub extern fn svn_mutex__init(mutex: [*c]?*svn_mutex__t, mutex_required: svn_boolean_t, result_pool: ?*apr_pool_t) [*c]svn_error_t;
pub extern fn svn_mutex__lock(mutex: ?*svn_mutex__t) [*c]svn_error_t;
pub extern fn svn_mutex__unlock(mutex: ?*svn_mutex__t, err: [*c]svn_error_t) [*c]svn_error_t;
pub extern fn svn_mutex__get(mutex: ?*svn_mutex__t) ?*apr_thread_mutex_t;
pub const struct_fs_library_vtable_t = extern struct {
    get_version: ?*const fn () callconv(.c) [*c]const svn_version_t = null,
    create: ?*const fn (fs: [*c]svn_fs_t, path: [*c]const u8, common_pool_lock: ?*svn_mutex__t, scratch_pool: ?*apr_pool_t, common_pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    open_fs: ?*const fn (fs: [*c]svn_fs_t, path: [*c]const u8, common_pool_lock: ?*svn_mutex__t, scratch_pool: ?*apr_pool_t, common_pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    open_fs_for_recovery: ?*const fn (fs: [*c]svn_fs_t, path: [*c]const u8, common_pool_lock: ?*svn_mutex__t, pool: ?*apr_pool_t, common_pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    upgrade_fs: ?*const fn (fs: [*c]svn_fs_t, path: [*c]const u8, notify_func: svn_fs_upgrade_notify_t, notify_baton: ?*anyopaque, cancel_func: svn_cancel_func_t, cancel_baton: ?*anyopaque, common_pool_lock: ?*svn_mutex__t, scratch_pool: ?*apr_pool_t, common_pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    verify_fs: ?*const fn (fs: [*c]svn_fs_t, path: [*c]const u8, start: svn_revnum_t, end: svn_revnum_t, notify_func: svn_fs_progress_notify_func_t, notify_baton: ?*anyopaque, cancel_func: svn_cancel_func_t, cancel_baton: ?*anyopaque, common_pool_lock: ?*svn_mutex__t, pool: ?*apr_pool_t, common_pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    delete_fs: ?*const fn (path: [*c]const u8, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    hotcopy: ?*const fn (src_fs: [*c]svn_fs_t, dst_fs: [*c]svn_fs_t, src_path: [*c]const u8, dst_path: [*c]const u8, clean: svn_boolean_t, incremental: svn_boolean_t, notify_func: svn_fs_hotcopy_notify_t, notify_baton: ?*anyopaque, cancel_func: svn_cancel_func_t, cancel_baton: ?*anyopaque, common_pool_lock: ?*svn_mutex__t, pool: ?*apr_pool_t, common_pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    get_description: ?*const fn () callconv(.c) [*c]const u8 = null,
    recover: ?*const fn (fs: [*c]svn_fs_t, cancel_func: svn_cancel_func_t, cancel_baton: ?*anyopaque, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    pack_fs: ?*const fn (fs: [*c]svn_fs_t, path: [*c]const u8, notify_func: svn_fs_pack_notify_t, notify_baton: ?*anyopaque, cancel_func: svn_cancel_func_t, cancel_baton: ?*anyopaque, common_pool_lock: ?*svn_mutex__t, pool: ?*apr_pool_t, common_pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    bdb_logfiles: ?*const fn (logfiles: [*c][*c]apr_array_header_t, path: [*c]const u8, only_unused: svn_boolean_t, pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
    parse_id: ?*const fn (data: [*c]const u8, len: apr_size_t, pool: ?*apr_pool_t) callconv(.c) [*c]svn_fs_id_t = null,
    set_svn_fs_open: ?*const fn (fs: [*c]svn_fs_t, svn_fs_open_: ?*const fn ([*c][*c]svn_fs_t, [*c]const u8, ?*apr_hash_t, ?*apr_pool_t, ?*apr_pool_t) callconv(.c) [*c]svn_error_t) callconv(.c) [*c]svn_error_t = null,
    info_fsap_dup: ?*const fn (fsap_info: ?*const anyopaque, result_pool: ?*apr_pool_t) callconv(.c) ?*anyopaque = null,
    ioctl: ?*const fn (ctlcode: svn_fs_ioctl_code_t, input: ?*anyopaque, output_p: [*c]?*anyopaque, cancel_func: svn_cancel_func_t, cancel_baton: ?*anyopaque, result_pool: ?*apr_pool_t, scratch_pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t = null,
};
pub const fs_library_vtable_t = struct_fs_library_vtable_t;
pub const fs_init_func_t = ?*const fn (loader_version: [*c]const svn_version_t, vtable: [*c][*c]fs_library_vtable_t, common_pool: ?*apr_pool_t) callconv(.c) [*c]svn_error_t;

pub const __VERSION__ = "Aro aro-zig";
pub const __Aro__ = "";
pub const __STDC__ = @as(c_int, 1);
pub const __STDC_HOSTED__ = @as(c_int, 1);
pub const __STDC_UTF_16__ = @as(c_int, 1);
pub const __STDC_UTF_32__ = @as(c_int, 1);
pub const __STDC_EMBED_NOT_FOUND__ = @as(c_int, 0);
pub const __STDC_EMBED_FOUND__ = @as(c_int, 1);
pub const __STDC_EMBED_EMPTY__ = @as(c_int, 2);
pub const __STDC_VERSION__ = @as(c_long, 201710);
pub const __GNUC__ = @as(c_int, 7);
pub const __GNUC_MINOR__ = @as(c_int, 1);
pub const __GNUC_PATCHLEVEL__ = @as(c_int, 0);
pub const __ARO_EMULATE_NO__ = @as(c_int, 0);
pub const __ARO_EMULATE_CLANG__ = @as(c_int, 1);
pub const __ARO_EMULATE_GCC__ = @as(c_int, 2);
pub const __ARO_EMULATE_MSVC__ = @as(c_int, 3);
pub const __ARO_EMULATE__ = __ARO_EMULATE_GCC__;
pub inline fn __building_module(x: anytype) @TypeOf(@as(c_int, 0)) {
    _ = &x;
    return @as(c_int, 0);
}
pub const linux = @as(c_int, 1);
pub const __linux = @as(c_int, 1);
pub const __linux__ = @as(c_int, 1);
pub const unix = @as(c_int, 1);
pub const __unix = @as(c_int, 1);
pub const __unix__ = @as(c_int, 1);
pub const __code_model_small__ = @as(c_int, 1);
pub const __amd64__ = @as(c_int, 1);
pub const __amd64 = @as(c_int, 1);
pub const __x86_64__ = @as(c_int, 1);
pub const __x86_64 = @as(c_int, 1);
pub const __SEG_GS = @as(c_int, 1);
pub const __SEG_FS = @as(c_int, 1);
pub const __seg_gs = @compileError("unable to translate macro: undefined identifier `address_space`");
// <builtin>:33:9
pub const __seg_fs = @compileError("unable to translate macro: undefined identifier `address_space`");
// <builtin>:34:9
pub const __LAHF_SAHF__ = @as(c_int, 1);
pub const __AES__ = @as(c_int, 1);
pub const __VAES__ = @as(c_int, 1);
pub const __PCLMUL__ = @as(c_int, 1);
pub const __VPCLMULQDQ__ = @as(c_int, 1);
pub const __LZCNT__ = @as(c_int, 1);
pub const __RDRND__ = @as(c_int, 1);
pub const __FSGSBASE__ = @as(c_int, 1);
pub const __BMI__ = @as(c_int, 1);
pub const __BMI2__ = @as(c_int, 1);
pub const __POPCNT__ = @as(c_int, 1);
pub const __PRFCHW__ = @as(c_int, 1);
pub const __RDSEED__ = @as(c_int, 1);
pub const __ADX__ = @as(c_int, 1);
pub const __MOVBE__ = @as(c_int, 1);
pub const __FMA__ = @as(c_int, 1);
pub const __F16C__ = @as(c_int, 1);
pub const __GFNI__ = @as(c_int, 1);
pub const __AVX512CD__ = @as(c_int, 1);
pub const __AVX512VPOPCNTDQ__ = @as(c_int, 1);
pub const __AVX512VNNI__ = @as(c_int, 1);
pub const __AVX512BF16__ = @as(c_int, 1);
pub const __AVX512FP16__ = @as(c_int, 1);
pub const __AVX512DQ__ = @as(c_int, 1);
pub const __AVX512BITALG__ = @as(c_int, 1);
pub const __AVX512BW__ = @as(c_int, 1);
pub const __AVX512VL__ = @as(c_int, 1);
pub const __EVEX256__ = @as(c_int, 1);
pub const __AVX512VBMI__ = @as(c_int, 1);
pub const __AVX512VBMI2__ = @as(c_int, 1);
pub const __AVX512IFMA__ = @as(c_int, 1);
pub const __SHA__ = @as(c_int, 1);
pub const __FXSR__ = @as(c_int, 1);
pub const __XSAVE__ = @as(c_int, 1);
pub const __XSAVEOPT__ = @as(c_int, 1);
pub const __XSAVEC__ = @as(c_int, 1);
pub const __XSAVES__ = @as(c_int, 1);
pub const __PKU__ = @as(c_int, 1);
pub const __CLFLUSHOPT__ = @as(c_int, 1);
pub const __CLWB__ = @as(c_int, 1);
pub const __WBNOINVD__ = @as(c_int, 1);
pub const __RDPID__ = @as(c_int, 1);
pub const __CLDEMOTE__ = @as(c_int, 1);
pub const __WAITPKG__ = @as(c_int, 1);
pub const __MOVDIRI__ = @as(c_int, 1);
pub const __MOVDIR64B__ = @as(c_int, 1);
pub const __INVPCID__ = @as(c_int, 1);
pub const __AVXVNNI__ = @as(c_int, 1);
pub const __SERIALIZE__ = @as(c_int, 1);
pub const __TSXLDTRK__ = @as(c_int, 1);
pub const __CRC32__ = @as(c_int, 1);
pub const __AVX512F__ = @as(c_int, 1);
pub const __AVX2__ = @as(c_int, 1);
pub const __AVX__ = @as(c_int, 1);
pub const __SSE4_2__ = @as(c_int, 1);
pub const __SSE4_1__ = @as(c_int, 1);
pub const __SSSE3__ = @as(c_int, 1);
pub const __SSE3__ = @as(c_int, 1);
pub const __SSE2__ = @as(c_int, 1);
pub const __SSE__ = @as(c_int, 1);
pub const __SSE_MATH__ = @as(c_int, 1);
pub const __MMX__ = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 = @as(c_int, 1);
pub const __SIZEOF_FLOAT128__ = @as(c_int, 16);
pub const _LP64 = @as(c_int, 1);
pub const __LP64__ = @as(c_int, 1);
pub const __FLOAT128__ = @as(c_int, 1);
pub const __ORDER_LITTLE_ENDIAN__ = @as(c_int, 1234);
pub const __ORDER_BIG_ENDIAN__ = @as(c_int, 4321);
pub const __ORDER_PDP_ENDIAN__ = @as(c_int, 3412);
pub const __BYTE_ORDER__ = __ORDER_LITTLE_ENDIAN__;
pub const __LITTLE_ENDIAN__ = @as(c_int, 1);
pub const __ELF__ = @as(c_int, 1);
pub const __ATOMIC_RELAXED = @as(c_int, 0);
pub const __ATOMIC_CONSUME = @as(c_int, 1);
pub const __ATOMIC_ACQUIRE = @as(c_int, 2);
pub const __ATOMIC_RELEASE = @as(c_int, 3);
pub const __ATOMIC_ACQ_REL = @as(c_int, 4);
pub const __ATOMIC_SEQ_CST = @as(c_int, 5);
pub const __ATOMIC_BOOL_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_CHAR_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_CHAR16_T_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_CHAR32_T_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_WCHAR_T_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_WINT_T_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_SHORT_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_INT_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_LONG_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_LLONG_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_POINTER_LOCK_FREE = @as(c_int, 1);
pub const __WINT_UNSIGNED__ = @as(c_int, 1);
pub const __CHAR_BIT__ = @as(c_int, 8);
pub const __BOOL_WIDTH__ = @as(c_int, 8);
pub const __SCHAR_MAX__ = @as(c_int, 127);
pub const __SCHAR_WIDTH__ = @as(c_int, 8);
pub const __SHRT_MAX__ = @as(c_int, 32767);
pub const __SHRT_WIDTH__ = @as(c_int, 16);
pub const __INT_MAX__ = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __INT_WIDTH__ = @as(c_int, 32);
pub const __LONG_MAX__ = __helpers.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __LONG_WIDTH__ = @as(c_int, 64);
pub const __LONG_LONG_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __LONG_LONG_WIDTH__ = @as(c_int, 64);
pub const __WCHAR_MAX__ = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __WCHAR_WIDTH__ = @as(c_int, 32);
pub const __WINT_MAX__ = __helpers.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __WINT_WIDTH__ = @as(c_int, 32);
pub const __INTMAX_MAX__ = __helpers.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INTMAX_WIDTH__ = @as(c_int, 64);
pub const __SIZE_MAX__ = __helpers.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __SIZE_WIDTH__ = @as(c_int, 64);
pub const __UINTMAX_MAX__ = __helpers.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __UINTMAX_WIDTH__ = @as(c_int, 64);
pub const __PTRDIFF_MAX__ = __helpers.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __PTRDIFF_WIDTH__ = @as(c_int, 64);
pub const __INTPTR_MAX__ = __helpers.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INTPTR_WIDTH__ = @as(c_int, 64);
pub const __UINTPTR_MAX__ = __helpers.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __UINTPTR_WIDTH__ = @as(c_int, 64);
pub const __SIG_ATOMIC_MAX__ = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __SIG_ATOMIC_WIDTH__ = @as(c_int, 32);
pub const __BITINT_MAXWIDTH__ = __helpers.promoteIntLiteral(c_int, 65535, .decimal);
pub const __SIZEOF_FLOAT__ = @as(c_int, 4);
pub const __SIZEOF_DOUBLE__ = @as(c_int, 8);
pub const __SIZEOF_LONG_DOUBLE__ = @as(c_int, 10);
pub const __SIZEOF_SHORT__ = @as(c_int, 2);
pub const __SIZEOF_INT__ = @as(c_int, 4);
pub const __SIZEOF_LONG__ = @as(c_int, 8);
pub const __SIZEOF_LONG_LONG__ = @as(c_int, 8);
pub const __SIZEOF_POINTER__ = @as(c_int, 8);
pub const __SIZEOF_PTRDIFF_T__ = @as(c_int, 8);
pub const __SIZEOF_SIZE_T__ = @as(c_int, 8);
pub const __SIZEOF_WCHAR_T__ = @as(c_int, 4);
pub const __SIZEOF_WINT_T__ = @as(c_int, 4);
pub const __SIZEOF_INT128__ = @as(c_int, 16);
pub const __INTPTR_TYPE__ = c_long;
pub const __UINTPTR_TYPE__ = c_ulong;
pub const __INTMAX_TYPE__ = c_long;
pub const __INTMAX_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `L`");
// <builtin>:174:9
pub const __INTMAX_C = __helpers.L_SUFFIX;
pub const __UINTMAX_TYPE__ = c_ulong;
pub const __UINTMAX_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `UL`");
// <builtin>:177:9
pub const __UINTMAX_C = __helpers.UL_SUFFIX;
pub const __PTRDIFF_TYPE__ = c_long;
pub const __SIZE_TYPE__ = c_ulong;
pub const __WCHAR_TYPE__ = c_int;
pub const __WINT_TYPE__ = c_uint;
pub const __CHAR16_TYPE__ = c_ushort;
pub const __CHAR32_TYPE__ = c_uint;
pub const __INT8_TYPE__ = i8;
pub const __INT8_FMTd__ = "hhd";
pub const __INT8_FMTi__ = "hhi";
pub const __INT8_C_SUFFIX__ = "";
pub inline fn __INT8_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub const __INT16_TYPE__ = c_short;
pub const __INT16_FMTd__ = "hd";
pub const __INT16_FMTi__ = "hi";
pub const __INT16_C_SUFFIX__ = "";
pub inline fn __INT16_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub const __INT32_TYPE__ = c_int;
pub const __INT32_FMTd__ = "d";
pub const __INT32_FMTi__ = "i";
pub const __INT32_C_SUFFIX__ = "";
pub inline fn __INT32_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub const __INT64_TYPE__ = c_long;
pub const __INT64_FMTd__ = "ld";
pub const __INT64_FMTi__ = "li";
pub const __INT64_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `L`");
// <builtin>:203:9
pub const __INT64_C = __helpers.L_SUFFIX;
pub const __UINT8_TYPE__ = u8;
pub const __UINT8_FMTo__ = "hho";
pub const __UINT8_FMTu__ = "hhu";
pub const __UINT8_FMTx__ = "hhx";
pub const __UINT8_FMTX__ = "hhX";
pub const __UINT8_C_SUFFIX__ = "";
pub inline fn __UINT8_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub const __UINT8_MAX__ = @as(c_int, 255);
pub const __INT8_MAX__ = @as(c_int, 127);
pub const __UINT16_TYPE__ = c_ushort;
pub const __UINT16_FMTo__ = "ho";
pub const __UINT16_FMTu__ = "hu";
pub const __UINT16_FMTx__ = "hx";
pub const __UINT16_FMTX__ = "hX";
pub const __UINT16_C_SUFFIX__ = "";
pub inline fn __UINT16_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub const __UINT16_MAX__ = __helpers.promoteIntLiteral(c_int, 65535, .decimal);
pub const __INT16_MAX__ = @as(c_int, 32767);
pub const __UINT32_TYPE__ = c_uint;
pub const __UINT32_FMTo__ = "o";
pub const __UINT32_FMTu__ = "u";
pub const __UINT32_FMTx__ = "x";
pub const __UINT32_FMTX__ = "X";
pub const __UINT32_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `U`");
// <builtin>:228:9
pub const __UINT32_C = __helpers.U_SUFFIX;
pub const __UINT32_MAX__ = __helpers.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __INT32_MAX__ = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __UINT64_TYPE__ = c_ulong;
pub const __UINT64_FMTo__ = "lo";
pub const __UINT64_FMTu__ = "lu";
pub const __UINT64_FMTx__ = "lx";
pub const __UINT64_FMTX__ = "lX";
pub const __UINT64_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `UL`");
// <builtin>:237:9
pub const __UINT64_C = __helpers.UL_SUFFIX;
pub const __UINT64_MAX__ = __helpers.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __INT64_MAX__ = __helpers.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INT_LEAST8_TYPE__ = i8;
pub const __INT_LEAST8_MAX__ = @as(c_int, 127);
pub const __INT_LEAST8_WIDTH__ = @as(c_int, 8);
pub const INT_LEAST8_FMTd__ = "hhd";
pub const INT_LEAST8_FMTi__ = "hhi";
pub const __UINT_LEAST8_TYPE__ = u8;
pub const __UINT_LEAST8_MAX__ = @as(c_int, 255);
pub const UINT_LEAST8_FMTo__ = "hho";
pub const UINT_LEAST8_FMTu__ = "hhu";
pub const UINT_LEAST8_FMTx__ = "hhx";
pub const UINT_LEAST8_FMTX__ = "hhX";
pub const __INT_FAST8_TYPE__ = i8;
pub const __INT_FAST8_MAX__ = @as(c_int, 127);
pub const __INT_FAST8_WIDTH__ = @as(c_int, 8);
pub const INT_FAST8_FMTd__ = "hhd";
pub const INT_FAST8_FMTi__ = "hhi";
pub const __UINT_FAST8_TYPE__ = u8;
pub const __UINT_FAST8_MAX__ = @as(c_int, 255);
pub const UINT_FAST8_FMTo__ = "hho";
pub const UINT_FAST8_FMTu__ = "hhu";
pub const UINT_FAST8_FMTx__ = "hhx";
pub const UINT_FAST8_FMTX__ = "hhX";
pub const __INT_LEAST16_TYPE__ = c_short;
pub const __INT_LEAST16_MAX__ = @as(c_int, 32767);
pub const __INT_LEAST16_WIDTH__ = @as(c_int, 16);
pub const INT_LEAST16_FMTd__ = "hd";
pub const INT_LEAST16_FMTi__ = "hi";
pub const __UINT_LEAST16_TYPE__ = c_ushort;
pub const __UINT_LEAST16_MAX__ = __helpers.promoteIntLiteral(c_int, 65535, .decimal);
pub const UINT_LEAST16_FMTo__ = "ho";
pub const UINT_LEAST16_FMTu__ = "hu";
pub const UINT_LEAST16_FMTx__ = "hx";
pub const UINT_LEAST16_FMTX__ = "hX";
pub const __INT_FAST16_TYPE__ = c_short;
pub const __INT_FAST16_MAX__ = @as(c_int, 32767);
pub const __INT_FAST16_WIDTH__ = @as(c_int, 16);
pub const INT_FAST16_FMTd__ = "hd";
pub const INT_FAST16_FMTi__ = "hi";
pub const __UINT_FAST16_TYPE__ = c_ushort;
pub const __UINT_FAST16_MAX__ = __helpers.promoteIntLiteral(c_int, 65535, .decimal);
pub const UINT_FAST16_FMTo__ = "ho";
pub const UINT_FAST16_FMTu__ = "hu";
pub const UINT_FAST16_FMTx__ = "hx";
pub const UINT_FAST16_FMTX__ = "hX";
pub const __INT_LEAST32_TYPE__ = c_int;
pub const __INT_LEAST32_MAX__ = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __INT_LEAST32_WIDTH__ = @as(c_int, 32);
pub const INT_LEAST32_FMTd__ = "d";
pub const INT_LEAST32_FMTi__ = "i";
pub const __UINT_LEAST32_TYPE__ = c_uint;
pub const __UINT_LEAST32_MAX__ = __helpers.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const UINT_LEAST32_FMTo__ = "o";
pub const UINT_LEAST32_FMTu__ = "u";
pub const UINT_LEAST32_FMTx__ = "x";
pub const UINT_LEAST32_FMTX__ = "X";
pub const __INT_FAST32_TYPE__ = c_int;
pub const __INT_FAST32_MAX__ = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __INT_FAST32_WIDTH__ = @as(c_int, 32);
pub const INT_FAST32_FMTd__ = "d";
pub const INT_FAST32_FMTi__ = "i";
pub const __UINT_FAST32_TYPE__ = c_uint;
pub const __UINT_FAST32_MAX__ = __helpers.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const UINT_FAST32_FMTo__ = "o";
pub const UINT_FAST32_FMTu__ = "u";
pub const UINT_FAST32_FMTx__ = "x";
pub const UINT_FAST32_FMTX__ = "X";
pub const __INT_LEAST64_TYPE__ = c_long;
pub const __INT_LEAST64_MAX__ = __helpers.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INT_LEAST64_WIDTH__ = @as(c_int, 64);
pub const INT_LEAST64_FMTd__ = "ld";
pub const INT_LEAST64_FMTi__ = "li";
pub const __UINT_LEAST64_TYPE__ = c_ulong;
pub const __UINT_LEAST64_MAX__ = __helpers.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const UINT_LEAST64_FMTo__ = "lo";
pub const UINT_LEAST64_FMTu__ = "lu";
pub const UINT_LEAST64_FMTx__ = "lx";
pub const UINT_LEAST64_FMTX__ = "lX";
pub const __INT_FAST64_TYPE__ = c_long;
pub const __INT_FAST64_MAX__ = __helpers.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INT_FAST64_WIDTH__ = @as(c_int, 64);
pub const INT_FAST64_FMTd__ = "ld";
pub const INT_FAST64_FMTi__ = "li";
pub const __UINT_FAST64_TYPE__ = c_ulong;
pub const __UINT_FAST64_MAX__ = __helpers.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const UINT_FAST64_FMTo__ = "lo";
pub const UINT_FAST64_FMTu__ = "lu";
pub const UINT_FAST64_FMTx__ = "lx";
pub const UINT_FAST64_FMTX__ = "lX";
pub const __FLT16_DENORM_MIN__ = @as(f16, 5.9604644775390625e-8);
pub const __FLT16_HAS_DENORM__ = "";
pub const __FLT16_DIG__ = @as(c_int, 3);
pub const __FLT16_DECIMAL_DIG__ = @as(c_int, 5);
pub const __FLT16_EPSILON__ = @as(f16, 9.765625e-4);
pub const __FLT16_HAS_INFINITY__ = "";
pub const __FLT16_HAS_QUIET_NAN__ = "";
pub const __FLT16_MANT_DIG__ = @as(c_int, 11);
pub const __FLT16_MAX_10_EXP__ = @as(c_int, 4);
pub const __FLT16_MAX_EXP__ = @as(c_int, 16);
pub const __FLT16_MAX__ = @as(f16, 6.5504e+4);
pub const __FLT16_MIN_10_EXP__ = -@as(c_int, 4);
pub const __FLT16_MIN_EXP__ = -@as(c_int, 13);
pub const __FLT16_MIN__ = @as(f16, 6.103515625e-5);
pub const __FLT_DENORM_MIN__ = @as(f32, 1.40129846e-45);
pub const __FLT_HAS_DENORM__ = "";
pub const __FLT_DIG__ = @as(c_int, 6);
pub const __FLT_DECIMAL_DIG__ = @as(c_int, 9);
pub const __FLT_EPSILON__ = @as(f32, 1.19209290e-7);
pub const __FLT_HAS_INFINITY__ = "";
pub const __FLT_HAS_QUIET_NAN__ = "";
pub const __FLT_MANT_DIG__ = @as(c_int, 24);
pub const __FLT_MAX_10_EXP__ = @as(c_int, 38);
pub const __FLT_MAX_EXP__ = @as(c_int, 128);
pub const __FLT_MAX__ = @as(f32, 3.40282347e+38);
pub const __FLT_MIN_10_EXP__ = -@as(c_int, 37);
pub const __FLT_MIN_EXP__ = -@as(c_int, 125);
pub const __FLT_MIN__ = @as(f32, 1.17549435e-38);
pub const __DBL_DENORM_MIN__ = @as(f64, 4.9406564584124654e-324);
pub const __DBL_HAS_DENORM__ = "";
pub const __DBL_DIG__ = @as(c_int, 15);
pub const __DBL_DECIMAL_DIG__ = @as(c_int, 17);
pub const __DBL_EPSILON__ = @as(f64, 2.2204460492503131e-16);
pub const __DBL_HAS_INFINITY__ = "";
pub const __DBL_HAS_QUIET_NAN__ = "";
pub const __DBL_MANT_DIG__ = @as(c_int, 53);
pub const __DBL_MAX_10_EXP__ = @as(c_int, 308);
pub const __DBL_MAX_EXP__ = @as(c_int, 1024);
pub const __DBL_MAX__ = @as(f64, 1.7976931348623157e+308);
pub const __DBL_MIN_10_EXP__ = -@as(c_int, 307);
pub const __DBL_MIN_EXP__ = -@as(c_int, 1021);
pub const __DBL_MIN__ = @as(f64, 2.2250738585072014e-308);
pub const __LDBL_DENORM_MIN__ = @as(c_longdouble, 3.64519953188247460253e-4951);
pub const __LDBL_HAS_DENORM__ = "";
pub const __LDBL_DIG__ = @as(c_int, 18);
pub const __LDBL_DECIMAL_DIG__ = @as(c_int, 21);
pub const __LDBL_EPSILON__ = @as(c_longdouble, 1.08420217248550443401e-19);
pub const __LDBL_HAS_INFINITY__ = "";
pub const __LDBL_HAS_QUIET_NAN__ = "";
pub const __LDBL_MANT_DIG__ = @as(c_int, 64);
pub const __LDBL_MAX_10_EXP__ = @as(c_int, 4932);
pub const __LDBL_MAX_EXP__ = @as(c_int, 16384);
pub const __LDBL_MAX__ = @as(c_longdouble, 1.18973149535723176502e+4932);
pub const __LDBL_MIN_10_EXP__ = -@as(c_int, 4931);
pub const __LDBL_MIN_EXP__ = -@as(c_int, 16381);
pub const __LDBL_MIN__ = @as(c_longdouble, 3.36210314311209350626e-4932);
pub const __FLT_EVAL_METHOD__ = @as(c_int, 0);
pub const __FLT_RADIX__ = @as(c_int, 2);
pub const __DECIMAL_DIG__ = __LDBL_DECIMAL_DIG__;
pub const APR_H = "";
pub const APR_INLINE = @compileError("unable to translate C expr: unexpected token '__inline__'");
// /usr/include/apr-1.0/apr.h:68:9
pub const APR_HAS_INLINE = @as(c_int, 1);
pub const APR_HAVE_ARPA_INET_H = @as(c_int, 1);
pub const APR_HAVE_CONIO_H = @as(c_int, 0);
pub const APR_HAVE_CRYPT_H = @as(c_int, 1);
pub const APR_HAVE_CTYPE_H = @as(c_int, 1);
pub const APR_HAVE_DIRENT_H = @as(c_int, 1);
pub const APR_HAVE_ERRNO_H = @as(c_int, 1);
pub const APR_HAVE_FCNTL_H = @as(c_int, 1);
pub const APR_HAVE_IO_H = @as(c_int, 0);
pub const APR_HAVE_LIMITS_H = @as(c_int, 1);
pub const APR_HAVE_NETDB_H = @as(c_int, 1);
pub const APR_HAVE_NETINET_IN_H = @as(c_int, 1);
pub const APR_HAVE_NETINET_SCTP_H = @as(c_int, 1);
pub const APR_HAVE_NETINET_SCTP_UIO_H = @as(c_int, 0);
pub const APR_HAVE_NETINET_TCP_H = @as(c_int, 1);
pub const APR_HAVE_PROCESS_H = @as(c_int, 0);
pub const APR_HAVE_PTHREAD_H = @as(c_int, 1);
pub const APR_HAVE_SEMAPHORE_H = @as(c_int, 1);
pub const APR_HAVE_SIGNAL_H = @as(c_int, 1);
pub const APR_HAVE_STDARG_H = @as(c_int, 1);
pub const APR_HAVE_STDINT_H = @as(c_int, 1);
pub const APR_HAVE_STDIO_H = @as(c_int, 1);
pub const APR_HAVE_STDLIB_H = @as(c_int, 1);
pub const APR_HAVE_STRING_H = @as(c_int, 1);
pub const APR_HAVE_STRINGS_H = @as(c_int, 1);
pub const APR_HAVE_INTTYPES_H = @as(c_int, 1);
pub const APR_HAVE_SYS_IOCTL_H = @as(c_int, 1);
pub const APR_HAVE_SYS_SENDFILE_H = @as(c_int, 1);
pub const APR_HAVE_SYS_SIGNAL_H = @as(c_int, 1);
pub const APR_HAVE_SYS_SOCKET_H = @as(c_int, 1);
pub const APR_HAVE_SYS_SOCKIO_H = @as(c_int, 0);
pub const APR_HAVE_SYS_SYSLIMITS_H = @as(c_int, 0);
pub const APR_HAVE_SYS_TIME_H = @as(c_int, 1);
pub const APR_HAVE_SYS_TYPES_H = @as(c_int, 1);
pub const APR_HAVE_SYS_UIO_H = @as(c_int, 1);
pub const APR_HAVE_SYS_UN_H = @as(c_int, 1);
pub const APR_HAVE_SYS_WAIT_H = @as(c_int, 1);
pub const APR_HAVE_TIME_H = @as(c_int, 1);
pub const APR_HAVE_UNISTD_H = @as(c_int, 1);
pub const APR_HAVE_WINDOWS_H = @as(c_int, 0);
pub const APR_HAVE_WINSOCK2_H = @as(c_int, 0);
pub const _SYS_TYPES_H = @as(c_int, 1);
pub const _FEATURES_H = @as(c_int, 1);
pub const __KERNEL_STRICT_NAMES = "";
pub inline fn __GNUC_PREREQ(maj: anytype, min: anytype) @TypeOf(((__GNUC__ << @as(c_int, 16)) + __GNUC_MINOR__) >= ((maj << @as(c_int, 16)) + min)) {
    _ = &maj;
    _ = &min;
    return ((__GNUC__ << @as(c_int, 16)) + __GNUC_MINOR__) >= ((maj << @as(c_int, 16)) + min);
}
pub inline fn __glibc_clang_prereq(maj: anytype, min: anytype) @TypeOf(@as(c_int, 0)) {
    _ = &maj;
    _ = &min;
    return @as(c_int, 0);
}
pub const __GLIBC_USE = @compileError("unable to translate macro: undefined identifier `__GLIBC_USE_`");
// /usr/include/features.h:186:9
pub const _DEFAULT_SOURCE = @as(c_int, 1);
pub const __GLIBC_USE_ISOC2X = @as(c_int, 0);
pub const __USE_ISOC11 = @as(c_int, 1);
pub const __USE_POSIX_IMPLICITLY = @as(c_int, 1);
pub const _POSIX_SOURCE = @as(c_int, 1);
pub const _POSIX_C_SOURCE = @as(c_long, 200809);
pub const __USE_POSIX = @as(c_int, 1);
pub const __USE_POSIX2 = @as(c_int, 1);
pub const __USE_POSIX199309 = @as(c_int, 1);
pub const __USE_POSIX199506 = @as(c_int, 1);
pub const __USE_XOPEN2K = @as(c_int, 1);
pub const __USE_ISOC95 = @as(c_int, 1);
pub const __USE_ISOC99 = @as(c_int, 1);
pub const __USE_XOPEN2K8 = @as(c_int, 1);
pub const _ATFILE_SOURCE = @as(c_int, 1);
pub const __WORDSIZE = @as(c_int, 64);
pub const __WORDSIZE_TIME64_COMPAT32 = @as(c_int, 1);
pub const __SYSCALL_WORDSIZE = @as(c_int, 64);
pub const __TIMESIZE = __WORDSIZE;
pub const __USE_MISC = @as(c_int, 1);
pub const __USE_ATFILE = @as(c_int, 1);
pub const __USE_FORTIFY_LEVEL = @as(c_int, 0);
pub const __GLIBC_USE_DEPRECATED_GETS = @as(c_int, 0);
pub const __GLIBC_USE_DEPRECATED_SCANF = @as(c_int, 0);
pub const _STDC_PREDEF_H = @as(c_int, 1);
pub const __STDC_IEC_559__ = @as(c_int, 1);
pub const __STDC_IEC_60559_BFP__ = @as(c_long, 201404);
pub const __STDC_IEC_559_COMPLEX__ = @as(c_int, 1);
pub const __STDC_IEC_60559_COMPLEX__ = @as(c_long, 201404);
pub const __STDC_ISO_10646__ = @as(c_long, 201706);
pub const __GNU_LIBRARY__ = @as(c_int, 6);
pub const __GLIBC__ = @as(c_int, 2);
pub const __GLIBC_MINOR__ = @as(c_int, 35);
pub inline fn __GLIBC_PREREQ(maj: anytype, min: anytype) @TypeOf(((__GLIBC__ << @as(c_int, 16)) + __GLIBC_MINOR__) >= ((maj << @as(c_int, 16)) + min)) {
    _ = &maj;
    _ = &min;
    return ((__GLIBC__ << @as(c_int, 16)) + __GLIBC_MINOR__) >= ((maj << @as(c_int, 16)) + min);
}
pub const _SYS_CDEFS_H = @as(c_int, 1);
pub const __glibc_has_attribute = @compileError("unable to translate macro: undefined identifier `__has_attribute`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:45:10
pub inline fn __glibc_has_builtin(name: anytype) @TypeOf(__builtin.has_builtin(name)) {
    _ = &name;
    return __builtin.has_builtin(name);
}
pub const __glibc_has_extension = @compileError("unable to translate macro: undefined identifier `__has_extension`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:55:10
pub const __LEAF = @compileError("unable to translate macro: undefined identifier `__leaf__`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:65:11
pub const __LEAF_ATTR = @compileError("unable to translate macro: undefined identifier `__leaf__`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:66:11
pub const __THROW = @compileError("unable to translate macro: undefined identifier `__nothrow__`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:79:11
pub const __THROWNL = @compileError("unable to translate macro: undefined identifier `__nothrow__`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:80:11
pub const __NTH = @compileError("unable to translate macro: undefined identifier `__nothrow__`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:81:11
pub const __NTHNL = @compileError("unable to translate macro: undefined identifier `__nothrow__`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:82:11
pub inline fn __P(args: anytype) @TypeOf(args) {
    _ = &args;
    return args;
}
pub inline fn __PMT(args: anytype) @TypeOf(args) {
    _ = &args;
    return args;
}
pub const __CONCAT = @compileError("unable to translate C expr: unexpected token '##'");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:124:9
pub const __STRING = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:125:9
pub const __ptr_t = ?*anyopaque;
pub const __BEGIN_DECLS = "";
pub const __END_DECLS = "";
pub inline fn __bos(ptr: anytype) @TypeOf(__builtin.object_size(ptr, __USE_FORTIFY_LEVEL > @as(c_int, 1))) {
    _ = &ptr;
    return __builtin.object_size(ptr, __USE_FORTIFY_LEVEL > @as(c_int, 1));
}
pub inline fn __bos0(ptr: anytype) @TypeOf(__builtin.object_size(ptr, @as(c_int, 0))) {
    _ = &ptr;
    return __builtin.object_size(ptr, @as(c_int, 0));
}
pub inline fn __glibc_objsize0(__o: anytype) @TypeOf(__bos0(__o)) {
    _ = &__o;
    return __bos0(__o);
}
pub inline fn __glibc_objsize(__o: anytype) @TypeOf(__bos(__o)) {
    _ = &__o;
    return __bos(__o);
}
pub inline fn __glibc_safe_len_cond(__l: anytype, __s: anytype, __osz: anytype) @TypeOf(__l <= __helpers.div(__osz, __s)) {
    _ = &__l;
    _ = &__s;
    _ = &__osz;
    return __l <= __helpers.div(__osz, __s);
}
pub const __glibc_unsigned_or_positive = @compileError("unable to translate C expr: unexpected token '__typeof'");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:160:9
pub inline fn __glibc_safe_or_unknown_len(__l: anytype, __s: anytype, __osz: anytype) @TypeOf(((__glibc_unsigned_or_positive(__l) != 0) and (__builtin.constant_p(__glibc_safe_len_cond(__SIZE_TYPE__(__l), __s, __osz)) != 0)) and (__glibc_safe_len_cond(__SIZE_TYPE__(__l), __s, __osz) != 0)) {
    _ = &__l;
    _ = &__s;
    _ = &__osz;
    return ((__glibc_unsigned_or_positive(__l) != 0) and (__builtin.constant_p(__glibc_safe_len_cond(__SIZE_TYPE__(__l), __s, __osz)) != 0)) and (__glibc_safe_len_cond(__SIZE_TYPE__(__l), __s, __osz) != 0);
}
pub inline fn __glibc_unsafe_len(__l: anytype, __s: anytype, __osz: anytype) @TypeOf(((__glibc_unsigned_or_positive(__l) != 0) and (__builtin.constant_p(__glibc_safe_len_cond(__SIZE_TYPE__(__l), __s, __osz)) != 0)) and !(__glibc_safe_len_cond(__SIZE_TYPE__(__l), __s, __osz) != 0)) {
    _ = &__l;
    _ = &__s;
    _ = &__osz;
    return ((__glibc_unsigned_or_positive(__l) != 0) and (__builtin.constant_p(__glibc_safe_len_cond(__SIZE_TYPE__(__l), __s, __osz)) != 0)) and !(__glibc_safe_len_cond(__SIZE_TYPE__(__l), __s, __osz) != 0);
}
pub const __glibc_fortify = @compileError("unable to translate macro: undefined identifier `__`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:185:9
pub const __glibc_fortify_n = @compileError("unable to translate macro: undefined identifier `__`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:195:9
pub const __warnattr = @compileError("unable to translate macro: undefined identifier `__warning__`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:203:10
pub const __errordecl = @compileError("unable to translate macro: undefined identifier `__error__`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:204:10
pub const __flexarr = @compileError("unable to translate C expr: unexpected token '['");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:216:10
pub const __glibc_c99_flexarr_available = @as(c_int, 1);
pub const __REDIRECT = @compileError("unable to translate C expr: unexpected token '__asm__'");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:247:10
pub const __REDIRECT_NTH = @compileError("unable to translate C expr: unexpected token '__asm__'");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:254:11
pub const __REDIRECT_NTHNL = @compileError("unable to translate C expr: unexpected token '__asm__'");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:256:11
pub const __ASMNAME = @compileError("unable to translate macro: undefined identifier `__USER_LABEL_PREFIX__`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:259:10
pub inline fn __ASMNAME2(prefix: anytype, cname: anytype) @TypeOf(__STRING(prefix) ++ cname) {
    _ = &prefix;
    _ = &cname;
    return __STRING(prefix) ++ cname;
}
pub const __attribute_malloc__ = @compileError("unable to translate macro: undefined identifier `__malloc__`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:281:10
pub const __attribute_alloc_size__ = @compileError("unable to translate macro: undefined identifier `__alloc_size__`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:289:10
pub const __attribute_alloc_align__ = @compileError("unable to translate macro: undefined identifier `__alloc_align__`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:298:10
pub const __attribute_pure__ = @compileError("unable to translate macro: undefined identifier `__pure__`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:308:10
pub const __attribute_const__ = @compileError("unable to translate C expr: unexpected token '__attribute__'");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:315:10
pub const __attribute_maybe_unused__ = @compileError("unable to translate macro: undefined identifier `__unused__`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:321:10
pub const __attribute_used__ = @compileError("unable to translate macro: undefined identifier `__used__`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:330:10
pub const __attribute_noinline__ = @compileError("unable to translate macro: undefined identifier `__noinline__`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:331:10
pub const __attribute_deprecated__ = @compileError("unable to translate macro: undefined identifier `__deprecated__`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:339:10
pub const __attribute_deprecated_msg__ = @compileError("unable to translate macro: undefined identifier `__deprecated__`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:349:10
pub const __attribute_format_arg__ = @compileError("unable to translate macro: undefined identifier `__format_arg__`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:362:10
pub const __attribute_format_strfmon__ = @compileError("unable to translate macro: undefined identifier `__format__`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:372:10
pub const __attribute_nonnull__ = @compileError("unable to translate macro: undefined identifier `__nonnull__`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:384:11
pub inline fn __nonnull(params: anytype) @TypeOf(__attribute_nonnull__(params)) {
    _ = &params;
    return __attribute_nonnull__(params);
}
pub const __returns_nonnull = @compileError("unable to translate macro: undefined identifier `__returns_nonnull__`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:397:10
pub const __attribute_warn_unused_result__ = @compileError("unable to translate macro: undefined identifier `__warn_unused_result__`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:406:10
pub const __wur = "";
pub const __always_inline = @compileError("unable to translate macro: undefined identifier `__always_inline__`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:424:10
pub const __attribute_artificial__ = @compileError("unable to translate macro: undefined identifier `__artificial__`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:433:10
pub const __extern_inline = @compileError("unable to translate C expr: unexpected token 'extern'");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:455:11
pub const __extern_always_inline = @compileError("unable to translate C expr: unexpected token 'extern'");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:456:11
pub const __fortify_function = __extern_always_inline ++ __attribute_artificial__;
pub const __va_arg_pack = @compileError("unable to translate macro: undefined identifier `__builtin_va_arg_pack`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:467:10
pub const __va_arg_pack_len = @compileError("unable to translate macro: undefined identifier `__builtin_va_arg_pack_len`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:468:10
pub const __restrict_arr = @compileError("unable to translate C expr: unexpected token '__restrict'");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:495:10
pub inline fn __glibc_unlikely(cond: anytype) @TypeOf(__builtin.expect(cond, @as(c_int, 0))) {
    _ = &cond;
    return __builtin.expect(cond, @as(c_int, 0));
}
pub inline fn __glibc_likely(cond: anytype) @TypeOf(__builtin.expect(cond, @as(c_int, 1))) {
    _ = &cond;
    return __builtin.expect(cond, @as(c_int, 1));
}
pub const __attribute_nonstring__ = "";
pub inline fn __attribute_copy__(arg: anytype) void {
    _ = &arg;
    return;
}
pub const __LDOUBLE_REDIRECTS_TO_FLOAT128_ABI = @as(c_int, 0);
pub inline fn __LDBL_REDIR1(name: anytype, proto: anytype, alias: anytype) @TypeOf(name ++ proto) {
    _ = &name;
    _ = &proto;
    _ = &alias;
    return name ++ proto;
}
pub inline fn __LDBL_REDIR(name: anytype, proto: anytype) @TypeOf(name ++ proto) {
    _ = &name;
    _ = &proto;
    return name ++ proto;
}
pub inline fn __LDBL_REDIR1_NTH(name: anytype, proto: anytype, alias: anytype) @TypeOf(name ++ proto ++ __THROW) {
    _ = &name;
    _ = &proto;
    _ = &alias;
    return name ++ proto ++ __THROW;
}
pub inline fn __LDBL_REDIR_NTH(name: anytype, proto: anytype) @TypeOf(name ++ proto ++ __THROW) {
    _ = &name;
    _ = &proto;
    return name ++ proto ++ __THROW;
}
pub inline fn __LDBL_REDIR2_DECL(name: anytype) void {
    _ = &name;
    return;
}
pub inline fn __LDBL_REDIR_DECL(name: anytype) void {
    _ = &name;
    return;
}
pub inline fn __REDIRECT_LDBL(name: anytype, proto: anytype, alias: anytype) @TypeOf(__REDIRECT(name, proto, alias)) {
    _ = &name;
    _ = &proto;
    _ = &alias;
    return __REDIRECT(name, proto, alias);
}
pub inline fn __REDIRECT_NTH_LDBL(name: anytype, proto: anytype, alias: anytype) @TypeOf(__REDIRECT_NTH(name, proto, alias)) {
    _ = &name;
    _ = &proto;
    _ = &alias;
    return __REDIRECT_NTH(name, proto, alias);
}
pub const __glibc_macro_warning1 = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:635:10
pub const __glibc_macro_warning = @compileError("unable to translate macro: undefined identifier `GCC`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:636:10
pub const __HAVE_GENERIC_SELECTION = @as(c_int, 1);
pub inline fn __fortified_attr_access(a: anytype, o: anytype, s: anytype) void {
    _ = &a;
    _ = &o;
    _ = &s;
    return;
}
pub inline fn __attr_access(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __attr_access_none(argno: anytype) void {
    _ = &argno;
    return;
}
pub inline fn __attr_dealloc(dealloc: anytype, argno: anytype) void {
    _ = &dealloc;
    _ = &argno;
    return;
}
pub const __attr_dealloc_free = "";
pub const __attribute_returns_twice__ = @compileError("unable to translate macro: undefined identifier `__returns_twice__`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:700:10
pub const __stub___compat_bdflush = "";
pub const __stub_chflags = "";
pub const __stub_fchflags = "";
pub const __stub_gtty = "";
pub const __stub_revoke = "";
pub const __stub_setlogin = "";
pub const __stub_sigreturn = "";
pub const __stub_stty = "";
pub const _BITS_TYPES_H = @as(c_int, 1);
pub const __S16_TYPE = c_short;
pub const __U16_TYPE = c_ushort;
pub const __S32_TYPE = c_int;
pub const __U32_TYPE = c_uint;
pub const __SLONGWORD_TYPE = c_long;
pub const __ULONGWORD_TYPE = c_ulong;
pub const __SQUAD_TYPE = c_long;
pub const __UQUAD_TYPE = c_ulong;
pub const __SWORD_TYPE = c_long;
pub const __UWORD_TYPE = c_ulong;
pub const __SLONG32_TYPE = c_int;
pub const __ULONG32_TYPE = c_uint;
pub const __S64_TYPE = c_long;
pub const __U64_TYPE = c_ulong;
pub const _BITS_TYPESIZES_H = @as(c_int, 1);
pub const __SYSCALL_SLONG_TYPE = __SLONGWORD_TYPE;
pub const __SYSCALL_ULONG_TYPE = __ULONGWORD_TYPE;
pub const __DEV_T_TYPE = __UQUAD_TYPE;
pub const __UID_T_TYPE = __U32_TYPE;
pub const __GID_T_TYPE = __U32_TYPE;
pub const __INO_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __INO64_T_TYPE = __UQUAD_TYPE;
pub const __MODE_T_TYPE = __U32_TYPE;
pub const __NLINK_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __FSWORD_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __OFF_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __OFF64_T_TYPE = __SQUAD_TYPE;
pub const __PID_T_TYPE = __S32_TYPE;
pub const __RLIM_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __RLIM64_T_TYPE = __UQUAD_TYPE;
pub const __BLKCNT_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __BLKCNT64_T_TYPE = __SQUAD_TYPE;
pub const __FSBLKCNT_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __FSBLKCNT64_T_TYPE = __UQUAD_TYPE;
pub const __FSFILCNT_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __FSFILCNT64_T_TYPE = __UQUAD_TYPE;
pub const __ID_T_TYPE = __U32_TYPE;
pub const __CLOCK_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __TIME_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __USECONDS_T_TYPE = __U32_TYPE;
pub const __SUSECONDS_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __SUSECONDS64_T_TYPE = __SQUAD_TYPE;
pub const __DADDR_T_TYPE = __S32_TYPE;
pub const __KEY_T_TYPE = __S32_TYPE;
pub const __CLOCKID_T_TYPE = __S32_TYPE;
pub const __TIMER_T_TYPE = ?*anyopaque;
pub const __BLKSIZE_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __FSID_T_TYPE = @compileError("unable to translate macro: undefined identifier `__val`");
// /usr/include/x86_64-linux-gnu/bits/typesizes.h:73:9
pub const __SSIZE_T_TYPE = __SWORD_TYPE;
pub const __CPU_MASK_TYPE = __SYSCALL_ULONG_TYPE;
pub const __OFF_T_MATCHES_OFF64_T = @as(c_int, 1);
pub const __INO_T_MATCHES_INO64_T = @as(c_int, 1);
pub const __RLIM_T_MATCHES_RLIM64_T = @as(c_int, 1);
pub const __STATFS_MATCHES_STATFS64 = @as(c_int, 1);
pub const __KERNEL_OLD_TIMEVAL_MATCHES_TIMEVAL64 = @as(c_int, 1);
pub const _BITS_TIME64_H = @as(c_int, 1);
pub const __TIME64_T_TYPE = __TIME_T_TYPE;
pub const __u_char_defined = "";
pub const __ino_t_defined = "";
pub const __dev_t_defined = "";
pub const __gid_t_defined = "";
pub const __mode_t_defined = "";
pub const __nlink_t_defined = "";
pub const __uid_t_defined = "";
pub const __off_t_defined = "";
pub const __pid_t_defined = "";
pub const __id_t_defined = "";
pub const __ssize_t_defined = "";
pub const __daddr_t_defined = "";
pub const __key_t_defined = "";
pub const __clock_t_defined = @as(c_int, 1);
pub const __clockid_t_defined = @as(c_int, 1);
pub const __time_t_defined = @as(c_int, 1);
pub const __timer_t_defined = @as(c_int, 1);
pub const __need_size_t = "";
pub const __STDC_VERSION_STDDEF_H__ = @as(c_long, 202311);
pub const NULL = __helpers.cast(?*anyopaque, @as(c_int, 0));
pub const offsetof = @compileError("unable to translate macro: undefined identifier `__builtin_offsetof`");
// /home/user/tools/zig-0.17.0/lib/compiler/aro/include/stddef.h:18:9
pub const _BITS_STDINT_INTN_H = @as(c_int, 1);
pub const __BIT_TYPES_DEFINED__ = @as(c_int, 1);
pub const _ENDIAN_H = @as(c_int, 1);
pub const _BITS_ENDIAN_H = @as(c_int, 1);
pub const __LITTLE_ENDIAN = @as(c_int, 1234);
pub const __BIG_ENDIAN = @as(c_int, 4321);
pub const __PDP_ENDIAN = @as(c_int, 3412);
pub const _BITS_ENDIANNESS_H = @as(c_int, 1);
pub const __BYTE_ORDER = __LITTLE_ENDIAN;
pub const __FLOAT_WORD_ORDER = __BYTE_ORDER;
pub inline fn __LONG_LONG_PAIR(HI: anytype, LO: anytype) @TypeOf(HI) {
    _ = &HI;
    _ = &LO;
    return blk: {
        _ = &LO;
        break :blk HI;
    };
}
pub const LITTLE_ENDIAN = __LITTLE_ENDIAN;
pub const BIG_ENDIAN = __BIG_ENDIAN;
pub const PDP_ENDIAN = __PDP_ENDIAN;
pub const BYTE_ORDER = __BYTE_ORDER;
pub const _BITS_BYTESWAP_H = @as(c_int, 1);
pub inline fn __bswap_constant_16(x: anytype) __uint16_t {
    _ = &x;
    return __helpers.cast(__uint16_t, ((x >> @as(c_int, 8)) & @as(c_int, 0xff)) | ((x & @as(c_int, 0xff)) << @as(c_int, 8)));
}
pub inline fn __bswap_constant_32(x: anytype) @TypeOf(((((x & __helpers.promoteIntLiteral(c_uint, 0xff000000, .hex)) >> @as(c_int, 24)) | ((x & __helpers.promoteIntLiteral(c_uint, 0x00ff0000, .hex)) >> @as(c_int, 8))) | ((x & @as(c_uint, 0x0000ff00)) << @as(c_int, 8))) | ((x & @as(c_uint, 0x000000ff)) << @as(c_int, 24))) {
    _ = &x;
    return ((((x & __helpers.promoteIntLiteral(c_uint, 0xff000000, .hex)) >> @as(c_int, 24)) | ((x & __helpers.promoteIntLiteral(c_uint, 0x00ff0000, .hex)) >> @as(c_int, 8))) | ((x & @as(c_uint, 0x0000ff00)) << @as(c_int, 8))) | ((x & @as(c_uint, 0x000000ff)) << @as(c_int, 24));
}
pub inline fn __bswap_constant_64(x: anytype) @TypeOf(((((((((x & @as(c_ulonglong, 0xff00000000000000)) >> @as(c_int, 56)) | ((x & @as(c_ulonglong, 0x00ff000000000000)) >> @as(c_int, 40))) | ((x & @as(c_ulonglong, 0x0000ff0000000000)) >> @as(c_int, 24))) | ((x & @as(c_ulonglong, 0x000000ff00000000)) >> @as(c_int, 8))) | ((x & @as(c_ulonglong, 0x00000000ff000000)) << @as(c_int, 8))) | ((x & @as(c_ulonglong, 0x0000000000ff0000)) << @as(c_int, 24))) | ((x & @as(c_ulonglong, 0x000000000000ff00)) << @as(c_int, 40))) | ((x & @as(c_ulonglong, 0x00000000000000ff)) << @as(c_int, 56))) {
    _ = &x;
    return ((((((((x & @as(c_ulonglong, 0xff00000000000000)) >> @as(c_int, 56)) | ((x & @as(c_ulonglong, 0x00ff000000000000)) >> @as(c_int, 40))) | ((x & @as(c_ulonglong, 0x0000ff0000000000)) >> @as(c_int, 24))) | ((x & @as(c_ulonglong, 0x000000ff00000000)) >> @as(c_int, 8))) | ((x & @as(c_ulonglong, 0x00000000ff000000)) << @as(c_int, 8))) | ((x & @as(c_ulonglong, 0x0000000000ff0000)) << @as(c_int, 24))) | ((x & @as(c_ulonglong, 0x000000000000ff00)) << @as(c_int, 40))) | ((x & @as(c_ulonglong, 0x00000000000000ff)) << @as(c_int, 56));
}
pub const _BITS_UINTN_IDENTITY_H = @as(c_int, 1);
pub inline fn htobe16(x: anytype) @TypeOf(__bswap_16(x)) {
    _ = &x;
    return __bswap_16(x);
}
pub inline fn htole16(x: anytype) @TypeOf(__uint16_identity(x)) {
    _ = &x;
    return __uint16_identity(x);
}
pub inline fn be16toh(x: anytype) @TypeOf(__bswap_16(x)) {
    _ = &x;
    return __bswap_16(x);
}
pub inline fn le16toh(x: anytype) @TypeOf(__uint16_identity(x)) {
    _ = &x;
    return __uint16_identity(x);
}
pub inline fn htobe32(x: anytype) @TypeOf(__bswap_32(x)) {
    _ = &x;
    return __bswap_32(x);
}
pub inline fn htole32(x: anytype) @TypeOf(__uint32_identity(x)) {
    _ = &x;
    return __uint32_identity(x);
}
pub inline fn be32toh(x: anytype) @TypeOf(__bswap_32(x)) {
    _ = &x;
    return __bswap_32(x);
}
pub inline fn le32toh(x: anytype) @TypeOf(__uint32_identity(x)) {
    _ = &x;
    return __uint32_identity(x);
}
pub inline fn htobe64(x: anytype) @TypeOf(__bswap_64(x)) {
    _ = &x;
    return __bswap_64(x);
}
pub inline fn htole64(x: anytype) @TypeOf(__uint64_identity(x)) {
    _ = &x;
    return __uint64_identity(x);
}
pub inline fn be64toh(x: anytype) @TypeOf(__bswap_64(x)) {
    _ = &x;
    return __bswap_64(x);
}
pub inline fn le64toh(x: anytype) @TypeOf(__uint64_identity(x)) {
    _ = &x;
    return __uint64_identity(x);
}
pub const _SYS_SELECT_H = @as(c_int, 1);
pub const __FD_ZERO = @compileError("unable to translate macro: undefined identifier `__i`");
// /usr/include/x86_64-linux-gnu/bits/select.h:25:9
pub const __FD_SET = @compileError("unable to translate C expr: expected ')' instead got '|='");
// /usr/include/x86_64-linux-gnu/bits/select.h:32:9
pub const __FD_CLR = @compileError("unable to translate C expr: expected ')' instead got '&='");
// /usr/include/x86_64-linux-gnu/bits/select.h:34:9
pub inline fn __FD_ISSET(d: anytype, s: anytype) @TypeOf((__FDS_BITS(s)[@as(usize, @intCast(__FD_ELT(d)))] & __FD_MASK(d)) != @as(c_int, 0)) {
    _ = &d;
    _ = &s;
    return (__FDS_BITS(s)[@as(usize, @intCast(__FD_ELT(d)))] & __FD_MASK(d)) != @as(c_int, 0);
}
pub const __sigset_t_defined = @as(c_int, 1);
pub const ____sigset_t_defined = "";
pub const _SIGSET_NWORDS = __helpers.div(@as(c_int, 1024), @as(c_int, 8) * __helpers.sizeof(c_ulong));
pub const __timeval_defined = @as(c_int, 1);
pub const _STRUCT_TIMESPEC = @as(c_int, 1);
pub const __suseconds_t_defined = "";
pub const __NFDBITS = @as(c_int, 8) * __helpers.cast(c_int, __helpers.sizeof(__fd_mask));
pub inline fn __FD_ELT(d: anytype) @TypeOf(__helpers.div(d, __NFDBITS)) {
    _ = &d;
    return __helpers.div(d, __NFDBITS);
}
pub inline fn __FD_MASK(d: anytype) __fd_mask {
    _ = &d;
    return __helpers.cast(__fd_mask, @as(c_ulong, 1) << __helpers.rem(d, __NFDBITS));
}
pub inline fn __FDS_BITS(set: anytype) @TypeOf(set.*.__fds_bits) {
    _ = &set;
    return set.*.__fds_bits;
}
pub const FD_SETSIZE = __FD_SETSIZE;
pub const NFDBITS = __NFDBITS;
pub inline fn FD_SET(fd: anytype, fdsetp: anytype) @TypeOf(__FD_SET(fd, fdsetp)) {
    _ = &fd;
    _ = &fdsetp;
    return __FD_SET(fd, fdsetp);
}
pub inline fn FD_CLR(fd: anytype, fdsetp: anytype) @TypeOf(__FD_CLR(fd, fdsetp)) {
    _ = &fd;
    _ = &fdsetp;
    return __FD_CLR(fd, fdsetp);
}
pub inline fn FD_ISSET(fd: anytype, fdsetp: anytype) @TypeOf(__FD_ISSET(fd, fdsetp)) {
    _ = &fd;
    _ = &fdsetp;
    return __FD_ISSET(fd, fdsetp);
}
pub inline fn FD_ZERO(fdsetp: anytype) @TypeOf(__FD_ZERO(fdsetp)) {
    _ = &fdsetp;
    return __FD_ZERO(fdsetp);
}
pub const __blksize_t_defined = "";
pub const __blkcnt_t_defined = "";
pub const __fsblkcnt_t_defined = "";
pub const __fsfilcnt_t_defined = "";
pub const _BITS_PTHREADTYPES_COMMON_H = @as(c_int, 1);
pub const _THREAD_SHARED_TYPES_H = @as(c_int, 1);
pub const _BITS_PTHREADTYPES_ARCH_H = @as(c_int, 1);
pub const __SIZEOF_PTHREAD_MUTEX_T = @as(c_int, 40);
pub const __SIZEOF_PTHREAD_ATTR_T = @as(c_int, 56);
pub const __SIZEOF_PTHREAD_RWLOCK_T = @as(c_int, 56);
pub const __SIZEOF_PTHREAD_BARRIER_T = @as(c_int, 32);
pub const __SIZEOF_PTHREAD_MUTEXATTR_T = @as(c_int, 4);
pub const __SIZEOF_PTHREAD_COND_T = @as(c_int, 48);
pub const __SIZEOF_PTHREAD_CONDATTR_T = @as(c_int, 4);
pub const __SIZEOF_PTHREAD_RWLOCKATTR_T = @as(c_int, 8);
pub const __SIZEOF_PTHREAD_BARRIERATTR_T = @as(c_int, 4);
pub const __LOCK_ALIGNMENT = "";
pub const __ONCE_ALIGNMENT = "";
pub const _BITS_ATOMIC_WIDE_COUNTER_H = "";
pub const _THREAD_MUTEX_INTERNAL_H = @as(c_int, 1);
pub const __PTHREAD_MUTEX_HAVE_PREV = @as(c_int, 1);
pub const __PTHREAD_MUTEX_INITIALIZER = @compileError("unable to translate C expr: unexpected token '{'");
// /usr/include/x86_64-linux-gnu/bits/struct_mutex.h:56:10
pub const _RWLOCK_INTERNAL_H = "";
pub const __PTHREAD_RWLOCK_ELISION_EXTRA = @compileError("unable to translate C expr: unexpected token '{'");
// /usr/include/x86_64-linux-gnu/bits/struct_rwlock.h:40:11
pub inline fn __PTHREAD_RWLOCK_INITIALIZER(__flags: anytype) @TypeOf(__flags) {
    _ = &__flags;
    return blk: {
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = &__PTHREAD_RWLOCK_ELISION_EXTRA;
        _ = @as(c_int, 0);
        break :blk __flags;
    };
}
pub const __ONCE_FLAG_INIT = @compileError("unable to translate C expr: unexpected token '{'");
// /usr/include/x86_64-linux-gnu/bits/thread-shared-types.h:113:9
pub const __have_pthread_attr_t = @as(c_int, 1);
pub const _SYS_SOCKET_H = @as(c_int, 1);
pub const __iovec_defined = @as(c_int, 1);
pub const __BITS_SOCKET_H = "";
pub const __socklen_t_defined = "";
pub const PF_UNSPEC = @as(c_int, 0);
pub const PF_LOCAL = @as(c_int, 1);
pub const PF_UNIX = PF_LOCAL;
pub const PF_FILE = PF_LOCAL;
pub const PF_INET = @as(c_int, 2);
pub const PF_AX25 = @as(c_int, 3);
pub const PF_IPX = @as(c_int, 4);
pub const PF_APPLETALK = @as(c_int, 5);
pub const PF_NETROM = @as(c_int, 6);
pub const PF_BRIDGE = @as(c_int, 7);
pub const PF_ATMPVC = @as(c_int, 8);
pub const PF_X25 = @as(c_int, 9);
pub const PF_INET6 = @as(c_int, 10);
pub const PF_ROSE = @as(c_int, 11);
pub const PF_DECnet = @as(c_int, 12);
pub const PF_NETBEUI = @as(c_int, 13);
pub const PF_SECURITY = @as(c_int, 14);
pub const PF_KEY = @as(c_int, 15);
pub const PF_NETLINK = @as(c_int, 16);
pub const PF_ROUTE = PF_NETLINK;
pub const PF_PACKET = @as(c_int, 17);
pub const PF_ASH = @as(c_int, 18);
pub const PF_ECONET = @as(c_int, 19);
pub const PF_ATMSVC = @as(c_int, 20);
pub const PF_RDS = @as(c_int, 21);
pub const PF_SNA = @as(c_int, 22);
pub const PF_IRDA = @as(c_int, 23);
pub const PF_PPPOX = @as(c_int, 24);
pub const PF_WANPIPE = @as(c_int, 25);
pub const PF_LLC = @as(c_int, 26);
pub const PF_IB = @as(c_int, 27);
pub const PF_MPLS = @as(c_int, 28);
pub const PF_CAN = @as(c_int, 29);
pub const PF_TIPC = @as(c_int, 30);
pub const PF_BLUETOOTH = @as(c_int, 31);
pub const PF_IUCV = @as(c_int, 32);
pub const PF_RXRPC = @as(c_int, 33);
pub const PF_ISDN = @as(c_int, 34);
pub const PF_PHONET = @as(c_int, 35);
pub const PF_IEEE802154 = @as(c_int, 36);
pub const PF_CAIF = @as(c_int, 37);
pub const PF_ALG = @as(c_int, 38);
pub const PF_NFC = @as(c_int, 39);
pub const PF_VSOCK = @as(c_int, 40);
pub const PF_KCM = @as(c_int, 41);
pub const PF_QIPCRTR = @as(c_int, 42);
pub const PF_SMC = @as(c_int, 43);
pub const PF_XDP = @as(c_int, 44);
pub const PF_MCTP = @as(c_int, 45);
pub const PF_MAX = @as(c_int, 46);
pub const AF_UNSPEC = PF_UNSPEC;
pub const AF_LOCAL = PF_LOCAL;
pub const AF_UNIX = PF_UNIX;
pub const AF_FILE = PF_FILE;
pub const AF_INET = PF_INET;
pub const AF_AX25 = PF_AX25;
pub const AF_IPX = PF_IPX;
pub const AF_APPLETALK = PF_APPLETALK;
pub const AF_NETROM = PF_NETROM;
pub const AF_BRIDGE = PF_BRIDGE;
pub const AF_ATMPVC = PF_ATMPVC;
pub const AF_X25 = PF_X25;
pub const AF_INET6 = PF_INET6;
pub const AF_ROSE = PF_ROSE;
pub const AF_DECnet = PF_DECnet;
pub const AF_NETBEUI = PF_NETBEUI;
pub const AF_SECURITY = PF_SECURITY;
pub const AF_KEY = PF_KEY;
pub const AF_NETLINK = PF_NETLINK;
pub const AF_ROUTE = PF_ROUTE;
pub const AF_PACKET = PF_PACKET;
pub const AF_ASH = PF_ASH;
pub const AF_ECONET = PF_ECONET;
pub const AF_ATMSVC = PF_ATMSVC;
pub const AF_RDS = PF_RDS;
pub const AF_SNA = PF_SNA;
pub const AF_IRDA = PF_IRDA;
pub const AF_PPPOX = PF_PPPOX;
pub const AF_WANPIPE = PF_WANPIPE;
pub const AF_LLC = PF_LLC;
pub const AF_IB = PF_IB;
pub const AF_MPLS = PF_MPLS;
pub const AF_CAN = PF_CAN;
pub const AF_TIPC = PF_TIPC;
pub const AF_BLUETOOTH = PF_BLUETOOTH;
pub const AF_IUCV = PF_IUCV;
pub const AF_RXRPC = PF_RXRPC;
pub const AF_ISDN = PF_ISDN;
pub const AF_PHONET = PF_PHONET;
pub const AF_IEEE802154 = PF_IEEE802154;
pub const AF_CAIF = PF_CAIF;
pub const AF_ALG = PF_ALG;
pub const AF_NFC = PF_NFC;
pub const AF_VSOCK = PF_VSOCK;
pub const AF_KCM = PF_KCM;
pub const AF_QIPCRTR = PF_QIPCRTR;
pub const AF_SMC = PF_SMC;
pub const AF_XDP = PF_XDP;
pub const AF_MCTP = PF_MCTP;
pub const AF_MAX = PF_MAX;
pub const SOL_RAW = @as(c_int, 255);
pub const SOL_DECNET = @as(c_int, 261);
pub const SOL_X25 = @as(c_int, 262);
pub const SOL_PACKET = @as(c_int, 263);
pub const SOL_ATM = @as(c_int, 264);
pub const SOL_AAL = @as(c_int, 265);
pub const SOL_IRDA = @as(c_int, 266);
pub const SOL_NETBEUI = @as(c_int, 267);
pub const SOL_LLC = @as(c_int, 268);
pub const SOL_DCCP = @as(c_int, 269);
pub const SOL_NETLINK = @as(c_int, 270);
pub const SOL_TIPC = @as(c_int, 271);
pub const SOL_RXRPC = @as(c_int, 272);
pub const SOL_PPPOL2TP = @as(c_int, 273);
pub const SOL_BLUETOOTH = @as(c_int, 274);
pub const SOL_PNPIPE = @as(c_int, 275);
pub const SOL_RDS = @as(c_int, 276);
pub const SOL_IUCV = @as(c_int, 277);
pub const SOL_CAIF = @as(c_int, 278);
pub const SOL_ALG = @as(c_int, 279);
pub const SOL_NFC = @as(c_int, 280);
pub const SOL_KCM = @as(c_int, 281);
pub const SOL_TLS = @as(c_int, 282);
pub const SOL_XDP = @as(c_int, 283);
pub const SOMAXCONN = @as(c_int, 4096);
pub const _BITS_SOCKADDR_H = @as(c_int, 1);
pub const __SOCKADDR_COMMON = @compileError("unable to translate macro: undefined identifier `family`");
// /usr/include/x86_64-linux-gnu/bits/sockaddr.h:34:9
pub const __SOCKADDR_COMMON_SIZE = __helpers.sizeof(c_ushort);
pub const _SS_SIZE = @as(c_int, 128);
pub const __ss_aligntype = c_ulong;
pub const _SS_PADSIZE = (_SS_SIZE - __SOCKADDR_COMMON_SIZE) - __helpers.sizeof(__ss_aligntype);
pub inline fn CMSG_DATA(cmsg: anytype) @TypeOf(cmsg.*.__cmsg_data) {
    _ = &cmsg;
    return cmsg.*.__cmsg_data;
}
pub inline fn CMSG_NXTHDR(mhdr: anytype, cmsg: anytype) @TypeOf(__cmsg_nxthdr(mhdr, cmsg)) {
    _ = &mhdr;
    _ = &cmsg;
    return __cmsg_nxthdr(mhdr, cmsg);
}
pub inline fn CMSG_FIRSTHDR(mhdr: anytype) @TypeOf(if (__helpers.cast(bool, __helpers.cast(usize, mhdr.*.msg_controllen) >= __helpers.sizeof(struct_cmsghdr))) __helpers.cast([*c]struct_cmsghdr, mhdr.*.msg_control) else __helpers.cast([*c]struct_cmsghdr, @as(c_int, 0))) {
    _ = &mhdr;
    return if (__helpers.cast(bool, __helpers.cast(usize, mhdr.*.msg_controllen) >= __helpers.sizeof(struct_cmsghdr))) __helpers.cast([*c]struct_cmsghdr, mhdr.*.msg_control) else __helpers.cast([*c]struct_cmsghdr, @as(c_int, 0));
}
pub inline fn CMSG_ALIGN(len: anytype) @TypeOf(((len + __helpers.sizeof(usize)) - @as(c_int, 1)) & __helpers.cast(usize, ~(__helpers.sizeof(usize) - @as(c_int, 1)))) {
    _ = &len;
    return ((len + __helpers.sizeof(usize)) - @as(c_int, 1)) & __helpers.cast(usize, ~(__helpers.sizeof(usize) - @as(c_int, 1)));
}
pub inline fn CMSG_SPACE(len: anytype) @TypeOf(CMSG_ALIGN(len) + CMSG_ALIGN(__helpers.sizeof(struct_cmsghdr))) {
    _ = &len;
    return CMSG_ALIGN(len) + CMSG_ALIGN(__helpers.sizeof(struct_cmsghdr));
}
pub inline fn CMSG_LEN(len: anytype) @TypeOf(CMSG_ALIGN(__helpers.sizeof(struct_cmsghdr)) + len) {
    _ = &len;
    return CMSG_ALIGN(__helpers.sizeof(struct_cmsghdr)) + len;
}
pub const __ASM_GENERIC_SOCKET_H = "";
pub const _LINUX_POSIX_TYPES_H = "";
pub const _LINUX_STDDEF_H = "";
pub const __struct_group = @compileError("unable to translate macro: untranslatable usage of arg `TAG`");
// /usr/include/linux/stddef.h:26:9
pub const __DECLARE_FLEX_ARRAY = @compileError("unable to translate macro: undefined identifier `__empty_`");
// /usr/include/linux/stddef.h:42:9
pub const __FD_SETSIZE = @as(c_int, 1024);
pub const _ASM_X86_POSIX_TYPES_64_H = "";
pub const __ASM_GENERIC_POSIX_TYPES_H = "";
pub const __ASM_X86_BITSPERLONG_H = "";
pub const __BITS_PER_LONG = @as(c_int, 64);
pub const __ASM_GENERIC_BITS_PER_LONG = "";
pub const __ASM_GENERIC_SOCKIOS_H = "";
pub const FIOSETOWN = __helpers.promoteIntLiteral(c_int, 0x8901, .hex);
pub const SIOCSPGRP = __helpers.promoteIntLiteral(c_int, 0x8902, .hex);
pub const FIOGETOWN = __helpers.promoteIntLiteral(c_int, 0x8903, .hex);
pub const SIOCGPGRP = __helpers.promoteIntLiteral(c_int, 0x8904, .hex);
pub const SIOCATMARK = __helpers.promoteIntLiteral(c_int, 0x8905, .hex);
pub const SIOCGSTAMP_OLD = __helpers.promoteIntLiteral(c_int, 0x8906, .hex);
pub const SIOCGSTAMPNS_OLD = __helpers.promoteIntLiteral(c_int, 0x8907, .hex);
pub const SOL_SOCKET = @as(c_int, 1);
pub const SO_DEBUG = @as(c_int, 1);
pub const SO_REUSEADDR = @as(c_int, 2);
pub const SO_TYPE = @as(c_int, 3);
pub const SO_ERROR = @as(c_int, 4);
pub const SO_DONTROUTE = @as(c_int, 5);
pub const SO_BROADCAST = @as(c_int, 6);
pub const SO_SNDBUF = @as(c_int, 7);
pub const SO_RCVBUF = @as(c_int, 8);
pub const SO_SNDBUFFORCE = @as(c_int, 32);
pub const SO_RCVBUFFORCE = @as(c_int, 33);
pub const SO_KEEPALIVE = @as(c_int, 9);
pub const SO_OOBINLINE = @as(c_int, 10);
pub const SO_NO_CHECK = @as(c_int, 11);
pub const SO_PRIORITY = @as(c_int, 12);
pub const SO_LINGER = @as(c_int, 13);
pub const SO_BSDCOMPAT = @as(c_int, 14);
pub const SO_REUSEPORT = @as(c_int, 15);
pub const SO_PASSCRED = @as(c_int, 16);
pub const SO_PEERCRED = @as(c_int, 17);
pub const SO_RCVLOWAT = @as(c_int, 18);
pub const SO_SNDLOWAT = @as(c_int, 19);
pub const SO_RCVTIMEO_OLD = @as(c_int, 20);
pub const SO_SNDTIMEO_OLD = @as(c_int, 21);
pub const SO_SECURITY_AUTHENTICATION = @as(c_int, 22);
pub const SO_SECURITY_ENCRYPTION_TRANSPORT = @as(c_int, 23);
pub const SO_SECURITY_ENCRYPTION_NETWORK = @as(c_int, 24);
pub const SO_BINDTODEVICE = @as(c_int, 25);
pub const SO_ATTACH_FILTER = @as(c_int, 26);
pub const SO_DETACH_FILTER = @as(c_int, 27);
pub const SO_GET_FILTER = SO_ATTACH_FILTER;
pub const SO_PEERNAME = @as(c_int, 28);
pub const SO_ACCEPTCONN = @as(c_int, 30);
pub const SO_PEERSEC = @as(c_int, 31);
pub const SO_PASSSEC = @as(c_int, 34);
pub const SO_MARK = @as(c_int, 36);
pub const SO_PROTOCOL = @as(c_int, 38);
pub const SO_DOMAIN = @as(c_int, 39);
pub const SO_RXQ_OVFL = @as(c_int, 40);
pub const SO_WIFI_STATUS = @as(c_int, 41);
pub const SCM_WIFI_STATUS = SO_WIFI_STATUS;
pub const SO_PEEK_OFF = @as(c_int, 42);
pub const SO_NOFCS = @as(c_int, 43);
pub const SO_LOCK_FILTER = @as(c_int, 44);
pub const SO_SELECT_ERR_QUEUE = @as(c_int, 45);
pub const SO_BUSY_POLL = @as(c_int, 46);
pub const SO_MAX_PACING_RATE = @as(c_int, 47);
pub const SO_BPF_EXTENSIONS = @as(c_int, 48);
pub const SO_INCOMING_CPU = @as(c_int, 49);
pub const SO_ATTACH_BPF = @as(c_int, 50);
pub const SO_DETACH_BPF = SO_DETACH_FILTER;
pub const SO_ATTACH_REUSEPORT_CBPF = @as(c_int, 51);
pub const SO_ATTACH_REUSEPORT_EBPF = @as(c_int, 52);
pub const SO_CNX_ADVICE = @as(c_int, 53);
pub const SCM_TIMESTAMPING_OPT_STATS = @as(c_int, 54);
pub const SO_MEMINFO = @as(c_int, 55);
pub const SO_INCOMING_NAPI_ID = @as(c_int, 56);
pub const SO_COOKIE = @as(c_int, 57);
pub const SCM_TIMESTAMPING_PKTINFO = @as(c_int, 58);
pub const SO_PEERGROUPS = @as(c_int, 59);
pub const SO_ZEROCOPY = @as(c_int, 60);
pub const SO_TXTIME = @as(c_int, 61);
pub const SCM_TXTIME = SO_TXTIME;
pub const SO_BINDTOIFINDEX = @as(c_int, 62);
pub const SO_TIMESTAMP_OLD = @as(c_int, 29);
pub const SO_TIMESTAMPNS_OLD = @as(c_int, 35);
pub const SO_TIMESTAMPING_OLD = @as(c_int, 37);
pub const SO_TIMESTAMP_NEW = @as(c_int, 63);
pub const SO_TIMESTAMPNS_NEW = @as(c_int, 64);
pub const SO_TIMESTAMPING_NEW = @as(c_int, 65);
pub const SO_RCVTIMEO_NEW = @as(c_int, 66);
pub const SO_SNDTIMEO_NEW = @as(c_int, 67);
pub const SO_DETACH_REUSEPORT_BPF = @as(c_int, 68);
pub const SO_PREFER_BUSY_POLL = @as(c_int, 69);
pub const SO_BUSY_POLL_BUDGET = @as(c_int, 70);
pub const SO_NETNS_COOKIE = @as(c_int, 71);
pub const SO_BUF_LOCK = @as(c_int, 72);
pub const SO_TIMESTAMP = SO_TIMESTAMP_OLD;
pub const SO_TIMESTAMPNS = SO_TIMESTAMPNS_OLD;
pub const SO_TIMESTAMPING = SO_TIMESTAMPING_OLD;
pub const SO_RCVTIMEO = SO_RCVTIMEO_OLD;
pub const SO_SNDTIMEO = SO_SNDTIMEO_OLD;
pub const SCM_TIMESTAMP = SO_TIMESTAMP;
pub const SCM_TIMESTAMPNS = SO_TIMESTAMPNS;
pub const SCM_TIMESTAMPING = SO_TIMESTAMPING;
pub const __osockaddr_defined = @as(c_int, 1);
pub const __SOCKADDR_ARG = @compileError("unable to translate C expr: unexpected token '__restrict'");
// /usr/include/x86_64-linux-gnu/sys/socket.h:58:10
pub const __CONST_SOCKADDR_ARG = @compileError("unable to translate C expr: unexpected token 'const'");
// /usr/include/x86_64-linux-gnu/sys/socket.h:59:10
pub const __CLANG_STDINT_H = "";
pub const _STDINT_H = @as(c_int, 1);
pub const _BITS_WCHAR_H = @as(c_int, 1);
pub const __WCHAR_MAX = __WCHAR_MAX__;
pub const __WCHAR_MIN = -__WCHAR_MAX - @as(c_int, 1);
pub const _BITS_STDINT_UINTN_H = @as(c_int, 1);
pub const __intptr_t_defined = "";
pub const INT8_MIN = -@as(c_int, 128);
pub const INT16_MIN = -@as(c_int, 32767) - @as(c_int, 1);
pub const INT32_MIN = -__helpers.promoteIntLiteral(c_int, 2147483647, .decimal) - @as(c_int, 1);
pub const INT64_MIN = -__INT64_C(__helpers.promoteIntLiteral(c_int, 9223372036854775807, .decimal)) - @as(c_int, 1);
pub const INT8_MAX = @as(c_int, 127);
pub const INT16_MAX = @as(c_int, 32767);
pub const INT32_MAX = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const INT64_MAX = __INT64_C(__helpers.promoteIntLiteral(c_int, 9223372036854775807, .decimal));
pub const UINT8_MAX = @as(c_int, 255);
pub const UINT16_MAX = __helpers.promoteIntLiteral(c_int, 65535, .decimal);
pub const UINT32_MAX = __helpers.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const UINT64_MAX = __UINT64_C(__helpers.promoteIntLiteral(c_int, 18446744073709551615, .decimal));
pub const INT_LEAST8_MIN = -@as(c_int, 128);
pub const INT_LEAST16_MIN = -@as(c_int, 32767) - @as(c_int, 1);
pub const INT_LEAST32_MIN = -__helpers.promoteIntLiteral(c_int, 2147483647, .decimal) - @as(c_int, 1);
pub const INT_LEAST64_MIN = -__INT64_C(__helpers.promoteIntLiteral(c_int, 9223372036854775807, .decimal)) - @as(c_int, 1);
pub const INT_LEAST8_MAX = @as(c_int, 127);
pub const INT_LEAST16_MAX = @as(c_int, 32767);
pub const INT_LEAST32_MAX = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const INT_LEAST64_MAX = __INT64_C(__helpers.promoteIntLiteral(c_int, 9223372036854775807, .decimal));
pub const UINT_LEAST8_MAX = @as(c_int, 255);
pub const UINT_LEAST16_MAX = __helpers.promoteIntLiteral(c_int, 65535, .decimal);
pub const UINT_LEAST32_MAX = __helpers.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const UINT_LEAST64_MAX = __UINT64_C(__helpers.promoteIntLiteral(c_int, 18446744073709551615, .decimal));
pub const INT_FAST8_MIN = -@as(c_int, 128);
pub const INT_FAST16_MIN = -__helpers.promoteIntLiteral(c_long, 9223372036854775807, .decimal) - @as(c_int, 1);
pub const INT_FAST32_MIN = -__helpers.promoteIntLiteral(c_long, 9223372036854775807, .decimal) - @as(c_int, 1);
pub const INT_FAST64_MIN = -__INT64_C(__helpers.promoteIntLiteral(c_int, 9223372036854775807, .decimal)) - @as(c_int, 1);
pub const INT_FAST8_MAX = @as(c_int, 127);
pub const INT_FAST16_MAX = __helpers.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const INT_FAST32_MAX = __helpers.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const INT_FAST64_MAX = __INT64_C(__helpers.promoteIntLiteral(c_int, 9223372036854775807, .decimal));
pub const UINT_FAST8_MAX = @as(c_int, 255);
pub const UINT_FAST16_MAX = __helpers.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const UINT_FAST32_MAX = __helpers.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const UINT_FAST64_MAX = __UINT64_C(__helpers.promoteIntLiteral(c_int, 18446744073709551615, .decimal));
pub const INTPTR_MIN = -__helpers.promoteIntLiteral(c_long, 9223372036854775807, .decimal) - @as(c_int, 1);
pub const INTPTR_MAX = __helpers.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const UINTPTR_MAX = __helpers.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const INTMAX_MIN = -__INT64_C(__helpers.promoteIntLiteral(c_int, 9223372036854775807, .decimal)) - @as(c_int, 1);
pub const INTMAX_MAX = __INT64_C(__helpers.promoteIntLiteral(c_int, 9223372036854775807, .decimal));
pub const UINTMAX_MAX = __UINT64_C(__helpers.promoteIntLiteral(c_int, 18446744073709551615, .decimal));
pub const PTRDIFF_MIN = -__helpers.promoteIntLiteral(c_long, 9223372036854775807, .decimal) - @as(c_int, 1);
pub const PTRDIFF_MAX = __helpers.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const SIG_ATOMIC_MIN = -__helpers.promoteIntLiteral(c_int, 2147483647, .decimal) - @as(c_int, 1);
pub const SIG_ATOMIC_MAX = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const SIZE_MAX = __helpers.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const WCHAR_MIN = __WCHAR_MIN;
pub const WCHAR_MAX = __WCHAR_MAX;
pub const WINT_MIN = @as(c_uint, 0);
pub const WINT_MAX = __helpers.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub inline fn INT8_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub inline fn INT16_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub inline fn INT32_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub const INT64_C = __helpers.L_SUFFIX;
pub inline fn UINT8_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub inline fn UINT16_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub const UINT32_C = __helpers.U_SUFFIX;
pub const UINT64_C = __helpers.UL_SUFFIX;
pub const INTMAX_C = __helpers.L_SUFFIX;
pub const UINTMAX_C = __helpers.UL_SUFFIX;
pub const __CLANG_INTTYPES_H = "";
pub const _INTTYPES_H = @as(c_int, 1);
pub const ____gwchar_t_defined = @as(c_int, 1);
pub const __PRI64_PREFIX = "l";
pub const __PRIPTR_PREFIX = "l";
pub const PRId8 = "d";
pub const PRId16 = "d";
pub const PRId32 = "d";
pub const PRId64 = __PRI64_PREFIX ++ "d";
pub const PRIdLEAST8 = "d";
pub const PRIdLEAST16 = "d";
pub const PRIdLEAST32 = "d";
pub const PRIdLEAST64 = __PRI64_PREFIX ++ "d";
pub const PRIdFAST8 = "d";
pub const PRIdFAST16 = __PRIPTR_PREFIX ++ "d";
pub const PRIdFAST32 = __PRIPTR_PREFIX ++ "d";
pub const PRIdFAST64 = __PRI64_PREFIX ++ "d";
pub const PRIi8 = "i";
pub const PRIi16 = "i";
pub const PRIi32 = "i";
pub const PRIi64 = __PRI64_PREFIX ++ "i";
pub const PRIiLEAST8 = "i";
pub const PRIiLEAST16 = "i";
pub const PRIiLEAST32 = "i";
pub const PRIiLEAST64 = __PRI64_PREFIX ++ "i";
pub const PRIiFAST8 = "i";
pub const PRIiFAST16 = __PRIPTR_PREFIX ++ "i";
pub const PRIiFAST32 = __PRIPTR_PREFIX ++ "i";
pub const PRIiFAST64 = __PRI64_PREFIX ++ "i";
pub const PRIo8 = "o";
pub const PRIo16 = "o";
pub const PRIo32 = "o";
pub const PRIo64 = __PRI64_PREFIX ++ "o";
pub const PRIoLEAST8 = "o";
pub const PRIoLEAST16 = "o";
pub const PRIoLEAST32 = "o";
pub const PRIoLEAST64 = __PRI64_PREFIX ++ "o";
pub const PRIoFAST8 = "o";
pub const PRIoFAST16 = __PRIPTR_PREFIX ++ "o";
pub const PRIoFAST32 = __PRIPTR_PREFIX ++ "o";
pub const PRIoFAST64 = __PRI64_PREFIX ++ "o";
pub const PRIu8 = "u";
pub const PRIu16 = "u";
pub const PRIu32 = "u";
pub const PRIu64 = __PRI64_PREFIX ++ "u";
pub const PRIuLEAST8 = "u";
pub const PRIuLEAST16 = "u";
pub const PRIuLEAST32 = "u";
pub const PRIuLEAST64 = __PRI64_PREFIX ++ "u";
pub const PRIuFAST8 = "u";
pub const PRIuFAST16 = __PRIPTR_PREFIX ++ "u";
pub const PRIuFAST32 = __PRIPTR_PREFIX ++ "u";
pub const PRIuFAST64 = __PRI64_PREFIX ++ "u";
pub const PRIx8 = "x";
pub const PRIx16 = "x";
pub const PRIx32 = "x";
pub const PRIx64 = __PRI64_PREFIX ++ "x";
pub const PRIxLEAST8 = "x";
pub const PRIxLEAST16 = "x";
pub const PRIxLEAST32 = "x";
pub const PRIxLEAST64 = __PRI64_PREFIX ++ "x";
pub const PRIxFAST8 = "x";
pub const PRIxFAST16 = __PRIPTR_PREFIX ++ "x";
pub const PRIxFAST32 = __PRIPTR_PREFIX ++ "x";
pub const PRIxFAST64 = __PRI64_PREFIX ++ "x";
pub const PRIX8 = "X";
pub const PRIX16 = "X";
pub const PRIX32 = "X";
pub const PRIX64 = __PRI64_PREFIX ++ "X";
pub const PRIXLEAST8 = "X";
pub const PRIXLEAST16 = "X";
pub const PRIXLEAST32 = "X";
pub const PRIXLEAST64 = __PRI64_PREFIX ++ "X";
pub const PRIXFAST8 = "X";
pub const PRIXFAST16 = __PRIPTR_PREFIX ++ "X";
pub const PRIXFAST32 = __PRIPTR_PREFIX ++ "X";
pub const PRIXFAST64 = __PRI64_PREFIX ++ "X";
pub const PRIdMAX = __PRI64_PREFIX ++ "d";
pub const PRIiMAX = __PRI64_PREFIX ++ "i";
pub const PRIoMAX = __PRI64_PREFIX ++ "o";
pub const PRIuMAX = __PRI64_PREFIX ++ "u";
pub const PRIxMAX = __PRI64_PREFIX ++ "x";
pub const PRIXMAX = __PRI64_PREFIX ++ "X";
pub const PRIdPTR = __PRIPTR_PREFIX ++ "d";
pub const PRIiPTR = __PRIPTR_PREFIX ++ "i";
pub const PRIoPTR = __PRIPTR_PREFIX ++ "o";
pub const PRIuPTR = __PRIPTR_PREFIX ++ "u";
pub const PRIxPTR = __PRIPTR_PREFIX ++ "x";
pub const PRIXPTR = __PRIPTR_PREFIX ++ "X";
pub const SCNd8 = "hhd";
pub const SCNd16 = "hd";
pub const SCNd32 = "d";
pub const SCNd64 = __PRI64_PREFIX ++ "d";
pub const SCNdLEAST8 = "hhd";
pub const SCNdLEAST16 = "hd";
pub const SCNdLEAST32 = "d";
pub const SCNdLEAST64 = __PRI64_PREFIX ++ "d";
pub const SCNdFAST8 = "hhd";
pub const SCNdFAST16 = __PRIPTR_PREFIX ++ "d";
pub const SCNdFAST32 = __PRIPTR_PREFIX ++ "d";
pub const SCNdFAST64 = __PRI64_PREFIX ++ "d";
pub const SCNi8 = "hhi";
pub const SCNi16 = "hi";
pub const SCNi32 = "i";
pub const SCNi64 = __PRI64_PREFIX ++ "i";
pub const SCNiLEAST8 = "hhi";
pub const SCNiLEAST16 = "hi";
pub const SCNiLEAST32 = "i";
pub const SCNiLEAST64 = __PRI64_PREFIX ++ "i";
pub const SCNiFAST8 = "hhi";
pub const SCNiFAST16 = __PRIPTR_PREFIX ++ "i";
pub const SCNiFAST32 = __PRIPTR_PREFIX ++ "i";
pub const SCNiFAST64 = __PRI64_PREFIX ++ "i";
pub const SCNu8 = "hhu";
pub const SCNu16 = "hu";
pub const SCNu32 = "u";
pub const SCNu64 = __PRI64_PREFIX ++ "u";
pub const SCNuLEAST8 = "hhu";
pub const SCNuLEAST16 = "hu";
pub const SCNuLEAST32 = "u";
pub const SCNuLEAST64 = __PRI64_PREFIX ++ "u";
pub const SCNuFAST8 = "hhu";
pub const SCNuFAST16 = __PRIPTR_PREFIX ++ "u";
pub const SCNuFAST32 = __PRIPTR_PREFIX ++ "u";
pub const SCNuFAST64 = __PRI64_PREFIX ++ "u";
pub const SCNo8 = "hho";
pub const SCNo16 = "ho";
pub const SCNo32 = "o";
pub const SCNo64 = __PRI64_PREFIX ++ "o";
pub const SCNoLEAST8 = "hho";
pub const SCNoLEAST16 = "ho";
pub const SCNoLEAST32 = "o";
pub const SCNoLEAST64 = __PRI64_PREFIX ++ "o";
pub const SCNoFAST8 = "hho";
pub const SCNoFAST16 = __PRIPTR_PREFIX ++ "o";
pub const SCNoFAST32 = __PRIPTR_PREFIX ++ "o";
pub const SCNoFAST64 = __PRI64_PREFIX ++ "o";
pub const SCNx8 = "hhx";
pub const SCNx16 = "hx";
pub const SCNx32 = "x";
pub const SCNx64 = __PRI64_PREFIX ++ "x";
pub const SCNxLEAST8 = "hhx";
pub const SCNxLEAST16 = "hx";
pub const SCNxLEAST32 = "x";
pub const SCNxLEAST64 = __PRI64_PREFIX ++ "x";
pub const SCNxFAST8 = "hhx";
pub const SCNxFAST16 = __PRIPTR_PREFIX ++ "x";
pub const SCNxFAST32 = __PRIPTR_PREFIX ++ "x";
pub const SCNxFAST64 = __PRI64_PREFIX ++ "x";
pub const SCNdMAX = __PRI64_PREFIX ++ "d";
pub const SCNiMAX = __PRI64_PREFIX ++ "i";
pub const SCNoMAX = __PRI64_PREFIX ++ "o";
pub const SCNuMAX = __PRI64_PREFIX ++ "u";
pub const SCNxMAX = __PRI64_PREFIX ++ "x";
pub const SCNdPTR = __PRIPTR_PREFIX ++ "d";
pub const SCNiPTR = __PRIPTR_PREFIX ++ "i";
pub const SCNoPTR = __PRIPTR_PREFIX ++ "o";
pub const SCNuPTR = __PRIPTR_PREFIX ++ "u";
pub const SCNxPTR = __PRIPTR_PREFIX ++ "x";
pub const _SYS_WAIT_H = @as(c_int, 1);
pub const _SIGNAL_H = "";
pub const _BITS_SIGNUM_GENERIC_H = @as(c_int, 1);
pub const SIG_ERR = __helpers.cast(__sighandler_t, -@as(c_int, 1));
pub const SIG_DFL = __helpers.cast(__sighandler_t, @as(c_int, 0));
pub const SIG_IGN = __helpers.cast(__sighandler_t, @as(c_int, 1));
pub const SIGINT = @as(c_int, 2);
pub const SIGILL = @as(c_int, 4);
pub const SIGABRT = @as(c_int, 6);
pub const SIGFPE = @as(c_int, 8);
pub const SIGSEGV = @as(c_int, 11);
pub const SIGTERM = @as(c_int, 15);
pub const SIGHUP = @as(c_int, 1);
pub const SIGQUIT = @as(c_int, 3);
pub const SIGTRAP = @as(c_int, 5);
pub const SIGKILL = @as(c_int, 9);
pub const SIGPIPE = @as(c_int, 13);
pub const SIGALRM = @as(c_int, 14);
pub const SIGIO = SIGPOLL;
pub const SIGIOT = SIGABRT;
pub const SIGCLD = SIGCHLD;
pub const _BITS_SIGNUM_ARCH_H = @as(c_int, 1);
pub const SIGSTKFLT = @as(c_int, 16);
pub const SIGPWR = @as(c_int, 30);
pub const SIGBUS = @as(c_int, 7);
pub const SIGSYS = @as(c_int, 31);
pub const SIGURG = @as(c_int, 23);
pub const SIGSTOP = @as(c_int, 19);
pub const SIGTSTP = @as(c_int, 20);
pub const SIGCONT = @as(c_int, 18);
pub const SIGCHLD = @as(c_int, 17);
pub const SIGTTIN = @as(c_int, 21);
pub const SIGTTOU = @as(c_int, 22);
pub const SIGPOLL = @as(c_int, 29);
pub const SIGXFSZ = @as(c_int, 25);
pub const SIGXCPU = @as(c_int, 24);
pub const SIGVTALRM = @as(c_int, 26);
pub const SIGPROF = @as(c_int, 27);
pub const SIGUSR1 = @as(c_int, 10);
pub const SIGUSR2 = @as(c_int, 12);
pub const SIGWINCH = @as(c_int, 28);
pub const __SIGRTMIN = @as(c_int, 32);
pub const __SIGRTMAX = @as(c_int, 64);
pub const _NSIG = __SIGRTMAX + @as(c_int, 1);
pub const __sig_atomic_t_defined = @as(c_int, 1);
pub const __siginfo_t_defined = @as(c_int, 1);
pub const ____sigval_t_defined = "";
pub const __SI_MAX_SIZE = @as(c_int, 128);
pub const __SI_PAD_SIZE = __helpers.div(__SI_MAX_SIZE, __helpers.sizeof(c_int)) - @as(c_int, 4);
pub const _BITS_SIGINFO_ARCH_H = @as(c_int, 1);
pub const __SI_ALIGNMENT = "";
pub const __SI_BAND_TYPE = c_long;
pub const __SI_CLOCK_T = __clock_t;
pub const __SI_ERRNO_THEN_CODE = @as(c_int, 1);
pub const __SI_HAVE_SIGSYS = @as(c_int, 1);
pub const __SI_SIGFAULT_ADDL = "";
pub const si_pid = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/x86_64-linux-gnu/bits/types/siginfo_t.h:128:9
pub const si_uid = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/x86_64-linux-gnu/bits/types/siginfo_t.h:129:9
pub const si_timerid = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/x86_64-linux-gnu/bits/types/siginfo_t.h:130:9
pub const si_overrun = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/x86_64-linux-gnu/bits/types/siginfo_t.h:131:9
pub const si_status = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/x86_64-linux-gnu/bits/types/siginfo_t.h:132:9
pub const si_utime = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/x86_64-linux-gnu/bits/types/siginfo_t.h:133:9
pub const si_stime = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/x86_64-linux-gnu/bits/types/siginfo_t.h:134:9
pub const si_value = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/x86_64-linux-gnu/bits/types/siginfo_t.h:135:9
pub const si_int = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/x86_64-linux-gnu/bits/types/siginfo_t.h:136:9
pub const si_ptr = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/x86_64-linux-gnu/bits/types/siginfo_t.h:137:9
pub const si_addr = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/x86_64-linux-gnu/bits/types/siginfo_t.h:138:9
pub const si_addr_lsb = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/x86_64-linux-gnu/bits/types/siginfo_t.h:139:9
pub const si_lower = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/x86_64-linux-gnu/bits/types/siginfo_t.h:140:9
pub const si_upper = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/x86_64-linux-gnu/bits/types/siginfo_t.h:141:9
pub const si_pkey = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/x86_64-linux-gnu/bits/types/siginfo_t.h:142:9
pub const si_band = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/x86_64-linux-gnu/bits/types/siginfo_t.h:143:9
pub const si_fd = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/x86_64-linux-gnu/bits/types/siginfo_t.h:144:9
pub const si_call_addr = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/x86_64-linux-gnu/bits/types/siginfo_t.h:146:10
pub const si_syscall = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/x86_64-linux-gnu/bits/types/siginfo_t.h:147:10
pub const si_arch = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/x86_64-linux-gnu/bits/types/siginfo_t.h:148:10
pub const _BITS_SIGINFO_CONSTS_H = @as(c_int, 1);
pub const __SI_ASYNCIO_AFTER_SIGIO = @as(c_int, 1);
pub const __sigval_t_defined = "";
pub const __sigevent_t_defined = @as(c_int, 1);
pub const __SIGEV_MAX_SIZE = @as(c_int, 64);
pub const __SIGEV_PAD_SIZE = __helpers.div(__SIGEV_MAX_SIZE, __helpers.sizeof(c_int)) - @as(c_int, 4);
pub const sigev_notify_function = @compileError("unable to translate macro: undefined identifier `_sigev_un`");
// /usr/include/x86_64-linux-gnu/bits/types/sigevent_t.h:45:9
pub const sigev_notify_attributes = @compileError("unable to translate macro: undefined identifier `_sigev_un`");
// /usr/include/x86_64-linux-gnu/bits/types/sigevent_t.h:46:9
pub const _BITS_SIGEVENT_CONSTS_H = @as(c_int, 1);
pub inline fn sigmask(sig: anytype) @TypeOf(__glibc_macro_warning("sigmask is deprecated")(__helpers.cast(c_int, @as(c_uint, 1) << (sig - @as(c_int, 1))))) {
    _ = &sig;
    return __glibc_macro_warning("sigmask is deprecated")(__helpers.cast(c_int, @as(c_uint, 1) << (sig - @as(c_int, 1))));
}
pub const NSIG = _NSIG;
pub const _BITS_SIGACTION_H = @as(c_int, 1);
pub const sa_handler = @compileError("unable to translate macro: undefined identifier `__sigaction_handler`");
// /usr/include/x86_64-linux-gnu/bits/sigaction.h:39:10
pub const sa_sigaction = @compileError("unable to translate macro: undefined identifier `__sigaction_handler`");
// /usr/include/x86_64-linux-gnu/bits/sigaction.h:40:10
pub const SA_NOCLDSTOP = @as(c_int, 1);
pub const SA_NOCLDWAIT = @as(c_int, 2);
pub const SA_SIGINFO = @as(c_int, 4);
pub const SA_ONSTACK = __helpers.promoteIntLiteral(c_int, 0x08000000, .hex);
pub const SA_RESTART = __helpers.promoteIntLiteral(c_int, 0x10000000, .hex);
pub const SA_NODEFER = __helpers.promoteIntLiteral(c_int, 0x40000000, .hex);
pub const SA_RESETHAND = __helpers.promoteIntLiteral(c_int, 0x80000000, .hex);
pub const SA_INTERRUPT = __helpers.promoteIntLiteral(c_int, 0x20000000, .hex);
pub const SA_NOMASK = SA_NODEFER;
pub const SA_ONESHOT = SA_RESETHAND;
pub const SA_STACK = SA_ONSTACK;
pub const SIG_BLOCK = @as(c_int, 0);
pub const SIG_UNBLOCK = @as(c_int, 1);
pub const SIG_SETMASK = @as(c_int, 2);
pub const _BITS_SIGCONTEXT_H = @as(c_int, 1);
pub const FP_XSTATE_MAGIC1 = __helpers.promoteIntLiteral(c_uint, 0x46505853, .hex);
pub const FP_XSTATE_MAGIC2 = __helpers.promoteIntLiteral(c_uint, 0x46505845, .hex);
pub const FP_XSTATE_MAGIC2_SIZE = __helpers.sizeof(FP_XSTATE_MAGIC2);
pub const __stack_t_defined = @as(c_int, 1);
pub const _SYS_UCONTEXT_H = @as(c_int, 1);
pub const __NGREG = @as(c_int, 23);
pub const NGREG = __NGREG;
pub const _BITS_SIGSTACK_H = @as(c_int, 1);
pub const MINSIGSTKSZ = @as(c_int, 2048);
pub const SIGSTKSZ = @as(c_int, 8192);
pub const _BITS_SS_FLAGS_H = @as(c_int, 1);
pub const __sigstack_defined = @as(c_int, 1);
pub const _BITS_SIGTHREAD_H = @as(c_int, 1);
pub const SIGRTMIN = __libc_current_sigrtmin();
pub const SIGRTMAX = __libc_current_sigrtmax();
pub const WNOHANG = @as(c_int, 1);
pub const WUNTRACED = @as(c_int, 2);
pub const WSTOPPED = @as(c_int, 2);
pub const WEXITED = @as(c_int, 4);
pub const WCONTINUED = @as(c_int, 8);
pub const WNOWAIT = __helpers.promoteIntLiteral(c_int, 0x01000000, .hex);
pub const __WNOTHREAD = __helpers.promoteIntLiteral(c_int, 0x20000000, .hex);
pub const __WALL = __helpers.promoteIntLiteral(c_int, 0x40000000, .hex);
pub const __WCLONE = __helpers.promoteIntLiteral(c_int, 0x80000000, .hex);
pub inline fn __WEXITSTATUS(status: anytype) @TypeOf((status & __helpers.promoteIntLiteral(c_int, 0xff00, .hex)) >> @as(c_int, 8)) {
    _ = &status;
    return (status & __helpers.promoteIntLiteral(c_int, 0xff00, .hex)) >> @as(c_int, 8);
}
pub inline fn __WTERMSIG(status: anytype) @TypeOf(status & @as(c_int, 0x7f)) {
    _ = &status;
    return status & @as(c_int, 0x7f);
}
pub inline fn __WSTOPSIG(status: anytype) @TypeOf(__WEXITSTATUS(status)) {
    _ = &status;
    return __WEXITSTATUS(status);
}
pub inline fn __WIFEXITED(status: anytype) @TypeOf(__WTERMSIG(status) == @as(c_int, 0)) {
    _ = &status;
    return __WTERMSIG(status) == @as(c_int, 0);
}
pub inline fn __WIFSIGNALED(status: anytype) @TypeOf((__helpers.cast(i8, (status & @as(c_int, 0x7f)) + @as(c_int, 1)) >> @as(c_int, 1)) > @as(c_int, 0)) {
    _ = &status;
    return (__helpers.cast(i8, (status & @as(c_int, 0x7f)) + @as(c_int, 1)) >> @as(c_int, 1)) > @as(c_int, 0);
}
pub inline fn __WIFSTOPPED(status: anytype) @TypeOf((status & @as(c_int, 0xff)) == @as(c_int, 0x7f)) {
    _ = &status;
    return (status & @as(c_int, 0xff)) == @as(c_int, 0x7f);
}
pub inline fn __WIFCONTINUED(status: anytype) @TypeOf(status == __W_CONTINUED) {
    _ = &status;
    return status == __W_CONTINUED;
}
pub inline fn __WCOREDUMP(status: anytype) @TypeOf(status & __WCOREFLAG) {
    _ = &status;
    return status & __WCOREFLAG;
}
pub inline fn __W_EXITCODE(ret: anytype, sig: anytype) @TypeOf((ret << @as(c_int, 8)) | sig) {
    _ = &ret;
    _ = &sig;
    return (ret << @as(c_int, 8)) | sig;
}
pub inline fn __W_STOPCODE(sig: anytype) @TypeOf((sig << @as(c_int, 8)) | @as(c_int, 0x7f)) {
    _ = &sig;
    return (sig << @as(c_int, 8)) | @as(c_int, 0x7f);
}
pub const __W_CONTINUED = __helpers.promoteIntLiteral(c_int, 0xffff, .hex);
pub const __WCOREFLAG = @as(c_int, 0x80);
pub inline fn WEXITSTATUS(status: anytype) @TypeOf(__WEXITSTATUS(status)) {
    _ = &status;
    return __WEXITSTATUS(status);
}
pub inline fn WTERMSIG(status: anytype) @TypeOf(__WTERMSIG(status)) {
    _ = &status;
    return __WTERMSIG(status);
}
pub inline fn WSTOPSIG(status: anytype) @TypeOf(__WSTOPSIG(status)) {
    _ = &status;
    return __WSTOPSIG(status);
}
pub inline fn WIFEXITED(status: anytype) @TypeOf(__WIFEXITED(status)) {
    _ = &status;
    return __WIFEXITED(status);
}
pub inline fn WIFSIGNALED(status: anytype) @TypeOf(__WIFSIGNALED(status)) {
    _ = &status;
    return __WIFSIGNALED(status);
}
pub inline fn WIFSTOPPED(status: anytype) @TypeOf(__WIFSTOPPED(status)) {
    _ = &status;
    return __WIFSTOPPED(status);
}
pub inline fn WIFCONTINUED(status: anytype) @TypeOf(__WIFCONTINUED(status)) {
    _ = &status;
    return __WIFCONTINUED(status);
}
pub const WCOREFLAG = __WCOREFLAG;
pub inline fn WCOREDUMP(status: anytype) @TypeOf(__WCOREDUMP(status)) {
    _ = &status;
    return __WCOREDUMP(status);
}
pub inline fn W_EXITCODE(ret: anytype, sig: anytype) @TypeOf(__W_EXITCODE(ret, sig)) {
    _ = &ret;
    _ = &sig;
    return __W_EXITCODE(ret, sig);
}
pub inline fn W_STOPCODE(sig: anytype) @TypeOf(__W_STOPCODE(sig)) {
    _ = &sig;
    return __W_STOPCODE(sig);
}
pub const WAIT_ANY = -@as(c_int, 1);
pub const WAIT_MYPGRP = @as(c_int, 0);
pub const _GCC_LIMITS_H_ = "";
pub const __CLANG_LIMITS_H = "";
pub const _LIBC_LIMITS_H_ = @as(c_int, 1);
pub const MB_LEN_MAX = @as(c_int, 16);
pub const _BITS_POSIX1_LIM_H = @as(c_int, 1);
pub const _POSIX_AIO_LISTIO_MAX = @as(c_int, 2);
pub const _POSIX_AIO_MAX = @as(c_int, 1);
pub const _POSIX_ARG_MAX = @as(c_int, 4096);
pub const _POSIX_CHILD_MAX = @as(c_int, 25);
pub const _POSIX_DELAYTIMER_MAX = @as(c_int, 32);
pub const _POSIX_HOST_NAME_MAX = @as(c_int, 255);
pub const _POSIX_LINK_MAX = @as(c_int, 8);
pub const _POSIX_LOGIN_NAME_MAX = @as(c_int, 9);
pub const _POSIX_MAX_CANON = @as(c_int, 255);
pub const _POSIX_MAX_INPUT = @as(c_int, 255);
pub const _POSIX_MQ_OPEN_MAX = @as(c_int, 8);
pub const _POSIX_MQ_PRIO_MAX = @as(c_int, 32);
pub const _POSIX_NAME_MAX = @as(c_int, 14);
pub const _POSIX_NGROUPS_MAX = @as(c_int, 8);
pub const _POSIX_OPEN_MAX = @as(c_int, 20);
pub const _POSIX_PATH_MAX = @as(c_int, 256);
pub const _POSIX_PIPE_BUF = @as(c_int, 512);
pub const _POSIX_RE_DUP_MAX = @as(c_int, 255);
pub const _POSIX_RTSIG_MAX = @as(c_int, 8);
pub const _POSIX_SEM_NSEMS_MAX = @as(c_int, 256);
pub const _POSIX_SEM_VALUE_MAX = @as(c_int, 32767);
pub const _POSIX_SIGQUEUE_MAX = @as(c_int, 32);
pub const _POSIX_SSIZE_MAX = @as(c_int, 32767);
pub const _POSIX_STREAM_MAX = @as(c_int, 8);
pub const _POSIX_SYMLINK_MAX = @as(c_int, 255);
pub const _POSIX_SYMLOOP_MAX = @as(c_int, 8);
pub const _POSIX_TIMER_MAX = @as(c_int, 32);
pub const _POSIX_TTY_NAME_MAX = @as(c_int, 9);
pub const _POSIX_TZNAME_MAX = @as(c_int, 6);
pub const _POSIX_CLOCKRES_MIN = __helpers.promoteIntLiteral(c_int, 20000000, .decimal);
pub const _LINUX_LIMITS_H = "";
pub const NGROUPS_MAX = __helpers.promoteIntLiteral(c_int, 65536, .decimal);
pub const MAX_CANON = @as(c_int, 255);
pub const MAX_INPUT = @as(c_int, 255);
pub const NAME_MAX = @as(c_int, 255);
pub const PATH_MAX = @as(c_int, 4096);
pub const PIPE_BUF = @as(c_int, 4096);
pub const XATTR_NAME_MAX = @as(c_int, 255);
pub const XATTR_SIZE_MAX = __helpers.promoteIntLiteral(c_int, 65536, .decimal);
pub const XATTR_LIST_MAX = __helpers.promoteIntLiteral(c_int, 65536, .decimal);
pub const RTSIG_MAX = @as(c_int, 32);
pub const _POSIX_THREAD_KEYS_MAX = @as(c_int, 128);
pub const PTHREAD_KEYS_MAX = @as(c_int, 1024);
pub const _POSIX_THREAD_DESTRUCTOR_ITERATIONS = @as(c_int, 4);
pub const PTHREAD_DESTRUCTOR_ITERATIONS = _POSIX_THREAD_DESTRUCTOR_ITERATIONS;
pub const _POSIX_THREAD_THREADS_MAX = @as(c_int, 64);
pub const AIO_PRIO_DELTA_MAX = @as(c_int, 20);
pub const PTHREAD_STACK_MIN = @as(c_int, 16384);
pub const DELAYTIMER_MAX = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const TTY_NAME_MAX = @as(c_int, 32);
pub const LOGIN_NAME_MAX = @as(c_int, 256);
pub const HOST_NAME_MAX = @as(c_int, 64);
pub const MQ_PRIO_MAX = __helpers.promoteIntLiteral(c_int, 32768, .decimal);
pub const SEM_VALUE_MAX = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const SSIZE_MAX = LONG_MAX;
pub const _BITS_POSIX2_LIM_H = @as(c_int, 1);
pub const _POSIX2_BC_BASE_MAX = @as(c_int, 99);
pub const _POSIX2_BC_DIM_MAX = @as(c_int, 2048);
pub const _POSIX2_BC_SCALE_MAX = @as(c_int, 99);
pub const _POSIX2_BC_STRING_MAX = @as(c_int, 1000);
pub const _POSIX2_COLL_WEIGHTS_MAX = @as(c_int, 2);
pub const _POSIX2_EXPR_NEST_MAX = @as(c_int, 32);
pub const _POSIX2_LINE_MAX = @as(c_int, 2048);
pub const _POSIX2_RE_DUP_MAX = @as(c_int, 255);
pub const _POSIX2_CHARCLASS_NAME_MAX = @as(c_int, 14);
pub const BC_BASE_MAX = _POSIX2_BC_BASE_MAX;
pub const BC_DIM_MAX = _POSIX2_BC_DIM_MAX;
pub const BC_SCALE_MAX = _POSIX2_BC_SCALE_MAX;
pub const BC_STRING_MAX = _POSIX2_BC_STRING_MAX;
pub const COLL_WEIGHTS_MAX = @as(c_int, 255);
pub const EXPR_NEST_MAX = _POSIX2_EXPR_NEST_MAX;
pub const LINE_MAX = _POSIX2_LINE_MAX;
pub const CHARCLASS_NAME_MAX = @as(c_int, 2048);
pub const RE_DUP_MAX = @as(c_int, 0x7fff);
pub const SCHAR_MAX = __SCHAR_MAX__;
pub const SHRT_MAX = __SHRT_MAX__;
pub const INT_MAX = __INT_MAX__;
pub const LONG_MAX = __LONG_MAX__;
pub const SCHAR_MIN = -__SCHAR_MAX__ - @as(c_int, 1);
pub const SHRT_MIN = -__SHRT_MAX__ - @as(c_int, 1);
pub const INT_MIN = -__INT_MAX__ - @as(c_int, 1);
pub const LONG_MIN = -__LONG_MAX__ - @as(c_long, 1);
pub const UCHAR_MAX = (__SCHAR_MAX__ * @as(c_int, 2)) + @as(c_int, 1);
pub const USHRT_MAX = (__SHRT_MAX__ * @as(c_int, 2)) + @as(c_int, 1);
pub const UINT_MAX = (__INT_MAX__ * @as(c_uint, 2)) + @as(c_uint, 1);
pub const ULONG_MAX = (__LONG_MAX__ * @as(c_ulong, 2)) + @as(c_ulong, 1);
pub const CHAR_BIT = __CHAR_BIT__;
pub const CHAR_MIN = SCHAR_MIN;
pub const CHAR_MAX = __SCHAR_MAX__;
pub const LLONG_MIN = -__LONG_LONG_MAX__ - @as(c_longlong, 1);
pub const LLONG_MAX = __LONG_LONG_MAX__;
pub const ULLONG_MAX = (__LONG_LONG_MAX__ * @as(c_ulonglong, 2)) + @as(c_ulonglong, 1);
pub const APR_HAVE_SHMEM_MMAP_TMP = @as(c_int, 1);
pub const APR_HAVE_SHMEM_MMAP_SHM = @as(c_int, 1);
pub const APR_HAVE_SHMEM_MMAP_ZERO = @as(c_int, 1);
pub const APR_HAVE_SHMEM_SHMGET_ANON = @as(c_int, 1);
pub const APR_HAVE_SHMEM_SHMGET = @as(c_int, 1);
pub const APR_HAVE_SHMEM_MMAP_ANON = @as(c_int, 1);
pub const APR_HAVE_SHMEM_BEOS = @as(c_int, 0);
pub const APR_USE_SHMEM_MMAP_TMP = @as(c_int, 0);
pub const APR_USE_SHMEM_MMAP_SHM = @as(c_int, 0);
pub const APR_USE_SHMEM_MMAP_ZERO = @as(c_int, 0);
pub const APR_USE_SHMEM_SHMGET_ANON = @as(c_int, 0);
pub const APR_USE_SHMEM_SHMGET = @as(c_int, 1);
pub const APR_USE_SHMEM_MMAP_ANON = @as(c_int, 1);
pub const APR_USE_SHMEM_BEOS = @as(c_int, 0);
pub const APR_USE_FLOCK_SERIALIZE = @as(c_int, 0);
pub const APR_USE_SYSVSEM_SERIALIZE = @as(c_int, 0);
pub const APR_USE_POSIXSEM_SERIALIZE = @as(c_int, 0);
pub const APR_USE_FCNTL_SERIALIZE = @as(c_int, 0);
pub const APR_USE_PROC_PTHREAD_SERIALIZE = @as(c_int, 1);
pub const APR_USE_PTHREAD_SERIALIZE = @as(c_int, 1);
pub const APR_HAS_FLOCK_SERIALIZE = @as(c_int, 1);
pub const APR_HAS_SYSVSEM_SERIALIZE = @as(c_int, 1);
pub const APR_HAS_POSIXSEM_SERIALIZE = @as(c_int, 1);
pub const APR_HAS_FCNTL_SERIALIZE = @as(c_int, 1);
pub const APR_HAS_PROC_PTHREAD_SERIALIZE = @as(c_int, 1);
pub const APR_PROCESS_LOCK_IS_GLOBAL = @as(c_int, 0);
pub const APR_HAVE_CORKABLE_TCP = @as(c_int, 1);
pub const APR_HAVE_GETRLIMIT = @as(c_int, 1);
pub const APR_HAVE_IN_ADDR = @as(c_int, 1);
pub const APR_HAVE_INET_ADDR = @as(c_int, 1);
pub const APR_HAVE_INET_NETWORK = @as(c_int, 1);
pub const APR_HAVE_IPV6 = @as(c_int, 1);
pub const APR_HAVE_SOCKADDR_UN = @as(c_int, 1);
pub const APR_HAVE_MEMMOVE = @as(c_int, 1);
pub const APR_HAVE_SETRLIMIT = @as(c_int, 1);
pub const APR_HAVE_SIGACTION = @as(c_int, 1);
pub const APR_HAVE_SIGSUSPEND = @as(c_int, 1);
pub const APR_HAVE_SIGWAIT = @as(c_int, 1);
pub const APR_HAVE_SA_STORAGE = @as(c_int, 1);
pub const APR_HAVE_STRCASECMP = @as(c_int, 1);
pub const APR_HAVE_STRDUP = @as(c_int, 1);
pub const APR_HAVE_STRICMP = @as(c_int, 0);
pub const APR_HAVE_STRNCASECMP = @as(c_int, 1);
pub const APR_HAVE_STRNICMP = @as(c_int, 0);
pub const APR_HAVE_STRSTR = @as(c_int, 1);
pub const APR_HAVE_MEMCHR = @as(c_int, 1);
pub const APR_HAVE_STRUCT_RLIMIT = @as(c_int, 1);
pub const APR_HAVE_UNION_SEMUN = @as(c_int, 0);
pub const APR_HAVE_SCTP = @as(c_int, 1);
pub const APR_HAVE_IOVEC = @as(c_int, 1);
pub const APR_HAS_SHARED_MEMORY = @as(c_int, 1);
pub const APR_HAS_THREADS = @as(c_int, 1);
pub const APR_HAS_SENDFILE = @as(c_int, 1);
pub const APR_HAS_MMAP = @as(c_int, 1);
pub const APR_HAS_FORK = @as(c_int, 1);
pub const APR_HAS_RANDOM = @as(c_int, 1);
pub const APR_HAS_OTHER_CHILD = @as(c_int, 1);
pub const APR_HAS_DSO = @as(c_int, 1);
pub const APR_HAS_SO_ACCEPTFILTER = @as(c_int, 0);
pub const APR_HAS_UNICODE_FS = @as(c_int, 0);
pub const APR_HAS_PROC_INVOKED = @as(c_int, 0);
pub const APR_HAS_USER = @as(c_int, 1);
pub const APR_HAS_LARGE_FILES = @as(c_int, 0);
pub const APR_HAS_XTHREAD_FILES = @as(c_int, 0);
pub const APR_HAS_OS_UUID = @as(c_int, 1);
pub const APR_HAS_TIMEDLOCKS = @as(c_int, 1);
pub const APR_PROCATTR_USER_SET_REQUIRES_PASSWORD = @as(c_int, 0);
pub const APR_FILES_AS_SOCKETS = @as(c_int, 1);
pub const APR_CHARSET_EBCDIC = @as(c_int, 0);
pub const APR_TCP_NOPUSH_FLAG = @compileError("unable to translate macro: undefined identifier `TCP_CORK`");
// /usr/include/apr-1.0/apr.h:316:9
pub const APR_TCP_NODELAY_INHERITED = @as(c_int, 1);
pub const APR_O_NONBLOCK_INHERITED = @as(c_int, 0);
pub const APR_SIZEOF_VOIDP = @as(c_int, 8);
pub inline fn APR_INT64_C(val: anytype) @TypeOf(INT64_C(val)) {
    _ = &val;
    return INT64_C(val);
}
pub inline fn APR_UINT64_C(val: anytype) @TypeOf(UINT64_C(val)) {
    _ = &val;
    return UINT64_C(val);
}
pub const APR_IS_BIGENDIAN = @as(c_int, 0);
pub const APR_INT16_MIN = INT16_MIN;
pub const APR_INT16_MAX = INT16_MAX;
pub const APR_UINT16_MAX = UINT16_MAX;
pub const APR_INT32_MIN = INT32_MIN;
pub const APR_INT32_MAX = INT32_MAX;
pub const APR_UINT32_MAX = UINT32_MAX;
pub const APR_INT64_MIN = INT64_MIN;
pub const APR_INT64_MAX = INT64_MAX;
pub const APR_UINT64_MAX = UINT64_MAX;
pub const APR_SIZE_MAX = ~__helpers.cast(apr_size_t, @as(c_int, 0));
pub const APR_BEGIN_DECLS = "";
pub const APR_END_DECLS = "";
pub const APR_THREAD_FUNC = "";
pub inline fn APR_DECLARE(@"type": anytype) @TypeOf(@"type") {
    _ = &@"type";
    return @"type";
}
pub inline fn APR_DECLARE_NONSTD(@"type": anytype) @TypeOf(@"type") {
    _ = &@"type";
    return @"type";
}
pub const APR_DECLARE_DATA = "";
pub const APR_SSIZE_T_FMT = "ld";
pub const APR_SIZE_T_FMT = "lu";
pub const APR_OFF_T_FMT = "ld";
pub const APR_PID_T_FMT = "d";
pub const APR_INT64_T_FMT = PRId64;
pub const APR_UINT64_T_FMT = PRIu64;
pub const APR_UINT64_T_HEX_FMT = PRIx64;
pub const APR_PROC_MUTEX_IS_GLOBAL = @as(c_int, 0);
pub const APR_EOL_STR = "\n";
pub const apr_wait_t = c_int;
pub const APR_PATH_MAX = PATH_MAX;
pub const APR_DSOPATH = "LD_LIBRARY_PATH";
pub const APR_POOLS_H = "";
pub const APR_ERRNO_H = "";
pub const _ERRNO_H = @as(c_int, 1);
pub const _BITS_ERRNO_H = @as(c_int, 1);
pub const _ASM_GENERIC_ERRNO_H = "";
pub const _ASM_GENERIC_ERRNO_BASE_H = "";
pub const EPERM = @as(c_int, 1);
pub const ENOENT = @as(c_int, 2);
pub const ESRCH = @as(c_int, 3);
pub const EINTR = @as(c_int, 4);
pub const EIO = @as(c_int, 5);
pub const ENXIO = @as(c_int, 6);
pub const E2BIG = @as(c_int, 7);
pub const ENOEXEC = @as(c_int, 8);
pub const EBADF = @as(c_int, 9);
pub const ECHILD = @as(c_int, 10);
pub const EAGAIN = @as(c_int, 11);
pub const ENOMEM = @as(c_int, 12);
pub const EACCES = @as(c_int, 13);
pub const EFAULT = @as(c_int, 14);
pub const ENOTBLK = @as(c_int, 15);
pub const EBUSY = @as(c_int, 16);
pub const EEXIST = @as(c_int, 17);
pub const EXDEV = @as(c_int, 18);
pub const ENODEV = @as(c_int, 19);
pub const ENOTDIR = @as(c_int, 20);
pub const EISDIR = @as(c_int, 21);
pub const EINVAL = @as(c_int, 22);
pub const ENFILE = @as(c_int, 23);
pub const EMFILE = @as(c_int, 24);
pub const ENOTTY = @as(c_int, 25);
pub const ETXTBSY = @as(c_int, 26);
pub const EFBIG = @as(c_int, 27);
pub const ENOSPC = @as(c_int, 28);
pub const ESPIPE = @as(c_int, 29);
pub const EROFS = @as(c_int, 30);
pub const EMLINK = @as(c_int, 31);
pub const EPIPE = @as(c_int, 32);
pub const EDOM = @as(c_int, 33);
pub const ERANGE = @as(c_int, 34);
pub const EDEADLK = @as(c_int, 35);
pub const ENAMETOOLONG = @as(c_int, 36);
pub const ENOLCK = @as(c_int, 37);
pub const ENOSYS = @as(c_int, 38);
pub const ENOTEMPTY = @as(c_int, 39);
pub const ELOOP = @as(c_int, 40);
pub const EWOULDBLOCK = EAGAIN;
pub const ENOMSG = @as(c_int, 42);
pub const EIDRM = @as(c_int, 43);
pub const ECHRNG = @as(c_int, 44);
pub const EL2NSYNC = @as(c_int, 45);
pub const EL3HLT = @as(c_int, 46);
pub const EL3RST = @as(c_int, 47);
pub const ELNRNG = @as(c_int, 48);
pub const EUNATCH = @as(c_int, 49);
pub const ENOCSI = @as(c_int, 50);
pub const EL2HLT = @as(c_int, 51);
pub const EBADE = @as(c_int, 52);
pub const EBADR = @as(c_int, 53);
pub const EXFULL = @as(c_int, 54);
pub const ENOANO = @as(c_int, 55);
pub const EBADRQC = @as(c_int, 56);
pub const EBADSLT = @as(c_int, 57);
pub const EDEADLOCK = EDEADLK;
pub const EBFONT = @as(c_int, 59);
pub const ENOSTR = @as(c_int, 60);
pub const ENODATA = @as(c_int, 61);
pub const ETIME = @as(c_int, 62);
pub const ENOSR = @as(c_int, 63);
pub const ENONET = @as(c_int, 64);
pub const ENOPKG = @as(c_int, 65);
pub const EREMOTE = @as(c_int, 66);
pub const ENOLINK = @as(c_int, 67);
pub const EADV = @as(c_int, 68);
pub const ESRMNT = @as(c_int, 69);
pub const ECOMM = @as(c_int, 70);
pub const EPROTO = @as(c_int, 71);
pub const EMULTIHOP = @as(c_int, 72);
pub const EDOTDOT = @as(c_int, 73);
pub const EBADMSG = @as(c_int, 74);
pub const EOVERFLOW = @as(c_int, 75);
pub const ENOTUNIQ = @as(c_int, 76);
pub const EBADFD = @as(c_int, 77);
pub const EREMCHG = @as(c_int, 78);
pub const ELIBACC = @as(c_int, 79);
pub const ELIBBAD = @as(c_int, 80);
pub const ELIBSCN = @as(c_int, 81);
pub const ELIBMAX = @as(c_int, 82);
pub const ELIBEXEC = @as(c_int, 83);
pub const EILSEQ = @as(c_int, 84);
pub const ERESTART = @as(c_int, 85);
pub const ESTRPIPE = @as(c_int, 86);
pub const EUSERS = @as(c_int, 87);
pub const ENOTSOCK = @as(c_int, 88);
pub const EDESTADDRREQ = @as(c_int, 89);
pub const EMSGSIZE = @as(c_int, 90);
pub const EPROTOTYPE = @as(c_int, 91);
pub const ENOPROTOOPT = @as(c_int, 92);
pub const EPROTONOSUPPORT = @as(c_int, 93);
pub const ESOCKTNOSUPPORT = @as(c_int, 94);
pub const EOPNOTSUPP = @as(c_int, 95);
pub const EPFNOSUPPORT = @as(c_int, 96);
pub const EAFNOSUPPORT = @as(c_int, 97);
pub const EADDRINUSE = @as(c_int, 98);
pub const EADDRNOTAVAIL = @as(c_int, 99);
pub const ENETDOWN = @as(c_int, 100);
pub const ENETUNREACH = @as(c_int, 101);
pub const ENETRESET = @as(c_int, 102);
pub const ECONNABORTED = @as(c_int, 103);
pub const ECONNRESET = @as(c_int, 104);
pub const ENOBUFS = @as(c_int, 105);
pub const EISCONN = @as(c_int, 106);
pub const ENOTCONN = @as(c_int, 107);
pub const ESHUTDOWN = @as(c_int, 108);
pub const ETOOMANYREFS = @as(c_int, 109);
pub const ETIMEDOUT = @as(c_int, 110);
pub const ECONNREFUSED = @as(c_int, 111);
pub const EHOSTDOWN = @as(c_int, 112);
pub const EHOSTUNREACH = @as(c_int, 113);
pub const EALREADY = @as(c_int, 114);
pub const EINPROGRESS = @as(c_int, 115);
pub const ESTALE = @as(c_int, 116);
pub const EUCLEAN = @as(c_int, 117);
pub const ENOTNAM = @as(c_int, 118);
pub const ENAVAIL = @as(c_int, 119);
pub const EISNAM = @as(c_int, 120);
pub const EREMOTEIO = @as(c_int, 121);
pub const EDQUOT = @as(c_int, 122);
pub const ENOMEDIUM = @as(c_int, 123);
pub const EMEDIUMTYPE = @as(c_int, 124);
pub const ECANCELED = @as(c_int, 125);
pub const ENOKEY = @as(c_int, 126);
pub const EKEYEXPIRED = @as(c_int, 127);
pub const EKEYREVOKED = @as(c_int, 128);
pub const EKEYREJECTED = @as(c_int, 129);
pub const EOWNERDEAD = @as(c_int, 130);
pub const ENOTRECOVERABLE = @as(c_int, 131);
pub const ERFKILL = @as(c_int, 132);
pub const EHWPOISON = @as(c_int, 133);
pub const ENOTSUP = EOPNOTSUPP;
pub const errno = __errno_location().*;
pub const APR_OS_START_ERROR = @as(c_int, 20000);
pub const APR_OS_ERRSPACE_SIZE = __helpers.promoteIntLiteral(c_int, 50000, .decimal);
pub const APR_UTIL_ERRSPACE_SIZE = @as(c_int, 20000);
pub const APR_OS_START_STATUS = APR_OS_START_ERROR + APR_OS_ERRSPACE_SIZE;
pub const APR_UTIL_START_STATUS = APR_OS_START_STATUS + (APR_OS_ERRSPACE_SIZE - APR_UTIL_ERRSPACE_SIZE);
pub const APR_OS_START_USERERR = APR_OS_START_STATUS + APR_OS_ERRSPACE_SIZE;
pub const APR_OS_START_USEERR = APR_OS_START_USERERR;
pub const APR_OS_START_CANONERR = APR_OS_START_USERERR + (APR_OS_ERRSPACE_SIZE * @as(c_int, 10));
pub const APR_OS_START_EAIERR = APR_OS_START_CANONERR + APR_OS_ERRSPACE_SIZE;
pub const APR_OS_START_SYSERR = APR_OS_START_EAIERR + APR_OS_ERRSPACE_SIZE;
pub const APR_SUCCESS = @as(c_int, 0);
pub const APR_ENOSTAT = APR_OS_START_ERROR + @as(c_int, 1);
pub const APR_ENOPOOL = APR_OS_START_ERROR + @as(c_int, 2);
pub const APR_EBADDATE = APR_OS_START_ERROR + @as(c_int, 4);
pub const APR_EINVALSOCK = APR_OS_START_ERROR + @as(c_int, 5);
pub const APR_ENOPROC = APR_OS_START_ERROR + @as(c_int, 6);
pub const APR_ENOTIME = APR_OS_START_ERROR + @as(c_int, 7);
pub const APR_ENODIR = APR_OS_START_ERROR + @as(c_int, 8);
pub const APR_ENOLOCK = APR_OS_START_ERROR + @as(c_int, 9);
pub const APR_ENOPOLL = APR_OS_START_ERROR + @as(c_int, 10);
pub const APR_ENOSOCKET = APR_OS_START_ERROR + @as(c_int, 11);
pub const APR_ENOTHREAD = APR_OS_START_ERROR + @as(c_int, 12);
pub const APR_ENOTHDKEY = APR_OS_START_ERROR + @as(c_int, 13);
pub const APR_EGENERAL = APR_OS_START_ERROR + @as(c_int, 14);
pub const APR_ENOSHMAVAIL = APR_OS_START_ERROR + @as(c_int, 15);
pub const APR_EBADIP = APR_OS_START_ERROR + @as(c_int, 16);
pub const APR_EBADMASK = APR_OS_START_ERROR + @as(c_int, 17);
pub const APR_EDSOOPEN = APR_OS_START_ERROR + @as(c_int, 19);
pub const APR_EABSOLUTE = APR_OS_START_ERROR + @as(c_int, 20);
pub const APR_ERELATIVE = APR_OS_START_ERROR + @as(c_int, 21);
pub const APR_EINCOMPLETE = APR_OS_START_ERROR + @as(c_int, 22);
pub const APR_EABOVEROOT = APR_OS_START_ERROR + @as(c_int, 23);
pub const APR_EBADPATH = APR_OS_START_ERROR + @as(c_int, 24);
pub const APR_EPATHWILD = APR_OS_START_ERROR + @as(c_int, 25);
pub const APR_ESYMNOTFOUND = APR_OS_START_ERROR + @as(c_int, 26);
pub const APR_EPROC_UNKNOWN = APR_OS_START_ERROR + @as(c_int, 27);
pub const APR_ENOTENOUGHENTROPY = APR_OS_START_ERROR + @as(c_int, 28);
pub inline fn APR_STATUS_IS_ENOSTAT(s: anytype) @TypeOf(s == APR_ENOSTAT) {
    _ = &s;
    return s == APR_ENOSTAT;
}
pub inline fn APR_STATUS_IS_ENOPOOL(s: anytype) @TypeOf(s == APR_ENOPOOL) {
    _ = &s;
    return s == APR_ENOPOOL;
}
pub inline fn APR_STATUS_IS_EBADDATE(s: anytype) @TypeOf(s == APR_EBADDATE) {
    _ = &s;
    return s == APR_EBADDATE;
}
pub inline fn APR_STATUS_IS_EINVALSOCK(s: anytype) @TypeOf(s == APR_EINVALSOCK) {
    _ = &s;
    return s == APR_EINVALSOCK;
}
pub inline fn APR_STATUS_IS_ENOPROC(s: anytype) @TypeOf(s == APR_ENOPROC) {
    _ = &s;
    return s == APR_ENOPROC;
}
pub inline fn APR_STATUS_IS_ENOTIME(s: anytype) @TypeOf(s == APR_ENOTIME) {
    _ = &s;
    return s == APR_ENOTIME;
}
pub inline fn APR_STATUS_IS_ENODIR(s: anytype) @TypeOf(s == APR_ENODIR) {
    _ = &s;
    return s == APR_ENODIR;
}
pub inline fn APR_STATUS_IS_ENOLOCK(s: anytype) @TypeOf(s == APR_ENOLOCK) {
    _ = &s;
    return s == APR_ENOLOCK;
}
pub inline fn APR_STATUS_IS_ENOPOLL(s: anytype) @TypeOf(s == APR_ENOPOLL) {
    _ = &s;
    return s == APR_ENOPOLL;
}
pub inline fn APR_STATUS_IS_ENOSOCKET(s: anytype) @TypeOf(s == APR_ENOSOCKET) {
    _ = &s;
    return s == APR_ENOSOCKET;
}
pub inline fn APR_STATUS_IS_ENOTHREAD(s: anytype) @TypeOf(s == APR_ENOTHREAD) {
    _ = &s;
    return s == APR_ENOTHREAD;
}
pub inline fn APR_STATUS_IS_ENOTHDKEY(s: anytype) @TypeOf(s == APR_ENOTHDKEY) {
    _ = &s;
    return s == APR_ENOTHDKEY;
}
pub inline fn APR_STATUS_IS_EGENERAL(s: anytype) @TypeOf(s == APR_EGENERAL) {
    _ = &s;
    return s == APR_EGENERAL;
}
pub inline fn APR_STATUS_IS_ENOSHMAVAIL(s: anytype) @TypeOf(s == APR_ENOSHMAVAIL) {
    _ = &s;
    return s == APR_ENOSHMAVAIL;
}
pub inline fn APR_STATUS_IS_EBADIP(s: anytype) @TypeOf(s == APR_EBADIP) {
    _ = &s;
    return s == APR_EBADIP;
}
pub inline fn APR_STATUS_IS_EBADMASK(s: anytype) @TypeOf(s == APR_EBADMASK) {
    _ = &s;
    return s == APR_EBADMASK;
}
pub inline fn APR_STATUS_IS_EDSOOPEN(s: anytype) @TypeOf(s == APR_EDSOOPEN) {
    _ = &s;
    return s == APR_EDSOOPEN;
}
pub inline fn APR_STATUS_IS_EABSOLUTE(s: anytype) @TypeOf(s == APR_EABSOLUTE) {
    _ = &s;
    return s == APR_EABSOLUTE;
}
pub inline fn APR_STATUS_IS_ERELATIVE(s: anytype) @TypeOf(s == APR_ERELATIVE) {
    _ = &s;
    return s == APR_ERELATIVE;
}
pub inline fn APR_STATUS_IS_EINCOMPLETE(s: anytype) @TypeOf(s == APR_EINCOMPLETE) {
    _ = &s;
    return s == APR_EINCOMPLETE;
}
pub inline fn APR_STATUS_IS_EABOVEROOT(s: anytype) @TypeOf(s == APR_EABOVEROOT) {
    _ = &s;
    return s == APR_EABOVEROOT;
}
pub inline fn APR_STATUS_IS_EBADPATH(s: anytype) @TypeOf(s == APR_EBADPATH) {
    _ = &s;
    return s == APR_EBADPATH;
}
pub inline fn APR_STATUS_IS_EPATHWILD(s: anytype) @TypeOf(s == APR_EPATHWILD) {
    _ = &s;
    return s == APR_EPATHWILD;
}
pub inline fn APR_STATUS_IS_ESYMNOTFOUND(s: anytype) @TypeOf(s == APR_ESYMNOTFOUND) {
    _ = &s;
    return s == APR_ESYMNOTFOUND;
}
pub inline fn APR_STATUS_IS_EPROC_UNKNOWN(s: anytype) @TypeOf(s == APR_EPROC_UNKNOWN) {
    _ = &s;
    return s == APR_EPROC_UNKNOWN;
}
pub inline fn APR_STATUS_IS_ENOTENOUGHENTROPY(s: anytype) @TypeOf(s == APR_ENOTENOUGHENTROPY) {
    _ = &s;
    return s == APR_ENOTENOUGHENTROPY;
}
pub const APR_INCHILD = APR_OS_START_STATUS + @as(c_int, 1);
pub const APR_INPARENT = APR_OS_START_STATUS + @as(c_int, 2);
pub const APR_DETACH = APR_OS_START_STATUS + @as(c_int, 3);
pub const APR_NOTDETACH = APR_OS_START_STATUS + @as(c_int, 4);
pub const APR_CHILD_DONE = APR_OS_START_STATUS + @as(c_int, 5);
pub const APR_CHILD_NOTDONE = APR_OS_START_STATUS + @as(c_int, 6);
pub const APR_TIMEUP = APR_OS_START_STATUS + @as(c_int, 7);
pub const APR_INCOMPLETE = APR_OS_START_STATUS + @as(c_int, 8);
pub const APR_BADCH = APR_OS_START_STATUS + @as(c_int, 12);
pub const APR_BADARG = APR_OS_START_STATUS + @as(c_int, 13);
pub const APR_EOF = APR_OS_START_STATUS + @as(c_int, 14);
pub const APR_NOTFOUND = APR_OS_START_STATUS + @as(c_int, 15);
pub const APR_ANONYMOUS = APR_OS_START_STATUS + @as(c_int, 19);
pub const APR_FILEBASED = APR_OS_START_STATUS + @as(c_int, 20);
pub const APR_KEYBASED = APR_OS_START_STATUS + @as(c_int, 21);
pub const APR_EINIT = APR_OS_START_STATUS + @as(c_int, 22);
pub const APR_ENOTIMPL = APR_OS_START_STATUS + @as(c_int, 23);
pub const APR_EMISMATCH = APR_OS_START_STATUS + @as(c_int, 24);
pub const APR_EBUSY = APR_OS_START_STATUS + @as(c_int, 25);
pub inline fn APR_STATUS_IS_INCHILD(s: anytype) @TypeOf(s == APR_INCHILD) {
    _ = &s;
    return s == APR_INCHILD;
}
pub inline fn APR_STATUS_IS_INPARENT(s: anytype) @TypeOf(s == APR_INPARENT) {
    _ = &s;
    return s == APR_INPARENT;
}
pub inline fn APR_STATUS_IS_DETACH(s: anytype) @TypeOf(s == APR_DETACH) {
    _ = &s;
    return s == APR_DETACH;
}
pub inline fn APR_STATUS_IS_NOTDETACH(s: anytype) @TypeOf(s == APR_NOTDETACH) {
    _ = &s;
    return s == APR_NOTDETACH;
}
pub inline fn APR_STATUS_IS_CHILD_DONE(s: anytype) @TypeOf(s == APR_CHILD_DONE) {
    _ = &s;
    return s == APR_CHILD_DONE;
}
pub inline fn APR_STATUS_IS_CHILD_NOTDONE(s: anytype) @TypeOf(s == APR_CHILD_NOTDONE) {
    _ = &s;
    return s == APR_CHILD_NOTDONE;
}
pub inline fn APR_STATUS_IS_TIMEUP(s: anytype) @TypeOf(s == APR_TIMEUP) {
    _ = &s;
    return s == APR_TIMEUP;
}
pub inline fn APR_STATUS_IS_INCOMPLETE(s: anytype) @TypeOf(s == APR_INCOMPLETE) {
    _ = &s;
    return s == APR_INCOMPLETE;
}
pub inline fn APR_STATUS_IS_BADCH(s: anytype) @TypeOf(s == APR_BADCH) {
    _ = &s;
    return s == APR_BADCH;
}
pub inline fn APR_STATUS_IS_BADARG(s: anytype) @TypeOf(s == APR_BADARG) {
    _ = &s;
    return s == APR_BADARG;
}
pub inline fn APR_STATUS_IS_EOF(s: anytype) @TypeOf(s == APR_EOF) {
    _ = &s;
    return s == APR_EOF;
}
pub inline fn APR_STATUS_IS_NOTFOUND(s: anytype) @TypeOf(s == APR_NOTFOUND) {
    _ = &s;
    return s == APR_NOTFOUND;
}
pub inline fn APR_STATUS_IS_ANONYMOUS(s: anytype) @TypeOf(s == APR_ANONYMOUS) {
    _ = &s;
    return s == APR_ANONYMOUS;
}
pub inline fn APR_STATUS_IS_FILEBASED(s: anytype) @TypeOf(s == APR_FILEBASED) {
    _ = &s;
    return s == APR_FILEBASED;
}
pub inline fn APR_STATUS_IS_KEYBASED(s: anytype) @TypeOf(s == APR_KEYBASED) {
    _ = &s;
    return s == APR_KEYBASED;
}
pub inline fn APR_STATUS_IS_EINIT(s: anytype) @TypeOf(s == APR_EINIT) {
    _ = &s;
    return s == APR_EINIT;
}
pub inline fn APR_STATUS_IS_ENOTIMPL(s: anytype) @TypeOf(s == APR_ENOTIMPL) {
    _ = &s;
    return s == APR_ENOTIMPL;
}
pub inline fn APR_STATUS_IS_EMISMATCH(s: anytype) @TypeOf(s == APR_EMISMATCH) {
    _ = &s;
    return s == APR_EMISMATCH;
}
pub inline fn APR_STATUS_IS_EBUSY(s: anytype) @TypeOf(s == APR_EBUSY) {
    _ = &s;
    return s == APR_EBUSY;
}
pub const APR_EACCES = EACCES;
pub const APR_EEXIST = EEXIST;
pub const APR_ENAMETOOLONG = ENAMETOOLONG;
pub const APR_ENOENT = ENOENT;
pub const APR_ENOTDIR = ENOTDIR;
pub const APR_ENOSPC = ENOSPC;
pub const APR_ENOMEM = ENOMEM;
pub const APR_EMFILE = EMFILE;
pub const APR_ENFILE = ENFILE;
pub const APR_EBADF = EBADF;
pub const APR_EINVAL = EINVAL;
pub const APR_ESPIPE = ESPIPE;
pub const APR_EAGAIN = EAGAIN;
pub const APR_EINTR = EINTR;
pub const APR_ENOTSOCK = ENOTSOCK;
pub const APR_ECONNREFUSED = ECONNREFUSED;
pub const APR_EINPROGRESS = EINPROGRESS;
pub const APR_ECONNABORTED = ECONNABORTED;
pub const APR_ECONNRESET = ECONNRESET;
pub const APR_ETIMEDOUT = ETIMEDOUT;
pub const APR_EHOSTUNREACH = EHOSTUNREACH;
pub const APR_ENETUNREACH = ENETUNREACH;
pub const APR_EFTYPE = APR_OS_START_CANONERR + @as(c_int, 23);
pub const APR_EPIPE = EPIPE;
pub const APR_EXDEV = EXDEV;
pub const APR_ENOTEMPTY = ENOTEMPTY;
pub const APR_EAFNOSUPPORT = EAFNOSUPPORT;
pub const APR_EOPNOTSUPP = EOPNOTSUPP;
pub const APR_ERANGE = ERANGE;
pub inline fn APR_FROM_OS_ERROR(e: anytype) @TypeOf(e) {
    _ = &e;
    return e;
}
pub inline fn APR_TO_OS_ERROR(e: anytype) @TypeOf(e) {
    _ = &e;
    return e;
}
pub inline fn apr_get_os_error() @TypeOf(errno) {
    return errno;
}
pub const apr_set_os_error = @compileError("unable to translate C expr: expected ')' instead got '='");
// /usr/include/apr-1.0/apr_errno.h:1218:9
pub inline fn apr_get_netos_error() @TypeOf(errno) {
    return errno;
}
pub const apr_set_netos_error = @compileError("unable to translate C expr: expected ')' instead got '='");
// /usr/include/apr-1.0/apr_errno.h:1223:9
pub inline fn APR_STATUS_IS_EACCES(s: anytype) @TypeOf(s == APR_EACCES) {
    _ = &s;
    return s == APR_EACCES;
}
pub inline fn APR_STATUS_IS_EEXIST(s: anytype) @TypeOf(s == APR_EEXIST) {
    _ = &s;
    return s == APR_EEXIST;
}
pub inline fn APR_STATUS_IS_ENAMETOOLONG(s: anytype) @TypeOf(s == APR_ENAMETOOLONG) {
    _ = &s;
    return s == APR_ENAMETOOLONG;
}
pub inline fn APR_STATUS_IS_ENOENT(s: anytype) @TypeOf(s == APR_ENOENT) {
    _ = &s;
    return s == APR_ENOENT;
}
pub inline fn APR_STATUS_IS_ENOTDIR(s: anytype) @TypeOf(s == APR_ENOTDIR) {
    _ = &s;
    return s == APR_ENOTDIR;
}
pub inline fn APR_STATUS_IS_ENOSPC(s: anytype) @TypeOf((s == APR_ENOSPC) or (s == EDQUOT)) {
    _ = &s;
    return (s == APR_ENOSPC) or (s == EDQUOT);
}
pub inline fn APR_STATUS_IS_ENOMEM(s: anytype) @TypeOf(s == APR_ENOMEM) {
    _ = &s;
    return s == APR_ENOMEM;
}
pub inline fn APR_STATUS_IS_EMFILE(s: anytype) @TypeOf(s == APR_EMFILE) {
    _ = &s;
    return s == APR_EMFILE;
}
pub inline fn APR_STATUS_IS_ENFILE(s: anytype) @TypeOf(s == APR_ENFILE) {
    _ = &s;
    return s == APR_ENFILE;
}
pub inline fn APR_STATUS_IS_EBADF(s: anytype) @TypeOf(s == APR_EBADF) {
    _ = &s;
    return s == APR_EBADF;
}
pub inline fn APR_STATUS_IS_EINVAL(s: anytype) @TypeOf(s == APR_EINVAL) {
    _ = &s;
    return s == APR_EINVAL;
}
pub inline fn APR_STATUS_IS_ESPIPE(s: anytype) @TypeOf(s == APR_ESPIPE) {
    _ = &s;
    return s == APR_ESPIPE;
}
pub inline fn APR_STATUS_IS_EAGAIN(s: anytype) @TypeOf(s == APR_EAGAIN) {
    _ = &s;
    return s == APR_EAGAIN;
}
pub inline fn APR_STATUS_IS_EINTR(s: anytype) @TypeOf(s == APR_EINTR) {
    _ = &s;
    return s == APR_EINTR;
}
pub inline fn APR_STATUS_IS_ENOTSOCK(s: anytype) @TypeOf(s == APR_ENOTSOCK) {
    _ = &s;
    return s == APR_ENOTSOCK;
}
pub inline fn APR_STATUS_IS_ECONNREFUSED(s: anytype) @TypeOf(s == APR_ECONNREFUSED) {
    _ = &s;
    return s == APR_ECONNREFUSED;
}
pub inline fn APR_STATUS_IS_EINPROGRESS(s: anytype) @TypeOf(s == APR_EINPROGRESS) {
    _ = &s;
    return s == APR_EINPROGRESS;
}
pub inline fn APR_STATUS_IS_ECONNABORTED(s: anytype) @TypeOf((s == APR_ECONNABORTED) or (s == EPROTO)) {
    _ = &s;
    return (s == APR_ECONNABORTED) or (s == EPROTO);
}
pub inline fn APR_STATUS_IS_ECONNRESET(s: anytype) @TypeOf(s == APR_ECONNRESET) {
    _ = &s;
    return s == APR_ECONNRESET;
}
pub inline fn APR_STATUS_IS_ETIMEDOUT(s: anytype) @TypeOf(s == APR_ETIMEDOUT) {
    _ = &s;
    return s == APR_ETIMEDOUT;
}
pub inline fn APR_STATUS_IS_EHOSTUNREACH(s: anytype) @TypeOf(s == APR_EHOSTUNREACH) {
    _ = &s;
    return s == APR_EHOSTUNREACH;
}
pub inline fn APR_STATUS_IS_ENETUNREACH(s: anytype) @TypeOf(s == APR_ENETUNREACH) {
    _ = &s;
    return s == APR_ENETUNREACH;
}
pub inline fn APR_STATUS_IS_EFTYPE(s: anytype) @TypeOf(s == APR_EFTYPE) {
    _ = &s;
    return s == APR_EFTYPE;
}
pub inline fn APR_STATUS_IS_EPIPE(s: anytype) @TypeOf(s == APR_EPIPE) {
    _ = &s;
    return s == APR_EPIPE;
}
pub inline fn APR_STATUS_IS_EXDEV(s: anytype) @TypeOf(s == APR_EXDEV) {
    _ = &s;
    return s == APR_EXDEV;
}
pub inline fn APR_STATUS_IS_ENOTEMPTY(s: anytype) @TypeOf((s == APR_ENOTEMPTY) or (s == APR_EEXIST)) {
    _ = &s;
    return (s == APR_ENOTEMPTY) or (s == APR_EEXIST);
}
pub inline fn APR_STATUS_IS_EAFNOSUPPORT(s: anytype) @TypeOf(s == APR_EAFNOSUPPORT) {
    _ = &s;
    return s == APR_EAFNOSUPPORT;
}
pub inline fn APR_STATUS_IS_EOPNOTSUPP(s: anytype) @TypeOf(s == APR_EOPNOTSUPP) {
    _ = &s;
    return s == APR_EOPNOTSUPP;
}
pub inline fn APR_STATUS_IS_ERANGE(s: anytype) @TypeOf(s == APR_ERANGE) {
    _ = &s;
    return s == APR_ERANGE;
}
pub const APR_GENERAL_H = "";
pub const FALSE = @as(c_int, 0);
pub const TRUE = !(FALSE != 0);
pub const APR_ASCII_BLANK = '\x20';
pub const APR_ASCII_CR = '\x0d';
pub const APR_ASCII_LF = '\x0a';
pub const APR_ASCII_TAB = '\x09';
pub inline fn APR_OFFSET(p_type: anytype, field: anytype) c_long {
    _ = &p_type;
    _ = &field;
    return __helpers.cast(c_long, __helpers.cast([*c]u8, &@field(p_type ++ NULL, field)) - __helpers.cast([*c]u8, NULL));
}
pub inline fn APR_OFFSETOF(s_type: anytype, field: anytype) @TypeOf(offsetof(s_type, field)) {
    _ = &s_type;
    _ = &field;
    return offsetof(s_type, field);
}
pub inline fn APR_ALIGN(size: anytype, boundary: anytype) @TypeOf((size + (boundary - @as(c_int, 1))) & ~(boundary - @as(c_int, 1))) {
    _ = &size;
    _ = &boundary;
    return (size + (boundary - @as(c_int, 1))) & ~(boundary - @as(c_int, 1));
}
pub inline fn APR_ALIGN_DEFAULT(size: anytype) @TypeOf(APR_ALIGN(size, @as(c_int, 8))) {
    _ = &size;
    return APR_ALIGN(size, @as(c_int, 8));
}
pub inline fn APR_STRINGIFY(n: anytype) @TypeOf(APR_STRINGIFY_HELPER(n)) {
    _ = &n;
    return APR_STRINGIFY_HELPER(n);
}
pub const APR_STRINGIFY_HELPER = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/apr-1.0/apr_general.h:152:9
pub const _STRING_H = @as(c_int, 1);
pub const __need_NULL = "";
pub const _BITS_TYPES_LOCALE_T_H = @as(c_int, 1);
pub const _BITS_TYPES___LOCALE_T_H = @as(c_int, 1);
pub const _STRINGS_H = @as(c_int, 1);
pub const APR_POOL_DECLARE_ACCESSOR = @compileError("unable to translate macro: undefined identifier `apr_`");
// /usr/include/apr-1.0/apr_pools.h:81:9
pub const APR_POOL_IMPLEMENT_ACCESSOR = @compileError("unable to translate macro: undefined identifier `apr_`");
// /usr/include/apr-1.0/apr_pools.h:91:9
pub const APR_POOL_DEBUG = @as(c_int, 0);
pub const APR_POOL__FILE_LINE__ = @compileError("unable to translate macro: undefined identifier `__FILE__`");
// /usr/include/apr-1.0/apr_pools.h:143:9
pub const APR_ALLOCATOR_H = "";
pub const APR_MEMNODE_T_SIZE = APR_ALIGN_DEFAULT(__helpers.sizeof(apr_memnode_t));
pub const APR_ALLOCATOR_MAX_FREE_UNLIMITED = @as(c_int, 0);
pub const APR_THREAD_MUTEX_H = "";
pub const APR_THREAD_MUTEX_DEFAULT = @as(c_int, 0x0);
pub const APR_THREAD_MUTEX_NESTED = @as(c_int, 0x1);
pub const APR_THREAD_MUTEX_UNNESTED = @as(c_int, 0x2);
pub const APR_THREAD_MUTEX_TIMED = @as(c_int, 0x4);
pub const APR_TIME_H = "";
pub inline fn APR_TIME_C(val: anytype) @TypeOf(APR_INT64_C(val)) {
    _ = &val;
    return APR_INT64_C(val);
}
pub const APR_TIME_T_FMT = APR_INT64_T_FMT;
pub const APR_USEC_PER_SEC = APR_TIME_C(__helpers.promoteIntLiteral(c_int, 1000000, .decimal));
pub inline fn apr_time_sec(time: anytype) @TypeOf(__helpers.div(time, APR_USEC_PER_SEC)) {
    _ = &time;
    return __helpers.div(time, APR_USEC_PER_SEC);
}
pub inline fn apr_time_usec(time: anytype) @TypeOf(__helpers.rem(time, APR_USEC_PER_SEC)) {
    _ = &time;
    return __helpers.rem(time, APR_USEC_PER_SEC);
}
pub inline fn apr_time_msec(time: anytype) @TypeOf(__helpers.rem(__helpers.div(time, @as(c_int, 1000)), @as(c_int, 1000))) {
    _ = &time;
    return __helpers.rem(__helpers.div(time, @as(c_int, 1000)), @as(c_int, 1000));
}
pub inline fn apr_time_as_msec(time: anytype) @TypeOf(__helpers.div(time, @as(c_int, 1000))) {
    _ = &time;
    return __helpers.div(time, @as(c_int, 1000));
}
pub inline fn apr_time_from_msec(msec: anytype) @TypeOf(__helpers.cast(apr_time_t, msec) * @as(c_int, 1000)) {
    _ = &msec;
    return __helpers.cast(apr_time_t, msec) * @as(c_int, 1000);
}
pub inline fn apr_time_from_sec(sec: anytype) @TypeOf(__helpers.cast(apr_time_t, sec) * APR_USEC_PER_SEC) {
    _ = &sec;
    return __helpers.cast(apr_time_t, sec) * APR_USEC_PER_SEC;
}
pub inline fn apr_time_make(sec: anytype, usec: anytype) @TypeOf((__helpers.cast(apr_time_t, sec) * APR_USEC_PER_SEC) + __helpers.cast(apr_time_t, usec)) {
    _ = &sec;
    _ = &usec;
    return (__helpers.cast(apr_time_t, sec) * APR_USEC_PER_SEC) + __helpers.cast(apr_time_t, usec);
}
pub const APR_RFC822_DATE_LEN = @as(c_int, 30);
pub const APR_CTIME_LEN = @as(c_int, 25);
pub inline fn apr_pool_create(newpool: anytype, parent: anytype) @TypeOf(apr_pool_create_ex(newpool, parent, NULL, NULL)) {
    _ = &newpool;
    _ = &parent;
    return apr_pool_create_ex(newpool, parent, NULL, NULL);
}
pub inline fn apr_pool_create_core(newpool: anytype) @TypeOf(apr_pool_create_unmanaged_ex(newpool, NULL, NULL)) {
    _ = &newpool;
    return apr_pool_create_unmanaged_ex(newpool, NULL, NULL);
}
pub inline fn apr_pool_create_unmanaged(newpool: anytype) @TypeOf(apr_pool_create_unmanaged_ex(newpool, NULL, NULL)) {
    _ = &newpool;
    return apr_pool_create_unmanaged_ex(newpool, NULL, NULL);
}
pub inline fn apr_pcalloc(p: anytype, size: anytype) @TypeOf(memset(apr_palloc(p, size), @as(c_int, 0), size)) {
    _ = &p;
    _ = &size;
    return memset(apr_palloc(p, size), @as(c_int, 0), size);
}
pub inline fn apr_pool_join(a: anytype, b: anytype) void {
    _ = &a;
    _ = &b;
    return;
}
pub inline fn apr_pool_lock(pool: anytype, lock: anytype) void {
    _ = &pool;
    _ = &lock;
    return;
}
pub const APR_HASH_H = "";
pub const APR_HASH_KEY_STRING = -@as(c_int, 1);
pub const APR_TABLES_H = "";
pub const __STDC_VERSION_STDARG_H__ = @as(c_int, 0);
pub const va_start = @compileError("unable to translate macro: undefined identifier `__builtin_va_start`");
// /home/user/tools/zig-0.17.0/lib/compiler/aro/include/stdarg.h:12:9
pub const va_end = @compileError("unable to translate macro: undefined identifier `__builtin_va_end`");
// /home/user/tools/zig-0.17.0/lib/compiler/aro/include/stdarg.h:14:9
pub const va_arg = @compileError("unable to translate macro: undefined identifier `__builtin_va_arg`");
// /home/user/tools/zig-0.17.0/lib/compiler/aro/include/stdarg.h:15:9
pub const __va_copy = @compileError("unable to translate macro: undefined identifier `__builtin_va_copy`");
// /home/user/tools/zig-0.17.0/lib/compiler/aro/include/stdarg.h:18:9
pub const va_copy = @compileError("unable to translate macro: undefined identifier `__builtin_va_copy`");
// /home/user/tools/zig-0.17.0/lib/compiler/aro/include/stdarg.h:22:9
pub const __GNUC_VA_LIST = @as(c_int, 1);
pub inline fn APR_ARRAY_IDX(ary: anytype, i: anytype, @"type": anytype) @TypeOf([*c]@"type"(ary).*.elts[@as(usize, @intCast(i))]) {
    _ = &ary;
    _ = &i;
    _ = &@"type";
    return [*c]@"type"(ary).*.elts[@as(usize, @intCast(i))];
}
pub inline fn APR_ARRAY_PUSH(ary: anytype, @"type": anytype) @TypeOf(([*c]@"type" ++ apr_array_push(ary)).*) {
    _ = &ary;
    _ = &@"type";
    return ([*c]@"type" ++ apr_array_push(ary)).*;
}
pub const APR_OVERLAP_TABLES_SET = @as(c_int, 0);
pub const APR_OVERLAP_TABLES_MERGE = @as(c_int, 1);
pub const APR_OVERLAP_TABLES_ADD = @as(c_int, 2);
pub const APR_STRINGS_H = "";
pub const _SYS_UIO_H = @as(c_int, 1);
pub const _BITS_UIO_LIM_H = @as(c_int, 1);
pub const __IOV_MAX = @as(c_int, 1024);
pub const UIO_MAXIOV = __IOV_MAX;
pub const APR_FILE_IO_H = "";
pub const APR_FILE_INFO_H = "";
pub const APR_USER_H = "";
pub inline fn apr_uid_compare(left: anytype, right: anytype) @TypeOf(if (__helpers.cast(bool, left == right)) APR_SUCCESS else APR_EMISMATCH) {
    _ = &left;
    _ = &right;
    return if (__helpers.cast(bool, left == right)) APR_SUCCESS else APR_EMISMATCH;
}
pub inline fn apr_gid_compare(left: anytype, right: anytype) @TypeOf(if (__helpers.cast(bool, left == right)) APR_SUCCESS else APR_EMISMATCH) {
    _ = &left;
    _ = &right;
    return if (__helpers.cast(bool, left == right)) APR_SUCCESS else APR_EMISMATCH;
}
pub const APR_FPROT_USETID = __helpers.promoteIntLiteral(c_int, 0x8000, .hex);
pub const APR_FPROT_UREAD = @as(c_int, 0x0400);
pub const APR_FPROT_UWRITE = @as(c_int, 0x0200);
pub const APR_FPROT_UEXECUTE = @as(c_int, 0x0100);
pub const APR_FPROT_GSETID = @as(c_int, 0x4000);
pub const APR_FPROT_GREAD = @as(c_int, 0x0040);
pub const APR_FPROT_GWRITE = @as(c_int, 0x0020);
pub const APR_FPROT_GEXECUTE = @as(c_int, 0x0010);
pub const APR_FPROT_WSTICKY = @as(c_int, 0x2000);
pub const APR_FPROT_WREAD = @as(c_int, 0x0004);
pub const APR_FPROT_WWRITE = @as(c_int, 0x0002);
pub const APR_FPROT_WEXECUTE = @as(c_int, 0x0001);
pub const APR_FPROT_OS_DEFAULT = @as(c_int, 0x0FFF);
pub const APR_FPROT_FILE_SOURCE_PERMS = @as(c_int, 0x1000);
pub const APR_USETID = APR_FPROT_USETID;
pub const APR_UREAD = APR_FPROT_UREAD;
pub const APR_UWRITE = APR_FPROT_UWRITE;
pub const APR_UEXECUTE = APR_FPROT_UEXECUTE;
pub const APR_GSETID = APR_FPROT_GSETID;
pub const APR_GREAD = APR_FPROT_GREAD;
pub const APR_GWRITE = APR_FPROT_GWRITE;
pub const APR_GEXECUTE = APR_FPROT_GEXECUTE;
pub const APR_WSTICKY = APR_FPROT_WSTICKY;
pub const APR_WREAD = APR_FPROT_WREAD;
pub const APR_WWRITE = APR_FPROT_WWRITE;
pub const APR_WEXECUTE = APR_FPROT_WEXECUTE;
pub const APR_OS_DEFAULT = APR_FPROT_OS_DEFAULT;
pub const APR_FILE_SOURCE_PERMS = APR_FPROT_FILE_SOURCE_PERMS;
pub const APR_FINFO_LINK = @as(c_int, 0x00000001);
pub const APR_FINFO_MTIME = @as(c_int, 0x00000010);
pub const APR_FINFO_CTIME = @as(c_int, 0x00000020);
pub const APR_FINFO_ATIME = @as(c_int, 0x00000040);
pub const APR_FINFO_SIZE = @as(c_int, 0x00000100);
pub const APR_FINFO_CSIZE = @as(c_int, 0x00000200);
pub const APR_FINFO_DEV = @as(c_int, 0x00001000);
pub const APR_FINFO_INODE = @as(c_int, 0x00002000);
pub const APR_FINFO_NLINK = @as(c_int, 0x00004000);
pub const APR_FINFO_TYPE = __helpers.promoteIntLiteral(c_int, 0x00008000, .hex);
pub const APR_FINFO_USER = __helpers.promoteIntLiteral(c_int, 0x00010000, .hex);
pub const APR_FINFO_GROUP = __helpers.promoteIntLiteral(c_int, 0x00020000, .hex);
pub const APR_FINFO_UPROT = __helpers.promoteIntLiteral(c_int, 0x00100000, .hex);
pub const APR_FINFO_GPROT = __helpers.promoteIntLiteral(c_int, 0x00200000, .hex);
pub const APR_FINFO_WPROT = __helpers.promoteIntLiteral(c_int, 0x00400000, .hex);
pub const APR_FINFO_ICASE = __helpers.promoteIntLiteral(c_int, 0x01000000, .hex);
pub const APR_FINFO_NAME = __helpers.promoteIntLiteral(c_int, 0x02000000, .hex);
pub const APR_FINFO_MIN = __helpers.promoteIntLiteral(c_int, 0x00008170, .hex);
pub const APR_FINFO_IDENT = @as(c_int, 0x00003000);
pub const APR_FINFO_OWNER = __helpers.promoteIntLiteral(c_int, 0x00030000, .hex);
pub const APR_FINFO_PROT = __helpers.promoteIntLiteral(c_int, 0x00700000, .hex);
pub const APR_FINFO_NORM = __helpers.promoteIntLiteral(c_int, 0x0073b170, .hex);
pub const APR_FINFO_DIRENT = __helpers.promoteIntLiteral(c_int, 0x02000000, .hex);
pub const APR_FILEPATH_NOTABOVEROOT = @as(c_int, 0x01);
pub const APR_FILEPATH_SECUREROOTTEST = @as(c_int, 0x02);
pub const APR_FILEPATH_SECUREROOT = @as(c_int, 0x03);
pub const APR_FILEPATH_NOTRELATIVE = @as(c_int, 0x04);
pub const APR_FILEPATH_NOTABSOLUTE = @as(c_int, 0x08);
pub const APR_FILEPATH_NATIVE = @as(c_int, 0x10);
pub const APR_FILEPATH_TRUENAME = @as(c_int, 0x20);
pub const APR_FILEPATH_ENCODING_UNKNOWN = @as(c_int, 0);
pub const APR_FILEPATH_ENCODING_LOCALE = @as(c_int, 1);
pub const APR_FILEPATH_ENCODING_UTF8 = @as(c_int, 2);
pub const APR_INHERIT_H = "";
pub const APR_DECLARE_INHERIT_SET = @compileError("unable to translate macro: undefined identifier `apr_`");
// /usr/include/apr-1.0/apr_inherit.h:35:9
pub const APR_DECLARE_INHERIT_UNSET = @compileError("unable to translate macro: undefined identifier `apr_`");
// /usr/include/apr-1.0/apr_inherit.h:47:9
pub const _STDIO_H = @as(c_int, 1);
pub const __need___va_list = "";
pub const _____fpos_t_defined = @as(c_int, 1);
pub const ____mbstate_t_defined = @as(c_int, 1);
pub const _____fpos64_t_defined = @as(c_int, 1);
pub const ____FILE_defined = @as(c_int, 1);
pub const __FILE_defined = @as(c_int, 1);
pub const __struct_FILE_defined = @as(c_int, 1);
pub const __getc_unlocked_body = @compileError("TODO postfix inc/dec expr");
// /usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h:102:9
pub const __putc_unlocked_body = @compileError("TODO postfix inc/dec expr");
// /usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h:106:9
pub const _IO_EOF_SEEN = @as(c_int, 0x0010);
pub inline fn __feof_unlocked_body(_fp: anytype) @TypeOf((_fp.*._flags & _IO_EOF_SEEN) != @as(c_int, 0)) {
    _ = &_fp;
    return (_fp.*._flags & _IO_EOF_SEEN) != @as(c_int, 0);
}
pub const _IO_ERR_SEEN = @as(c_int, 0x0020);
pub inline fn __ferror_unlocked_body(_fp: anytype) @TypeOf((_fp.*._flags & _IO_ERR_SEEN) != @as(c_int, 0)) {
    _ = &_fp;
    return (_fp.*._flags & _IO_ERR_SEEN) != @as(c_int, 0);
}
pub const _IO_USER_LOCK = __helpers.promoteIntLiteral(c_int, 0x8000, .hex);
pub const _VA_LIST_DEFINED = "";
pub const _IOFBF = @as(c_int, 0);
pub const _IOLBF = @as(c_int, 1);
pub const _IONBF = @as(c_int, 2);
pub const BUFSIZ = @as(c_int, 8192);
pub const EOF = -@as(c_int, 1);
pub const SEEK_SET = @as(c_int, 0);
pub const SEEK_CUR = @as(c_int, 1);
pub const SEEK_END = @as(c_int, 2);
pub const P_tmpdir = "/tmp";
pub const _BITS_STDIO_LIM_H = @as(c_int, 1);
pub const L_tmpnam = @as(c_int, 20);
pub const TMP_MAX = __helpers.promoteIntLiteral(c_int, 238328, .decimal);
pub const FILENAME_MAX = @as(c_int, 4096);
pub const L_ctermid = @as(c_int, 9);
pub const FOPEN_MAX = @as(c_int, 16);
pub const __attr_dealloc_fclose = __attr_dealloc(fclose, @as(c_int, 1));
pub const _BITS_FLOATN_H = "";
pub const __HAVE_FLOAT128 = @as(c_int, 1);
pub const __HAVE_DISTINCT_FLOAT128 = @as(c_int, 1);
pub const __HAVE_FLOAT64X = @as(c_int, 1);
pub const __HAVE_FLOAT64X_LONG_DOUBLE = @as(c_int, 1);
pub const __f128 = @compileError("unable to translate macro: undefined identifier `f128`");
// /usr/include/x86_64-linux-gnu/bits/floatn.h:65:12
pub const __CFLOAT128 = @compileError("unable to translate: invalid numeric type");
// /usr/include/x86_64-linux-gnu/bits/floatn.h:77:12
pub const _BITS_FLOATN_COMMON_H = "";
pub const __HAVE_FLOAT16 = @as(c_int, 0);
pub const __HAVE_FLOAT32 = @as(c_int, 1);
pub const __HAVE_FLOAT64 = @as(c_int, 1);
pub const __HAVE_FLOAT32X = @as(c_int, 1);
pub const __HAVE_FLOAT128X = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT16 = __HAVE_FLOAT16;
pub const __HAVE_DISTINCT_FLOAT32 = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT64 = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT32X = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT64X = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT128X = __HAVE_FLOAT128X;
pub const __HAVE_FLOAT128_UNLIKE_LDBL = (__HAVE_DISTINCT_FLOAT128 != 0) and (__LDBL_MANT_DIG__ != @as(c_int, 113));
pub const __HAVE_FLOATN_NOT_TYPEDEF = @as(c_int, 1);
pub const __f32 = @compileError("unable to translate macro: undefined identifier `f32`");
// /usr/include/x86_64-linux-gnu/bits/floatn-common.h:93:12
pub const __f64 = @compileError("unable to translate macro: undefined identifier `f64`");
// /usr/include/x86_64-linux-gnu/bits/floatn-common.h:105:12
pub const __f32x = @compileError("unable to translate macro: undefined identifier `f32x`");
// /usr/include/x86_64-linux-gnu/bits/floatn-common.h:113:12
pub const __f64x = @compileError("unable to translate macro: undefined identifier `f64x`");
// /usr/include/x86_64-linux-gnu/bits/floatn-common.h:125:12
pub const __CFLOAT32 = @compileError("unable to translate: invalid numeric type");
// /usr/include/x86_64-linux-gnu/bits/floatn-common.h:151:12
pub const __CFLOAT64 = @compileError("unable to translate: invalid numeric type");
// /usr/include/x86_64-linux-gnu/bits/floatn-common.h:163:12
pub const __CFLOAT32X = @compileError("unable to translate: invalid numeric type");
// /usr/include/x86_64-linux-gnu/bits/floatn-common.h:171:12
pub const __CFLOAT64X = @compileError("unable to translate: invalid numeric type");
// /usr/include/x86_64-linux-gnu/bits/floatn-common.h:183:12
pub const APR_FOPEN_READ = @as(c_int, 0x00001);
pub const APR_FOPEN_WRITE = @as(c_int, 0x00002);
pub const APR_FOPEN_CREATE = @as(c_int, 0x00004);
pub const APR_FOPEN_APPEND = @as(c_int, 0x00008);
pub const APR_FOPEN_TRUNCATE = @as(c_int, 0x00010);
pub const APR_FOPEN_BINARY = @as(c_int, 0x00020);
pub const APR_FOPEN_EXCL = @as(c_int, 0x00040);
pub const APR_FOPEN_BUFFERED = @as(c_int, 0x00080);
pub const APR_FOPEN_DELONCLOSE = @as(c_int, 0x00100);
pub const APR_FOPEN_XTHREAD = @as(c_int, 0x00200);
pub const APR_FOPEN_SHARELOCK = @as(c_int, 0x00400);
pub const APR_FOPEN_NOCLEANUP = @as(c_int, 0x00800);
pub const APR_FOPEN_SENDFILE_ENABLED = @as(c_int, 0x01000);
pub const APR_FOPEN_LARGEFILE = @as(c_int, 0x04000);
pub const APR_FOPEN_SPARSE = __helpers.promoteIntLiteral(c_int, 0x08000, .hex);
pub const APR_FOPEN_NONBLOCK = __helpers.promoteIntLiteral(c_int, 0x40000, .hex);
pub const APR_READ = APR_FOPEN_READ;
pub const APR_WRITE = APR_FOPEN_WRITE;
pub const APR_CREATE = APR_FOPEN_CREATE;
pub const APR_APPEND = APR_FOPEN_APPEND;
pub const APR_TRUNCATE = APR_FOPEN_TRUNCATE;
pub const APR_BINARY = APR_FOPEN_BINARY;
pub const APR_EXCL = APR_FOPEN_EXCL;
pub const APR_BUFFERED = APR_FOPEN_BUFFERED;
pub const APR_DELONCLOSE = APR_FOPEN_DELONCLOSE;
pub const APR_XTHREAD = APR_FOPEN_XTHREAD;
pub const APR_SHARELOCK = APR_FOPEN_SHARELOCK;
pub const APR_FILE_NOCLEANUP = APR_FOPEN_NOCLEANUP;
pub const APR_SENDFILE_ENABLED = APR_FOPEN_SENDFILE_ENABLED;
pub const APR_LARGEFILE = APR_FOPEN_LARGEFILE;
pub const APR_SET = SEEK_SET;
pub const APR_CUR = SEEK_CUR;
pub const APR_END = SEEK_END;
pub const APR_FILE_ATTR_READONLY = @as(c_int, 0x01);
pub const APR_FILE_ATTR_EXECUTABLE = @as(c_int, 0x02);
pub const APR_FILE_ATTR_HIDDEN = @as(c_int, 0x04);
pub const APR_MAX_IOVEC_SIZE = @as(c_int, 1024);
pub const APR_FLOCK_SHARED = @as(c_int, 1);
pub const APR_FLOCK_EXCLUSIVE = @as(c_int, 2);
pub const APR_FLOCK_TYPEMASK = @as(c_int, 0x000F);
pub const APR_FLOCK_NONBLOCK = @as(c_int, 0x0010);
pub const SVN_ERROR_H = "";
pub const SVN_TYPES_H = "";
pub const SVN_TYPES_IMPL_H = "";
pub const SVN_INVALID_REVNUM = __helpers.cast(svn_revnum_t, -@as(c_int, 1));
pub const __GLIBC_USE_LIB_EXT2 = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_BFP_EXT = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_BFP_EXT_C2X = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_EXT = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_FUNCS_EXT = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_FUNCS_EXT_C2X = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_TYPES_EXT = @as(c_int, 0);
pub const __need_wchar_t = "";
pub const _STDLIB_H = @as(c_int, 1);
pub const __ldiv_t_defined = @as(c_int, 1);
pub const __lldiv_t_defined = @as(c_int, 1);
pub const RAND_MAX = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const EXIT_FAILURE = @as(c_int, 1);
pub const EXIT_SUCCESS = @as(c_int, 0);
pub const MB_CUR_MAX = __ctype_get_mb_cur_max();
pub const _ALLOCA_H = @as(c_int, 1);
pub const __COMPAR_FN_T = "";
pub const APR_VERSION_H = "";
pub const APR_COPYRIGHT = "Copyright (c) 2000-2019 The Apache Software " ++ "Foundation or its licensors, as applicable.";
pub const APR_MAJOR_VERSION = @as(c_int, 1);
pub const APR_MINOR_VERSION = @as(c_int, 7);
pub const APR_PATCH_VERSION = @as(c_int, 0);
pub inline fn APR_VERSION_AT_LEAST(major: anytype, minor: anytype, patch: anytype) @TypeOf(((major < APR_MAJOR_VERSION) or ((major == APR_MAJOR_VERSION) and (minor < APR_MINOR_VERSION))) or (((major == APR_MAJOR_VERSION) and (minor == APR_MINOR_VERSION)) and (patch <= APR_PATCH_VERSION))) {
    _ = &major;
    _ = &minor;
    _ = &patch;
    return ((major < APR_MAJOR_VERSION) or ((major == APR_MAJOR_VERSION) and (minor < APR_MINOR_VERSION))) or (((major == APR_MAJOR_VERSION) and (minor == APR_MINOR_VERSION)) and (patch <= APR_PATCH_VERSION));
}
pub const APR_IS_DEV_STRING = "";
pub const APR_VERSION_STRING = APR_STRINGIFY(APR_MAJOR_VERSION) ++ "." ++ APR_STRINGIFY(APR_MINOR_VERSION) ++ "." ++ APR_STRINGIFY(APR_PATCH_VERSION) ++ APR_IS_DEV_STRING;
pub const APR_VERSION_STRING_CSV = @compileError("unable to translate C expr: unexpected token '##'");
// /usr/include/apr-1.0/apr_version.h:117:9
pub const SVN_DEPRECATED = @compileError("unable to translate macro: undefined identifier `deprecated`");
// /home/user/myproject/svn-zig/subversion/include/svn_types.h:58:12
pub const SVN_EXPERIMENTAL = @compileError("unable to translate macro: undefined identifier `warning`");
// /home/user/myproject/svn-zig/subversion/include/svn_types.h:78:15
pub const SVN_NEEDS_SENTINEL_NULL = @compileError("unable to translate macro: undefined identifier `sentinel`");
// /home/user/myproject/svn-zig/subversion/include/svn_types.h:102:15
pub const SVN_UNALIGNED_ACCESS_IS_OK = @as(c_int, 0);
pub const SVN_VA_NULL = __helpers.cast([*c]struct_svn__null_pointer_constant_stdarg_sentinel_t, @as(c_int, 0));
pub inline fn SVN__APR_STATUS_IS_ENOTDIR(s: anytype) @TypeOf(APR_STATUS_IS_ENOTDIR(s)) {
    _ = &s;
    return APR_STATUS_IS_ENOTDIR(s);
}
pub inline fn SVN__APR_STATUS_IS_EPIPE(s: anytype) @TypeOf(APR_STATUS_IS_EPIPE(s)) {
    _ = &s;
    return APR_STATUS_IS_EPIPE(s);
}
pub inline fn SVN_IS_VALID_REVNUM(n: anytype) @TypeOf(n >= @as(c_int, 0)) {
    _ = &n;
    return n >= @as(c_int, 0);
}
pub const SVN_IGNORED_REVNUM = __helpers.cast(svn_revnum_t, -@as(c_int, 1));
pub inline fn SVN_STR_TO_REV(str: anytype) svn_revnum_t {
    _ = &str;
    return __helpers.cast(svn_revnum_t, atol(str));
}
pub const SVN_REVNUM_T_FMT = "ld";
pub const SVN_INVALID_FILESIZE = __helpers.cast(svn_filesize_t, -@as(c_int, 1));
pub const SVN_FILESIZE_T_FMT = APR_INT64_T_FMT;
pub inline fn svn__atoui64(X: anytype) apr_uint64_t {
    _ = &X;
    return __helpers.cast(apr_uint64_t, apr_atoi64(X));
}
pub inline fn SVN_DEPTH_INFINITY_OR_FILES(recurse: anytype) @TypeOf(if (__helpers.cast(bool, recurse)) svn_depth_infinity else svn_depth_files) {
    _ = &recurse;
    return if (__helpers.cast(bool, recurse)) svn_depth_infinity else svn_depth_files;
}
pub inline fn SVN_DEPTH_INFINITY_OR_IMMEDIATES(recurse: anytype) @TypeOf(if (__helpers.cast(bool, recurse)) svn_depth_infinity else svn_depth_immediates) {
    _ = &recurse;
    return if (__helpers.cast(bool, recurse)) svn_depth_infinity else svn_depth_immediates;
}
pub inline fn SVN_DEPTH_INFINITY_OR_EMPTY(recurse: anytype) @TypeOf(if (__helpers.cast(bool, recurse)) svn_depth_infinity else svn_depth_empty) {
    _ = &recurse;
    return if (__helpers.cast(bool, recurse)) svn_depth_infinity else svn_depth_empty;
}
pub inline fn SVN_DEPTH_IS_RECURSIVE(depth: anytype) @TypeOf((depth == svn_depth_infinity) or (depth == svn_depth_unknown)) {
    _ = &depth;
    return (depth == svn_depth_infinity) or (depth == svn_depth_unknown);
}
pub const SVN_DIRENT_KIND = @as(c_int, 0x00001);
pub const SVN_DIRENT_SIZE = @as(c_int, 0x00002);
pub const SVN_DIRENT_HAS_PROPS = @as(c_int, 0x00004);
pub const SVN_DIRENT_CREATED_REV = @as(c_int, 0x00008);
pub const SVN_DIRENT_TIME = @as(c_int, 0x00010);
pub const SVN_DIRENT_LAST_AUTHOR = @as(c_int, 0x00020);
pub const SVN_DIRENT_ALL = ~__helpers.cast(apr_uint32_t, @as(c_int, 0));
pub const SVN_KEYWORD_MAX_LEN = @as(c_int, 255);
pub const SVN_KEYWORD_REVISION_LONG = "LastChangedRevision";
pub const SVN_KEYWORD_REVISION_SHORT = "Rev";
pub const SVN_KEYWORD_REVISION_MEDIUM = "Revision";
pub const SVN_KEYWORD_DATE_LONG = "LastChangedDate";
pub const SVN_KEYWORD_DATE_SHORT = "Date";
pub const SVN_KEYWORD_AUTHOR_LONG = "LastChangedBy";
pub const SVN_KEYWORD_AUTHOR_SHORT = "Author";
pub const SVN_KEYWORD_URL_LONG = "HeadURL";
pub const SVN_KEYWORD_URL_SHORT = "URL";
pub const SVN_KEYWORD_ID = "Id";
pub const SVN_KEYWORD_HEADER = "Header";
pub const SVN_STREAM_CHUNK_SIZE = __helpers.promoteIntLiteral(c_int, 102400, .decimal);
pub const SVN__STREAM_CHUNK_SIZE = @as(c_int, 16384);
pub const SVN_MAX_OBJECT_SIZE = __helpers.div(__helpers.cast(apr_size_t, -@as(c_int, 1)), @as(c_int, 2));
pub const SVN_LINENUM_MAX_VALUE = ULONG_MAX;
pub const SVN_NO_ERROR = @as(c_int, 0);
pub const SVN_ERROR_ENUM_DEFINED = "";
pub const SVN_ERR_CATEGORY_SIZE = @as(c_int, 5000);
pub const SVN_ERR_BAD_CATEGORY_START = APR_OS_START_USERERR + (@as(c_int, 1) * SVN_ERR_CATEGORY_SIZE);
pub const SVN_ERR_XML_CATEGORY_START = APR_OS_START_USERERR + (@as(c_int, 2) * SVN_ERR_CATEGORY_SIZE);
pub const SVN_ERR_IO_CATEGORY_START = APR_OS_START_USERERR + (@as(c_int, 3) * SVN_ERR_CATEGORY_SIZE);
pub const SVN_ERR_STREAM_CATEGORY_START = APR_OS_START_USERERR + (@as(c_int, 4) * SVN_ERR_CATEGORY_SIZE);
pub const SVN_ERR_NODE_CATEGORY_START = APR_OS_START_USERERR + (@as(c_int, 5) * SVN_ERR_CATEGORY_SIZE);
pub const SVN_ERR_ENTRY_CATEGORY_START = APR_OS_START_USERERR + (@as(c_int, 6) * SVN_ERR_CATEGORY_SIZE);
pub const SVN_ERR_WC_CATEGORY_START = APR_OS_START_USERERR + (@as(c_int, 7) * SVN_ERR_CATEGORY_SIZE);
pub const SVN_ERR_FS_CATEGORY_START = APR_OS_START_USERERR + (@as(c_int, 8) * SVN_ERR_CATEGORY_SIZE);
pub const SVN_ERR_REPOS_CATEGORY_START = APR_OS_START_USERERR + (@as(c_int, 9) * SVN_ERR_CATEGORY_SIZE);
pub const SVN_ERR_RA_CATEGORY_START = APR_OS_START_USERERR + (@as(c_int, 10) * SVN_ERR_CATEGORY_SIZE);
pub const SVN_ERR_RA_DAV_CATEGORY_START = APR_OS_START_USERERR + (@as(c_int, 11) * SVN_ERR_CATEGORY_SIZE);
pub const SVN_ERR_RA_LOCAL_CATEGORY_START = APR_OS_START_USERERR + (@as(c_int, 12) * SVN_ERR_CATEGORY_SIZE);
pub const SVN_ERR_SVNDIFF_CATEGORY_START = APR_OS_START_USERERR + (@as(c_int, 13) * SVN_ERR_CATEGORY_SIZE);
pub const SVN_ERR_APMOD_CATEGORY_START = APR_OS_START_USERERR + (@as(c_int, 14) * SVN_ERR_CATEGORY_SIZE);
pub const SVN_ERR_CLIENT_CATEGORY_START = APR_OS_START_USERERR + (@as(c_int, 15) * SVN_ERR_CATEGORY_SIZE);
pub const SVN_ERR_MISC_CATEGORY_START = APR_OS_START_USERERR + (@as(c_int, 16) * SVN_ERR_CATEGORY_SIZE);
pub const SVN_ERR_CL_CATEGORY_START = APR_OS_START_USERERR + (@as(c_int, 17) * SVN_ERR_CATEGORY_SIZE);
pub const SVN_ERR_RA_SVN_CATEGORY_START = APR_OS_START_USERERR + (@as(c_int, 18) * SVN_ERR_CATEGORY_SIZE);
pub const SVN_ERR_AUTHN_CATEGORY_START = APR_OS_START_USERERR + (@as(c_int, 19) * SVN_ERR_CATEGORY_SIZE);
pub const SVN_ERR_AUTHZ_CATEGORY_START = APR_OS_START_USERERR + (@as(c_int, 20) * SVN_ERR_CATEGORY_SIZE);
pub const SVN_ERR_DIFF_CATEGORY_START = APR_OS_START_USERERR + (@as(c_int, 21) * SVN_ERR_CATEGORY_SIZE);
pub const SVN_ERR_RA_SERF_CATEGORY_START = APR_OS_START_USERERR + (@as(c_int, 22) * SVN_ERR_CATEGORY_SIZE);
pub const SVN_ERR_MALFUNC_CATEGORY_START = APR_OS_START_USERERR + (@as(c_int, 23) * SVN_ERR_CATEGORY_SIZE);
pub const SVN_ERR_X509_CATEGORY_START = APR_OS_START_USERERR + (@as(c_int, 24) * SVN_ERR_CATEGORY_SIZE);
pub const SVN_ERR = @compileError("unable to translate macro: undefined identifier `svn_err__temp`");
// /home/user/myproject/svn-zig/subversion/include/svn_error.h:351:9
pub inline fn svn_error_trace(expr: anytype) @TypeOf(expr) {
    _ = &expr;
    return expr;
}
pub const SVN_ERR_W = @compileError("unable to translate macro: undefined identifier `svn_err__temp`");
// /home/user/myproject/svn-zig/subversion/include/svn_error.h:402:9
pub const SVN_INT_ERR = @compileError("unable to translate macro: undefined identifier `svn_err__temp`");
// /home/user/myproject/svn-zig/subversion/include/svn_error.h:422:9
pub inline fn SVN_ERR_IS_LOCK_ERROR(err: anytype) @TypeOf((((((((err.*.apr_err == SVN_ERR_FS_PATH_ALREADY_LOCKED) or (err.*.apr_err == SVN_ERR_FS_NOT_FOUND)) or (err.*.apr_err == SVN_ERR_FS_OUT_OF_DATE)) or (err.*.apr_err == SVN_ERR_FS_BAD_LOCK_TOKEN)) or (err.*.apr_err == SVN_ERR_REPOS_HOOK_FAILURE)) or (err.*.apr_err == SVN_ERR_FS_NO_SUCH_REVISION)) or (err.*.apr_err == SVN_ERR_FS_OUT_OF_DATE)) or (err.*.apr_err == SVN_ERR_FS_NOT_FILE)) {
    _ = &err;
    return (((((((err.*.apr_err == SVN_ERR_FS_PATH_ALREADY_LOCKED) or (err.*.apr_err == SVN_ERR_FS_NOT_FOUND)) or (err.*.apr_err == SVN_ERR_FS_OUT_OF_DATE)) or (err.*.apr_err == SVN_ERR_FS_BAD_LOCK_TOKEN)) or (err.*.apr_err == SVN_ERR_REPOS_HOOK_FAILURE)) or (err.*.apr_err == SVN_ERR_FS_NO_SUCH_REVISION)) or (err.*.apr_err == SVN_ERR_FS_OUT_OF_DATE)) or (err.*.apr_err == SVN_ERR_FS_NOT_FILE);
}
pub inline fn SVN_ERR_IS_UNLOCK_ERROR(err: anytype) @TypeOf(((((((err.*.apr_err == SVN_ERR_FS_PATH_NOT_LOCKED) or (err.*.apr_err == SVN_ERR_FS_BAD_LOCK_TOKEN)) or (err.*.apr_err == SVN_ERR_FS_LOCK_OWNER_MISMATCH)) or (err.*.apr_err == SVN_ERR_FS_NO_SUCH_LOCK)) or (err.*.apr_err == SVN_ERR_RA_NOT_LOCKED)) or (err.*.apr_err == SVN_ERR_FS_LOCK_EXPIRED)) or (err.*.apr_err == SVN_ERR_REPOS_HOOK_FAILURE)) {
    _ = &err;
    return ((((((err.*.apr_err == SVN_ERR_FS_PATH_NOT_LOCKED) or (err.*.apr_err == SVN_ERR_FS_BAD_LOCK_TOKEN)) or (err.*.apr_err == SVN_ERR_FS_LOCK_OWNER_MISMATCH)) or (err.*.apr_err == SVN_ERR_FS_NO_SUCH_LOCK)) or (err.*.apr_err == SVN_ERR_RA_NOT_LOCKED)) or (err.*.apr_err == SVN_ERR_FS_LOCK_EXPIRED)) or (err.*.apr_err == SVN_ERR_REPOS_HOOK_FAILURE);
}
pub inline fn SVN_ERROR_IN_CATEGORY(apr_err: anytype, category: anytype) @TypeOf(category == (__helpers.div(apr_err, SVN_ERR_CATEGORY_SIZE) * SVN_ERR_CATEGORY_SIZE)) {
    _ = &apr_err;
    _ = &category;
    return category == (__helpers.div(apr_err, SVN_ERR_CATEGORY_SIZE) * SVN_ERR_CATEGORY_SIZE);
}
pub const SVN_ERR_MALFUNCTION = @compileError("unable to translate macro: undefined identifier `__FILE__`");
// /home/user/myproject/svn-zig/subversion/include/svn_error.h:511:9
pub const SVN_ERR_MALFUNCTION_NO_RETURN = @compileError("unable to translate macro: undefined identifier `__FILE__`");
// /home/user/myproject/svn-zig/subversion/include/svn_error.h:524:9
pub const SVN_ERR_ASSERT_E = @compileError("unable to translate macro: undefined identifier `__FILE__`");
// /home/user/myproject/svn-zig/subversion/include/svn_error.h:544:9
pub const SVN_ERR_ASSERT = @compileError("unable to translate macro: undefined identifier `__FILE__`");
// /home/user/myproject/svn-zig/subversion/include/svn_error.h:580:9
pub const SVN_ERR_ASSERT_NO_RETURN = @compileError("unable to translate macro: undefined identifier `__FILE__`");
// /home/user/myproject/svn-zig/subversion/include/svn_error.h:594:9
pub const SVN__NOT_IMPLEMENTED = @compileError("unable to translate macro: undefined identifier `__FILE__`");
// /home/user/myproject/svn-zig/subversion/include/svn_error.h:603:9
pub const SVN_STRING_H = "";
pub const SVN_POOLS_H = "";
pub const SVN_ALLOCATOR_RECOMMENDED_MAX_FREE = @as(c_int, 4096) * @as(c_int, 1024);
pub inline fn svn_pool_create(parent_pool: anytype) @TypeOf(svn_pool_create_ex(parent_pool, NULL)) {
    _ = &parent_pool;
    return svn_pool_create_ex(parent_pool, NULL);
}
pub const svn_pool_clear = apr_pool_clear;
pub const svn_pool_destroy = apr_pool_destroy;
pub const SVN_DELTA_H = "";
pub const SVN_IO_H = "";
pub const APR_THREAD_PROC_H = "";
pub const APR_PERMS_SET_H = "";
pub const APR_PERMS_SET_IMPLEMENT = @compileError("unable to translate macro: undefined identifier `apr_`");
// /usr/include/apr-1.0/apr_perms_set.h:45:9
pub const APR_PERMS_SET_ENOTIMPL = @compileError("unable to translate macro: undefined identifier `apr_`");
// /usr/include/apr-1.0/apr_perms_set.h:50:9
pub const APR_PERMS_SET_FN = @compileError("unable to translate macro: undefined identifier `apr_`");
// /usr/include/apr-1.0/apr_perms_set.h:56:9
pub const _SYS_TIME_H = @as(c_int, 1);
pub inline fn timerisset(tvp: anytype) @TypeOf((tvp.*.tv_sec != 0) or (tvp.*.tv_usec != 0)) {
    _ = &tvp;
    return (tvp.*.tv_sec != 0) or (tvp.*.tv_usec != 0);
}
pub const timerclear = @compileError("unable to translate C expr: expected ')' instead got '='");
// /usr/include/x86_64-linux-gnu/sys/time.h:232:10
pub inline fn timercmp(a: anytype, b: anytype, CMP: anytype) @TypeOf(if (__helpers.cast(bool, a.*.tv_sec == b.*.tv_sec)) a.*.tv_usec ++ CMP(b).*.tv_usec else a.*.tv_sec ++ CMP(b).*.tv_sec) {
    _ = &a;
    _ = &b;
    _ = &CMP;
    return if (__helpers.cast(bool, a.*.tv_sec == b.*.tv_sec)) a.*.tv_usec ++ CMP(b).*.tv_usec else a.*.tv_sec ++ CMP(b).*.tv_sec;
}
pub const timeradd = @compileError("unable to translate C expr: unexpected token 'do'");
// /usr/include/x86_64-linux-gnu/sys/time.h:237:10
pub const timersub = @compileError("unable to translate C expr: unexpected token 'do'");
// /usr/include/x86_64-linux-gnu/sys/time.h:247:10
pub const _SYS_RESOURCE_H = @as(c_int, 1);
pub const RLIMIT_RSS = __RLIMIT_RSS;
pub const RLIMIT_OFILE = __RLIMIT_OFILE;
pub const RLIMIT_NPROC = __RLIMIT_NPROC;
pub const RLIMIT_MEMLOCK = __RLIMIT_MEMLOCK;
pub const RLIMIT_LOCKS = __RLIMIT_LOCKS;
pub const RLIMIT_SIGPENDING = __RLIMIT_SIGPENDING;
pub const RLIMIT_MSGQUEUE = __RLIMIT_MSGQUEUE;
pub const RLIMIT_NICE = __RLIMIT_NICE;
pub const RLIMIT_RTPRIO = __RLIMIT_RTPRIO;
pub const RLIMIT_RTTIME = __RLIMIT_RTTIME;
pub const RLIMIT_NLIMITS = __RLIMIT_NLIMITS;
pub const RLIM_NLIMITS = __RLIM_NLIMITS;
pub const RLIM_INFINITY = __helpers.cast(__rlim_t, -@as(c_int, 1));
pub const RLIM_SAVED_MAX = RLIM_INFINITY;
pub const RLIM_SAVED_CUR = RLIM_INFINITY;
pub const __rusage_defined = @as(c_int, 1);
pub const PRIO_MIN = -@as(c_int, 20);
pub const PRIO_MAX = @as(c_int, 20);
pub inline fn APR_PROC_CHECK_EXIT(x: anytype) @TypeOf(x & APR_PROC_EXIT) {
    _ = &x;
    return x & APR_PROC_EXIT;
}
pub inline fn APR_PROC_CHECK_SIGNALED(x: anytype) @TypeOf(x & APR_PROC_SIGNAL) {
    _ = &x;
    return x & APR_PROC_SIGNAL;
}
pub inline fn APR_PROC_CHECK_CORE_DUMP(x: anytype) @TypeOf(x & APR_PROC_SIGNAL_CORE) {
    _ = &x;
    return x & APR_PROC_SIGNAL_CORE;
}
pub const APR_NO_PIPE = @as(c_int, 0);
pub const APR_FULL_BLOCK = @as(c_int, 1);
pub const APR_FULL_NONBLOCK = @as(c_int, 2);
pub const APR_PARENT_BLOCK = @as(c_int, 3);
pub const APR_CHILD_BLOCK = @as(c_int, 4);
pub const APR_NO_FILE = @as(c_int, 8);
pub const APR_READ_BLOCK = @as(c_int, 3);
pub const APR_WRITE_BLOCK = @as(c_int, 4);
pub const APR_LIMIT_CPU = @as(c_int, 0);
pub const APR_LIMIT_MEM = @as(c_int, 1);
pub const APR_LIMIT_NPROC = @as(c_int, 2);
pub const APR_LIMIT_NOFILE = @as(c_int, 3);
pub const APR_OC_REASON_DEATH = @as(c_int, 0);
pub const APR_OC_REASON_UNWRITABLE = @as(c_int, 1);
pub const APR_OC_REASON_RESTART = @as(c_int, 2);
pub const APR_OC_REASON_UNREGISTER = @as(c_int, 3);
pub const APR_OC_REASON_LOST = @as(c_int, 4);
pub const APR_OC_REASON_RUNNING = @as(c_int, 5);
pub const APR_PROC_DETACH_FOREGROUND = @as(c_int, 0);
pub const APR_PROC_DETACH_DAEMONIZE = @as(c_int, 1);
pub const SVN_CHECKSUM_H = "";
pub const SVN_DELTA_COMPRESSION_LEVEL_NONE = @as(c_int, 0);
pub const SVN_DELTA_COMPRESSION_LEVEL_MAX = @as(c_int, 9);
pub const SVN_DELTA_COMPRESSION_LEVEL_DEFAULT = @as(c_int, 5);
pub const SVN_FS_H = "";
pub const SVN_MERGEINFO_H = "";
pub const SVN_MERGEINFO_NONINHERITABLE_STR = "*";
pub const SVN_FS_TYPE_BDB = "bdb";
pub const SVN_FS_TYPE_FSFS = "fsfs";
pub const SVN_FS_TYPE_FSX = "fsx";
pub const SVN_FS_CONFIG_BDB_TXN_NOSYNC = "bdb-txn-nosync";
pub const SVN_FS_CONFIG_BDB_LOG_AUTOREMOVE = "bdb-log-autoremove";
pub const SVN_FS_CONFIG_FSFS_CACHE_DELTAS = "fsfs-cache-deltas";
pub const SVN_FS_CONFIG_FSFS_CACHE_FULLTEXTS = "fsfs-cache-fulltexts";
pub const SVN_FS_CONFIG_FSFS_CACHE_REVPROPS = "fsfs-cache-revprops";
pub const SVN_FS_CONFIG_FSFS_CACHE_NS = "fsfs-cache-namespace";
pub const SVN_FS_CONFIG_FSFS_CACHE_NODEPROPS = "fsfs-cache-nodeprops";
pub const SVN_FS_CONFIG_FSFS_BLOCK_READ = "fsfs-block-read";
pub const SVN_FS_CONFIG_FSFS_SHARD_SIZE = "fsfs-shard-size";
pub const SVN_FS_CONFIG_FSFS_LOG_ADDRESSING = "fsfs-log-addressing";
pub const SVN_FS_CONFIG_FS_TYPE = "fs-type";
pub const SVN_FS_CONFIG_PRE_1_4_COMPATIBLE = "pre-1.4-compatible";
pub const SVN_FS_CONFIG_PRE_1_5_COMPATIBLE = "pre-1.5-compatible";
pub const SVN_FS_CONFIG_PRE_1_6_COMPATIBLE = "pre-1.6-compatible";
pub const SVN_FS_CONFIG_PRE_1_8_COMPATIBLE = "pre-1.8-compatible";
pub const SVN_FS_CONFIG_COMPATIBLE_VERSION = "compatible-version";
pub const SVN_FS_CONFIG_NO_FLUSH_TO_DISK = "no-flush-to-disk";
pub const SVN_FS_TXN_CHECK_OOD = @as(c_int, 0x00001);
pub const SVN_FS_TXN_CHECK_LOCKS = @as(c_int, 0x00002);
pub const SVN_FS_TXN_CLIENT_DATE = @as(c_int, 0x00004);
pub const SVN_FS_DECLARE_IOCTL_CODE = @compileError("unable to translate C expr: unexpected token 'static'");
// /home/user/myproject/svn-zig/subversion/include/svn_fs.h:3524:9
pub const SVN_UTF_H = "";
pub const APR_XLATE_H = "";
pub const APU_H = "";
pub inline fn APU_DECLARE(@"type": anytype) @TypeOf(@"type") {
    _ = &@"type";
    return @"type";
}
pub inline fn APU_DECLARE_NONSTD(@"type": anytype) @TypeOf(@"type") {
    _ = &@"type";
    return @"type";
}
pub const APU_DECLARE_DATA = "";
pub const APU_MODULE_DECLARE_DATA = "";
pub const APU_HAVE_SDBM = @as(c_int, 1);
pub const APU_HAVE_GDBM = @as(c_int, 1);
pub const APU_HAVE_NDBM = @as(c_int, 0);
pub const APU_HAVE_DB = @as(c_int, 1);
pub const APU_HAVE_DB_VERSION = @as(c_int, 5);
pub const APU_HAVE_PGSQL = @as(c_int, 1);
pub const APU_HAVE_MYSQL = @as(c_int, 1);
pub const APU_HAVE_SQLITE3 = @as(c_int, 1);
pub const APU_HAVE_SQLITE2 = @as(c_int, 0);
pub const APU_HAVE_ORACLE = @as(c_int, 0);
pub const APU_HAVE_ODBC = @as(c_int, 1);
pub const APU_HAVE_CRYPTO = @as(c_int, 1);
pub const APU_HAVE_OPENSSL = @as(c_int, 1);
pub const APU_HAVE_NSS = @as(c_int, 0);
pub const APU_HAVE_COMMONCRYPTO = @as(c_int, 0);
pub const APU_HAVE_APR_ICONV = @as(c_int, 0);
pub const APU_HAVE_ICONV = @as(c_int, 1);
pub const APR_HAS_XLATE = (APU_HAVE_APR_ICONV != 0) or (APU_HAVE_ICONV != 0);
pub const APR_DEFAULT_CHARSET = @compileError("unable to translate C expr: unexpected token 'const'");
// /usr/include/apr-1.0/apr_xlate.h:78:9
pub const APR_LOCALE_CHARSET = @compileError("unable to translate C expr: unexpected token 'const'");
// /usr/include/apr-1.0/apr_xlate.h:82:9
pub const SVN_APR_LOCALE_CHARSET = APR_LOCALE_CHARSET;
pub const SVN_APR_DEFAULT_CHARSET = APR_DEFAULT_CHARSET;
pub const SVN_FS_UTIL_H = "";
pub const SVN_VERSION_H = "";
pub const SVN_VER_MAJOR = @as(c_int, 1);
pub const SVN_VER_MINOR = @as(c_int, 16);
pub const SVN_VER_PATCH = @as(c_int, 0);
pub const SVN_VER_MICRO = SVN_VER_PATCH;
pub const SVN_VER_LIBRARY = SVN_VER_MAJOR;
pub const SVN_VER_TAG = " (under development)";
pub const SVN_VER_NUMTAG = "-dev";
pub const SVN_VER_REVISION = @as(c_int, 0);
pub const SVN_VER_NUM = APR_STRINGIFY(SVN_VER_MAJOR) ++ "." ++ APR_STRINGIFY(SVN_VER_MINOR) ++ "." ++ APR_STRINGIFY(SVN_VER_PATCH);
pub const SVN_VER_NUMBER = SVN_VER_NUM ++ SVN_VER_NUMTAG;
pub const SVN_VERSION = SVN_VER_NUMBER ++ SVN_VER_TAG;
pub const SVN_VERSION_DEFINE = @compileError("unable to translate C expr: unexpected token 'static'");
// /home/user/myproject/svn-zig/subversion/include/svn_version.h:165:9
pub const SVN_VERSION_BODY = @compileError("unable to translate macro: undefined identifier `versioninfo_t`");
// /home/user/myproject/svn-zig/subversion/include/svn_version.h:181:9
pub inline fn svn_fs__identifier(fs: anytype) @TypeOf(fs.*.uuid) {
    _ = &fs;
    return fs.*.uuid;
}
pub const SVN_FS__NOT_FOUND = @compileError("unable to translate macro: undefined identifier `_`");
// /home/user/myproject/svn-zig/subversion/include/private/svn_fs_util.h:82:9
pub const SVN_FS__ALREADY_EXISTS = @compileError("unable to translate macro: undefined identifier `_`");
// /home/user/myproject/svn-zig/subversion/include/private/svn_fs_util.h:98:9
pub const SVN_FS__NOT_TXN = @compileError("unable to translate macro: undefined identifier `_`");
// /home/user/myproject/svn-zig/subversion/include/private/svn_fs_util.h:112:9
pub const SVN_FS__ERR_NOT_MUTABLE = @compileError("unable to translate macro: undefined identifier `_`");
// /home/user/myproject/svn-zig/subversion/include/private/svn_fs_util.h:119:9
pub const SVN_FS__ERR_NOT_DIRECTORY = @compileError("unable to translate macro: undefined identifier `_`");
// /home/user/myproject/svn-zig/subversion/include/private/svn_fs_util.h:126:9
pub const SVN_FS__ERR_NOT_FILE = @compileError("unable to translate macro: undefined identifier `_`");
// /home/user/myproject/svn-zig/subversion/include/private/svn_fs_util.h:133:9
pub const SVN_FS__ERR_PATH_ALREADY_LOCKED = @compileError("unable to translate macro: undefined identifier `_`");
// /home/user/myproject/svn-zig/subversion/include/private/svn_fs_util.h:141:9
pub const SVN_FS__ERR_NO_SUCH_LOCK = @compileError("unable to translate macro: undefined identifier `_`");
// /home/user/myproject/svn-zig/subversion/include/private/svn_fs_util.h:148:9
pub const SVN_FS__ERR_LOCK_EXPIRED = @compileError("unable to translate macro: undefined identifier `_`");
// /home/user/myproject/svn-zig/subversion/include/private/svn_fs_util.h:155:9
pub const SVN_FS__ERR_NO_USER = @compileError("unable to translate macro: undefined identifier `_`");
// /home/user/myproject/svn-zig/subversion/include/private/svn_fs_util.h:162:9
pub const SVN_FS__ERR_LOCK_OWNER_MISMATCH = @compileError("unable to translate macro: undefined identifier `_`");
// /home/user/myproject/svn-zig/subversion/include/private/svn_fs_util.h:171:9
pub const LIBSVN_FS_LOADER_H = "";
pub const SVN_PROPS_H = "";
pub const SVN_PROP_PREFIX = "svn:";
pub const SVN_PROP_BOOLEAN_TRUE = "*";
pub const SVN_PROP_MIME_TYPE = SVN_PROP_PREFIX ++ "mime-type";
pub const SVN_PROP_IGNORE = SVN_PROP_PREFIX ++ "ignore";
pub const SVN_PROP_EOL_STYLE = SVN_PROP_PREFIX ++ "eol-style";
pub const SVN_PROP_KEYWORDS = SVN_PROP_PREFIX ++ "keywords";
pub const SVN_PROP_EXECUTABLE = SVN_PROP_PREFIX ++ "executable";
pub const SVN_PROP_EXECUTABLE_VALUE = SVN_PROP_BOOLEAN_TRUE;
pub const SVN_PROP_NEEDS_LOCK = SVN_PROP_PREFIX ++ "needs-lock";
pub const SVN_PROP_NEEDS_LOCK_VALUE = SVN_PROP_BOOLEAN_TRUE;
pub const SVN_PROP_SPECIAL = SVN_PROP_PREFIX ++ "special";
pub const SVN_PROP_SPECIAL_VALUE = SVN_PROP_BOOLEAN_TRUE;
pub const SVN_PROP_EXTERNALS = SVN_PROP_PREFIX ++ "externals";
pub const SVN_PROP_MERGEINFO = SVN_PROP_PREFIX ++ "mergeinfo";
pub const SVN_PROP_INHERITABLE_AUTO_PROPS = SVN_PROP_PREFIX ++ "auto-props";
pub const SVN_PROP_INHERITABLE_IGNORES = SVN_PROP_PREFIX ++ "global-ignores";
pub const SVN_PROP_TEXT_TIME = SVN_PROP_PREFIX ++ "text-time";
pub const SVN_PROP_OWNER = SVN_PROP_PREFIX ++ "owner";
pub const SVN_PROP_GROUP = SVN_PROP_PREFIX ++ "group";
pub const SVN_PROP_UNIX_MODE = SVN_PROP_PREFIX ++ "unix-mode";
pub const SVN_PROP_NODE_ALL_PROPS = @compileError("unable to translate C expr: unexpected token ''");
// /home/user/myproject/svn-zig/subversion/include/svn_props.h:531:9
pub const SVN_PROP_WC_PREFIX = SVN_PROP_PREFIX ++ "wc:";
pub const SVN_PROP_ENTRY_PREFIX = SVN_PROP_PREFIX ++ "entry:";
pub const SVN_PROP_ENTRY_COMMITTED_REV = SVN_PROP_ENTRY_PREFIX ++ "committed-rev";
pub const SVN_PROP_ENTRY_COMMITTED_DATE = SVN_PROP_ENTRY_PREFIX ++ "committed-date";
pub const SVN_PROP_ENTRY_LAST_AUTHOR = SVN_PROP_ENTRY_PREFIX ++ "last-author";
pub const SVN_PROP_ENTRY_UUID = SVN_PROP_ENTRY_PREFIX ++ "uuid";
pub const SVN_PROP_ENTRY_LOCK_TOKEN = SVN_PROP_ENTRY_PREFIX ++ "lock-token";
pub const SVN_PROP_CUSTOM_PREFIX = SVN_PROP_PREFIX ++ "custom:";
pub const SVN_PROP_REVISION_AUTHOR = SVN_PROP_PREFIX ++ "author";
pub const SVN_PROP_REVISION_LOG = SVN_PROP_PREFIX ++ "log";
pub const SVN_PROP_REVISION_DATE = SVN_PROP_PREFIX ++ "date";
pub const SVN_PROP_REVISION_ORIG_DATE = SVN_PROP_PREFIX ++ "original-date";
pub const SVN_PROP_REVISION_AUTOVERSIONED = SVN_PROP_PREFIX ++ "autoversioned";
pub const SVNSYNC_PROP_PREFIX = SVN_PROP_PREFIX ++ "sync-";
pub const SVNSYNC_PROP_LOCK = SVNSYNC_PROP_PREFIX ++ "lock";
pub const SVNSYNC_PROP_FROM_URL = SVNSYNC_PROP_PREFIX ++ "from-url";
pub const SVNSYNC_PROP_FROM_UUID = SVNSYNC_PROP_PREFIX ++ "from-uuid";
pub const SVNSYNC_PROP_LAST_MERGED_REV = SVNSYNC_PROP_PREFIX ++ "last-merged-rev";
pub const SVNSYNC_PROP_CURRENTLY_COPYING = SVNSYNC_PROP_PREFIX ++ "currently-copying";
pub const SVN_PROP_REVISION_ALL_PROPS = @compileError("unable to translate C expr: unexpected token ''");
// /home/user/myproject/svn-zig/subversion/include/svn_props.h:679:9
pub const SVN_PROP_TXN_PREFIX = SVN_PROP_PREFIX ++ "txn-";
pub const SVN_PROP_TXN_CLIENT_COMPAT_VERSION = SVN_PROP_TXN_PREFIX ++ "client-compat-version";
pub const SVN_PROP_TXN_USER_AGENT = SVN_PROP_TXN_PREFIX ++ "user-agent";
pub const SVN_PROP_REVISION_PREFIX = SVN_PROP_PREFIX ++ "revision-";
pub const SVN_MUTEX_H = "";
pub const SVN_MUTEX__WITH_LOCK = @compileError("unable to translate macro: undefined identifier `svn_mutex__m`");
// /home/user/myproject/svn-zig/subversion/include/private/svn_mutex.h:100:9
pub const SVN_FS__PROP_TXN_CHECK_LOCKS = SVN_PROP_PREFIX ++ "check-locks";
pub const SVN_FS__PROP_TXN_CHECK_OOD = SVN_PROP_PREFIX ++ "check-ood";
pub const SVN_FS__PROP_TXN_CLIENT_DATE = SVN_PROP_PREFIX ++ "client-date";
pub const timeval = struct_timeval;
pub const timespec = struct_timespec;
pub const __pthread_internal_list = struct___pthread_internal_list;
pub const __pthread_internal_slist = struct___pthread_internal_slist;
pub const __pthread_mutex_s = struct___pthread_mutex_s;
pub const __pthread_rwlock_arch_t = struct___pthread_rwlock_arch_t;
pub const __pthread_cond_s = struct___pthread_cond_s;
pub const iovec = struct_iovec;
pub const __socket_type = enum___socket_type;
pub const sockaddr = struct_sockaddr;
pub const sockaddr_storage = struct_sockaddr_storage;
pub const msghdr = struct_msghdr;
pub const cmsghdr = struct_cmsghdr;
pub const linger = struct_linger;
pub const osockaddr = struct_osockaddr;
pub const sigval = union_sigval;
pub const sigevent = struct_sigevent;
pub const _fpx_sw_bytes = struct__fpx_sw_bytes;
pub const _fpreg = struct__fpreg;
pub const _fpxreg = struct__fpxreg;
pub const _xmmreg = struct__xmmreg;
pub const _fpstate = struct__fpstate;
pub const sigcontext = struct_sigcontext;
pub const _xsave_hdr = struct__xsave_hdr;
pub const _ymmh_state = struct__ymmh_state;
pub const _xstate = struct__xstate;
pub const _libc_fpxreg = struct__libc_fpxreg;
pub const _libc_xmmreg = struct__libc_xmmreg;
pub const _libc_fpstate = struct__libc_fpstate;
pub const rusage = struct_rusage;
pub const __locale_struct = struct___locale_struct;
pub const _G_fpos_t = struct__G_fpos_t;
pub const _G_fpos64_t = struct__G_fpos64_t;
pub const _IO_marker = struct__IO_marker;
pub const _IO_codecvt = struct__IO_codecvt;
pub const _IO_wide_data = struct__IO_wide_data;
pub const _IO_FILE = struct__IO_FILE;
pub const random_data = struct_random_data;
pub const drand48_data = struct_drand48_data;
pub const svn__null_pointer_constant_stdarg_sentinel_t = struct_svn__null_pointer_constant_stdarg_sentinel_t;
pub const svn_recurse_kind = enum_svn_recurse_kind;
pub const timezone = struct_timezone;
pub const __itimer_which = enum___itimer_which;
pub const itimerval = struct_itimerval;
pub const __rlimit_resource = enum___rlimit_resource;
pub const rlimit = struct_rlimit;
pub const __rusage_who = enum___rusage_who;
pub const __priority_which = enum___priority_which;
pub const svn_delta_action = enum_svn_delta_action;
pub const svn_prop_kind = enum_svn_prop_kind;
