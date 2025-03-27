.global read
read:
    movq $0, %rax
    syscall
    ret

.global write
write:
    movq $1, %rax
    syscall
    ret

.global open
open:
    movq $2, %rax
    syscall
    ret

.global close
close:
    movq $3, %rax
    syscall
    ret

.global newstat
newstat:
    movq $4, %rax
    syscall
    ret

.global newfstat
newfstat:
    movq $5, %rax
    syscall
    ret

.global newlstat
newlstat:
    movq $6, %rax
    syscall
    ret

.global poll
poll:
    movq $7, %rax
    syscall
    ret

.global lseek
lseek:
    movq $8, %rax
    syscall
    ret

.global mmap
mmap:
    movq $9, %rax
    movq %rcx, %r10
    syscall
    ret

.global mprotect
mprotect:
    movq $10, %rax
    syscall
    ret

.global munmap
munmap:
    movq $11, %rax
    syscall
    ret

.global brk
brk:
    movq $12, %rax
    syscall
    ret

.global rt_sigaction
rt_sigaction:
    movq $13, %rax
    movq %rcx, %r10
    syscall
    ret

.global rt_sigprocmask
rt_sigprocmask:
    movq $14, %rax
    movq %rcx, %r10
    syscall
    ret

.global rt_sigreturn
rt_sigreturn:
    movq $15, %rax
    syscall
    ret

.global ioctl
ioctl:
    movq $16, %rax
    syscall
    ret

.global pread64
pread64:
    movq $17, %rax
    movq %rcx, %r10
    syscall
    ret

.global pwrite64
pwrite64:
    movq $18, %rax
    movq %rcx, %r10
    syscall
    ret

.global readv
readv:
    movq $19, %rax
    syscall
    ret

.global writev
writev:
    movq $20, %rax
    syscall
    ret

.global access
access:
    movq $21, %rax
    syscall
    ret

.global pipe
pipe:
    movq $22, %rax
    syscall
    ret

.global select
select:
    movq $23, %rax
    movq %rcx, %r10
    syscall
    ret

.global sched_yield
sched_yield:
    movq $24, %rax
    syscall
    ret

.global mremap
mremap:
    movq $25, %rax
    movq %rcx, %r10
    syscall
    ret

.global msync
msync:
    movq $26, %rax
    syscall
    ret

.global mincore
mincore:
    movq $27, %rax
    syscall
    ret

.global madvise
madvise:
    movq $28, %rax
    syscall
    ret

.global shmget
shmget:
    movq $29, %rax
    syscall
    ret

.global shmat
shmat:
    movq $30, %rax
    syscall
    ret

.global shmctl
shmctl:
    movq $31, %rax
    syscall
    ret

.global dup
dup:
    movq $32, %rax
    syscall
    ret

.global dup2
dup2:
    movq $33, %rax
    syscall
    ret

.global pause
pause:
    movq $34, %rax
    syscall
    ret

.global nanosleep
nanosleep:
    movq $35, %rax
    syscall
    ret

.global getitimer
getitimer:
    movq $36, %rax
    syscall
    ret

.global alarm
alarm:
    movq $37, %rax
    syscall
    ret

.global setitimer
setitimer:
    movq $38, %rax
    syscall
    ret

.global getpid
getpid:
    movq $39, %rax
    syscall
    ret

.global sendfile64
sendfile64:
    movq $40, %rax
    movq %rcx, %r10
    syscall
    ret

.global socket
socket:
    movq $41, %rax
    syscall
    ret

.global connect
connect:
    movq $42, %rax
    syscall
    ret

.global accept
accept:
    movq $43, %rax
    syscall
    ret

.global sendto
sendto:
    movq $44, %rax
    movq %rcx, %r10
    syscall
    ret

.global recvfrom
recvfrom:
    movq $45, %rax
    movq %rcx, %r10
    syscall
    ret

.global sendmsg
sendmsg:
    movq $46, %rax
    syscall
    ret

.global recvmsg
recvmsg:
    movq $47, %rax
    syscall
    ret

.global shutdown
shutdown:
    movq $48, %rax
    syscall
    ret

.global bind
bind:
    movq $49, %rax
    syscall
    ret

.global listen
listen:
    movq $50, %rax
    syscall
    ret

.global getsockname
getsockname:
    movq $51, %rax
    syscall
    ret

.global getpeername
getpeername:
    movq $52, %rax
    syscall
    ret

.global socketpair
socketpair:
    movq $53, %rax
    movq %rcx, %r10
    syscall
    ret

.global setsockopt
setsockopt:
    movq $54, %rax
    movq %rcx, %r10
    syscall
    ret

.global getsockopt
getsockopt:
    movq $55, %rax
    movq %rcx, %r10
    syscall
    ret

.global clone
clone:
    movq $56, %rax
    movq %rcx, %r10
    syscall
    ret

.global fork
fork:
    movq $57, %rax
    syscall
    ret

.global vfork
vfork:
    movq $58, %rax
    syscall
    ret

.global execve
execve:
    movq $59, %rax
    syscall
    ret

.global exit
exit:
    movq $60, %rax
    syscall
    ret

.global wait4
wait4:
    movq $61, %rax
    movq %rcx, %r10
    syscall
    ret

.global kill
kill:
    movq $62, %rax
    syscall
    ret

.global newuname
newuname:
    movq $63, %rax
    syscall
    ret

.global semget
semget:
    movq $64, %rax
    syscall
    ret

.global semop
semop:
    movq $65, %rax
    syscall
    ret

.global semctl
semctl:
    movq $66, %rax
    movq %rcx, %r10
    syscall
    ret

.global shmdt
shmdt:
    movq $67, %rax
    syscall
    ret

.global msgget
msgget:
    movq $68, %rax
    syscall
    ret

.global msgsnd
msgsnd:
    movq $69, %rax
    movq %rcx, %r10
    syscall
    ret

.global msgrcv
msgrcv:
    movq $70, %rax
    movq %rcx, %r10
    syscall
    ret

.global msgctl
msgctl:
    movq $71, %rax
    syscall
    ret

.global fcntl
fcntl:
    movq $72, %rax
    syscall
    ret

.global flock
flock:
    movq $73, %rax
    syscall
    ret

.global fsync
fsync:
    movq $74, %rax
    syscall
    ret

.global fdatasync
fdatasync:
    movq $75, %rax
    syscall
    ret

.global truncate
truncate:
    movq $76, %rax
    syscall
    ret

.global ftruncate
ftruncate:
    movq $77, %rax
    syscall
    ret

.global getdents
getdents:
    movq $78, %rax
    syscall
    ret

.global getcwd
getcwd:
    movq $79, %rax
    syscall
    ret

.global chdir
chdir:
    movq $80, %rax
    syscall
    ret

.global fchdir
fchdir:
    movq $81, %rax
    syscall
    ret

.global rename
rename:
    movq $82, %rax
    syscall
    ret

.global mkdir
mkdir:
    movq $83, %rax
    syscall
    ret

.global rmdir
rmdir:
    movq $84, %rax
    syscall
    ret

.global creat
creat:
    movq $85, %rax
    syscall
    ret

.global link
link:
    movq $86, %rax
    syscall
    ret

.global unlink
unlink:
    movq $87, %rax
    syscall
    ret

.global symlink
symlink:
    movq $88, %rax
    syscall
    ret

.global readlink
readlink:
    movq $89, %rax
    syscall
    ret

.global chmod
chmod:
    movq $90, %rax
    syscall
    ret

.global fchmod
fchmod:
    movq $91, %rax
    syscall
    ret

.global chown
chown:
    movq $92, %rax
    syscall
    ret

.global fchown
fchown:
    movq $93, %rax
    syscall
    ret

.global lchown
lchown:
    movq $94, %rax
    syscall
    ret

.global umask
umask:
    movq $95, %rax
    syscall
    ret

.global gettimeofday
gettimeofday:
    movq $96, %rax
    syscall
    ret

.global getrlimit
getrlimit:
    movq $97, %rax
    syscall
    ret

.global getrusage
getrusage:
    movq $98, %rax
    syscall
    ret

.global sysinfo
sysinfo:
    movq $99, %rax
    syscall
    ret

.global times
times:
    movq $100, %rax
    syscall
    ret

.global ptrace
ptrace:
    movq $101, %rax
    movq %rcx, %r10
    syscall
    ret

.global getuid
getuid:
    movq $102, %rax
    syscall
    ret

.global syslog
syslog:
    movq $103, %rax
    syscall
    ret

.global getgid
getgid:
    movq $104, %rax
    syscall
    ret

.global setuid
setuid:
    movq $105, %rax
    syscall
    ret

.global setgid
setgid:
    movq $106, %rax
    syscall
    ret

.global geteuid
geteuid:
    movq $107, %rax
    syscall
    ret

.global getegid
getegid:
    movq $108, %rax
    syscall
    ret

.global setpgid
setpgid:
    movq $109, %rax
    syscall
    ret

.global getppid
getppid:
    movq $110, %rax
    syscall
    ret

.global getpgrp
getpgrp:
    movq $111, %rax
    syscall
    ret

.global setsid
setsid:
    movq $112, %rax
    syscall
    ret

.global setreuid
setreuid:
    movq $113, %rax
    syscall
    ret

.global setregid
setregid:
    movq $114, %rax
    syscall
    ret

.global getgroups
getgroups:
    movq $115, %rax
    syscall
    ret

.global setgroups
setgroups:
    movq $116, %rax
    syscall
    ret

.global setresuid
setresuid:
    movq $117, %rax
    syscall
    ret

.global getresuid
getresuid:
    movq $118, %rax
    syscall
    ret

.global setresgid
setresgid:
    movq $119, %rax
    syscall
    ret

.global getresgid
getresgid:
    movq $120, %rax
    syscall
    ret

.global getpgid
getpgid:
    movq $121, %rax
    syscall
    ret

.global setfsuid
setfsuid:
    movq $122, %rax
    syscall
    ret

.global setfsgid
setfsgid:
    movq $123, %rax
    syscall
    ret

.global getsid
getsid:
    movq $124, %rax
    syscall
    ret

.global capget
capget:
    movq $125, %rax
    syscall
    ret

.global capset
capset:
    movq $126, %rax
    syscall
    ret

.global rt_sigpending
rt_sigpending:
    movq $127, %rax
    syscall
    ret

.global rt_sigtimedwait
rt_sigtimedwait:
    movq $128, %rax
    movq %rcx, %r10
    syscall
    ret

.global rt_sigqueueinfo
rt_sigqueueinfo:
    movq $129, %rax
    syscall
    ret

.global rt_sigsuspend
rt_sigsuspend:
    movq $130, %rax
    syscall
    ret

.global sigaltstack
sigaltstack:
    movq $131, %rax
    syscall
    ret

.global utime
utime:
    movq $132, %rax
    syscall
    ret

.global mknod
mknod:
    movq $133, %rax
    syscall
    ret

.global personality
personality:
    movq $135, %rax
    syscall
    ret

.global ustat
ustat:
    movq $136, %rax
    syscall
    ret

.global statfs
statfs:
    movq $137, %rax
    syscall
    ret

.global fstatfs
fstatfs:
    movq $138, %rax
    syscall
    ret

.global sysfs
sysfs:
    movq $139, %rax
    syscall
    ret

.global getpriority
getpriority:
    movq $140, %rax
    syscall
    ret

.global setpriority
setpriority:
    movq $141, %rax
    syscall
    ret

.global sched_setparam
sched_setparam:
    movq $142, %rax
    syscall
    ret

.global sched_getparam
sched_getparam:
    movq $143, %rax
    syscall
    ret

.global sched_setscheduler
sched_setscheduler:
    movq $144, %rax
    syscall
    ret

.global sched_getscheduler
sched_getscheduler:
    movq $145, %rax
    syscall
    ret

.global sched_get_priority_max
sched_get_priority_max:
    movq $146, %rax
    syscall
    ret

.global sched_get_priority_min
sched_get_priority_min:
    movq $147, %rax
    syscall
    ret

.global sched_rr_get_interval
sched_rr_get_interval:
    movq $148, %rax
    syscall
    ret

.global mlock
mlock:
    movq $149, %rax
    syscall
    ret

.global munlock
munlock:
    movq $150, %rax
    syscall
    ret

.global mlockall
mlockall:
    movq $151, %rax
    syscall
    ret

.global munlockall
munlockall:
    movq $152, %rax
    syscall
    ret

.global vhangup
vhangup:
    movq $153, %rax
    syscall
    ret

.global modify_ldt
modify_ldt:
    movq $154, %rax
    syscall
    ret

.global pivot_root
pivot_root:
    movq $155, %rax
    syscall
    ret

.global prctl
prctl:
    movq $157, %rax
    movq %rcx, %r10
    syscall
    ret

.global arch_prctl
arch_prctl:
    movq $158, %rax
    syscall
    ret

.global adjtimex
adjtimex:
    movq $159, %rax
    syscall
    ret

.global setrlimit
setrlimit:
    movq $160, %rax
    syscall
    ret

.global chroot
chroot:
    movq $161, %rax
    syscall
    ret

.global sync
sync:
    movq $162, %rax
    syscall
    ret

.global acct
acct:
    movq $163, %rax
    syscall
    ret

.global settimeofday
settimeofday:
    movq $164, %rax
    syscall
    ret

.global mount
mount:
    movq $165, %rax
    movq %rcx, %r10
    syscall
    ret

.global umount
umount:
    movq $166, %rax
    syscall
    ret

.global swapon
swapon:
    movq $167, %rax
    syscall
    ret

.global swapoff
swapoff:
    movq $168, %rax
    syscall
    ret

.global reboot
reboot:
    movq $169, %rax
    movq %rcx, %r10
    syscall
    ret

.global sethostname
sethostname:
    movq $170, %rax
    syscall
    ret

.global setdomainname
setdomainname:
    movq $171, %rax
    syscall
    ret

.global iopl
iopl:
    movq $172, %rax
    syscall
    ret

.global ioperm
ioperm:
    movq $173, %rax
    syscall
    ret

.global init_module
init_module:
    movq $175, %rax
    syscall
    ret

.global delete_module
delete_module:
    movq $176, %rax
    syscall
    ret

.global quotactl
quotactl:
    movq $179, %rax
    movq %rcx, %r10
    syscall
    ret

.global gettid
gettid:
    movq $186, %rax
    syscall
    ret

.global readahead
readahead:
    movq $187, %rax
    syscall
    ret

.global setxattr
setxattr:
    movq $188, %rax
    movq %rcx, %r10
    syscall
    ret

.global lsetxattr
lsetxattr:
    movq $189, %rax
    movq %rcx, %r10
    syscall
    ret

.global fsetxattr
fsetxattr:
    movq $190, %rax
    movq %rcx, %r10
    syscall
    ret

.global getxattr
getxattr:
    movq $191, %rax
    movq %rcx, %r10
    syscall
    ret

.global lgetxattr
lgetxattr:
    movq $192, %rax
    movq %rcx, %r10
    syscall
    ret

.global fgetxattr
fgetxattr:
    movq $193, %rax
    movq %rcx, %r10
    syscall
    ret

.global listxattr
listxattr:
    movq $194, %rax
    syscall
    ret

.global llistxattr
llistxattr:
    movq $195, %rax
    syscall
    ret

.global flistxattr
flistxattr:
    movq $196, %rax
    syscall
    ret

.global removexattr
removexattr:
    movq $197, %rax
    syscall
    ret

.global lremovexattr
lremovexattr:
    movq $198, %rax
    syscall
    ret

.global fremovexattr
fremovexattr:
    movq $199, %rax
    syscall
    ret

.global tkill
tkill:
    movq $200, %rax
    syscall
    ret

.global time
time:
    movq $201, %rax
    syscall
    ret

.global futex
futex:
    movq $202, %rax
    movq %rcx, %r10
    syscall
    ret

.global sched_setaffinity
sched_setaffinity:
    movq $203, %rax
    syscall
    ret

.global sched_getaffinity
sched_getaffinity:
    movq $204, %rax
    syscall
    ret

.global io_setup
io_setup:
    movq $206, %rax
    syscall
    ret

.global io_destroy
io_destroy:
    movq $207, %rax
    syscall
    ret

.global io_getevents
io_getevents:
    movq $208, %rax
    movq %rcx, %r10
    syscall
    ret

.global io_submit
io_submit:
    movq $209, %rax
    syscall
    ret

.global io_cancel
io_cancel:
    movq $210, %rax
    syscall
    ret

.global epoll_create
epoll_create:
    movq $213, %rax
    syscall
    ret

.global remap_file_pages
remap_file_pages:
    movq $216, %rax
    movq %rcx, %r10
    syscall
    ret

.global getdents64
getdents64:
    movq $217, %rax
    syscall
    ret

.global set_tid_address
set_tid_address:
    movq $218, %rax
    syscall
    ret

.global restart_syscall
restart_syscall:
    movq $219, %rax
    syscall
    ret

.global semtimedop
semtimedop:
    movq $220, %rax
    movq %rcx, %r10
    syscall
    ret

.global fadvise64
fadvise64:
    movq $221, %rax
    movq %rcx, %r10
    syscall
    ret

.global timer_create
timer_create:
    movq $222, %rax
    syscall
    ret

.global timer_settime
timer_settime:
    movq $223, %rax
    movq %rcx, %r10
    syscall
    ret

.global timer_gettime
timer_gettime:
    movq $224, %rax
    syscall
    ret

.global timer_getoverrun
timer_getoverrun:
    movq $225, %rax
    syscall
    ret

.global timer_delete
timer_delete:
    movq $226, %rax
    syscall
    ret

.global clock_settime
clock_settime:
    movq $227, %rax
    syscall
    ret

.global clock_gettime
clock_gettime:
    movq $228, %rax
    syscall
    ret

.global clock_getres
clock_getres:
    movq $229, %rax
    syscall
    ret

.global clock_nanosleep
clock_nanosleep:
    movq $230, %rax
    movq %rcx, %r10
    syscall
    ret

.global exit_group
exit_group:
    movq $231, %rax
    syscall
    ret

.global epoll_wait
epoll_wait:
    movq $232, %rax
    movq %rcx, %r10
    syscall
    ret

.global epoll_ctl
epoll_ctl:
    movq $233, %rax
    movq %rcx, %r10
    syscall
    ret

.global tgkill
tgkill:
    movq $234, %rax
    syscall
    ret

.global utimes
utimes:
    movq $235, %rax
    syscall
    ret

.global mbind
mbind:
    movq $237, %rax
    movq %rcx, %r10
    syscall
    ret

.global set_mempolicy
set_mempolicy:
    movq $238, %rax
    syscall
    ret

.global get_mempolicy
get_mempolicy:
    movq $239, %rax
    movq %rcx, %r10
    syscall
    ret

.global mq_open
mq_open:
    movq $240, %rax
    movq %rcx, %r10
    syscall
    ret

.global mq_unlink
mq_unlink:
    movq $241, %rax
    syscall
    ret

.global mq_timedsend
mq_timedsend:
    movq $242, %rax
    movq %rcx, %r10
    syscall
    ret

.global mq_timedreceive
mq_timedreceive:
    movq $243, %rax
    movq %rcx, %r10
    syscall
    ret

.global mq_notify
mq_notify:
    movq $244, %rax
    syscall
    ret

.global mq_getsetattr
mq_getsetattr:
    movq $245, %rax
    syscall
    ret

.global kexec_load
kexec_load:
    movq $246, %rax
    movq %rcx, %r10
    syscall
    ret

.global waitid
waitid:
    movq $247, %rax
    movq %rcx, %r10
    syscall
    ret

.global add_key
add_key:
    movq $248, %rax
    movq %rcx, %r10
    syscall
    ret

.global request_key
request_key:
    movq $249, %rax
    movq %rcx, %r10
    syscall
    ret

.global keyctl
keyctl:
    movq $250, %rax
    movq %rcx, %r10
    syscall
    ret

.global ioprio_set
ioprio_set:
    movq $251, %rax
    syscall
    ret

.global ioprio_get
ioprio_get:
    movq $252, %rax
    syscall
    ret

.global inotify_init
inotify_init:
    movq $253, %rax
    syscall
    ret

.global inotify_add_watch
inotify_add_watch:
    movq $254, %rax
    syscall
    ret

.global inotify_rm_watch
inotify_rm_watch:
    movq $255, %rax
    syscall
    ret

.global migrate_pages
migrate_pages:
    movq $256, %rax
    movq %rcx, %r10
    syscall
    ret

.global openat
openat:
    movq $257, %rax
    movq %rcx, %r10
    syscall
    ret

.global mkdirat
mkdirat:
    movq $258, %rax
    syscall
    ret

.global mknodat
mknodat:
    movq $259, %rax
    movq %rcx, %r10
    syscall
    ret

.global fchownat
fchownat:
    movq $260, %rax
    movq %rcx, %r10
    syscall
    ret

.global futimesat
futimesat:
    movq $261, %rax
    syscall
    ret

.global newfstatat
newfstatat:
    movq $262, %rax
    movq %rcx, %r10
    syscall
    ret

.global unlinkat
unlinkat:
    movq $263, %rax
    syscall
    ret

.global renameat
renameat:
    movq $264, %rax
    movq %rcx, %r10
    syscall
    ret

.global linkat
linkat:
    movq $265, %rax
    movq %rcx, %r10
    syscall
    ret

.global symlinkat
symlinkat:
    movq $266, %rax
    syscall
    ret

.global readlinkat
readlinkat:
    movq $267, %rax
    movq %rcx, %r10
    syscall
    ret

.global fchmodat
fchmodat:
    movq $268, %rax
    syscall
    ret

.global faccessat
faccessat:
    movq $269, %rax
    syscall
    ret

.global pselect6
pselect6:
    movq $270, %rax
    movq %rcx, %r10
    syscall
    ret

.global ppoll
ppoll:
    movq $271, %rax
    movq %rcx, %r10
    syscall
    ret

.global unshare
unshare:
    movq $272, %rax
    syscall
    ret

.global set_robust_list
set_robust_list:
    movq $273, %rax
    syscall
    ret

.global get_robust_list
get_robust_list:
    movq $274, %rax
    syscall
    ret

.global splice
splice:
    movq $275, %rax
    movq %rcx, %r10
    syscall
    ret

.global tee
tee:
    movq $276, %rax
    movq %rcx, %r10
    syscall
    ret

.global sync_file_range
sync_file_range:
    movq $277, %rax
    movq %rcx, %r10
    syscall
    ret

.global vmsplice
vmsplice:
    movq $278, %rax
    movq %rcx, %r10
    syscall
    ret

.global move_pages
move_pages:
    movq $279, %rax
    movq %rcx, %r10
    syscall
    ret

.global utimensat
utimensat:
    movq $280, %rax
    movq %rcx, %r10
    syscall
    ret

.global epoll_pwait
epoll_pwait:
    movq $281, %rax
    movq %rcx, %r10
    syscall
    ret

.global signalfd
signalfd:
    movq $282, %rax
    syscall
    ret

.global timerfd_create
timerfd_create:
    movq $283, %rax
    syscall
    ret

.global eventfd
eventfd:
    movq $284, %rax
    syscall
    ret

.global fallocate
fallocate:
    movq $285, %rax
    movq %rcx, %r10
    syscall
    ret

.global timerfd_settime
timerfd_settime:
    movq $286, %rax
    movq %rcx, %r10
    syscall
    ret

.global timerfd_gettime
timerfd_gettime:
    movq $287, %rax
    syscall
    ret

.global accept4
accept4:
    movq $288, %rax
    movq %rcx, %r10
    syscall
    ret

.global signalfd4
signalfd4:
    movq $289, %rax
    movq %rcx, %r10
    syscall
    ret

.global eventfd2
eventfd2:
    movq $290, %rax
    syscall
    ret

.global epoll_create1
epoll_create1:
    movq $291, %rax
    syscall
    ret

.global dup3
dup3:
    movq $292, %rax
    syscall
    ret

.global pipe2
pipe2:
    movq $293, %rax
    syscall
    ret

.global inotify_init1
inotify_init1:
    movq $294, %rax
    syscall
    ret

.global preadv
preadv:
    movq $295, %rax
    movq %rcx, %r10
    syscall
    ret

.global pwritev
pwritev:
    movq $296, %rax
    movq %rcx, %r10
    syscall
    ret

.global rt_tgsigqueueinfo
rt_tgsigqueueinfo:
    movq $297, %rax
    movq %rcx, %r10
    syscall
    ret

.global perf_event_open
perf_event_open:
    movq $298, %rax
    movq %rcx, %r10
    syscall
    ret

.global recvmmsg
recvmmsg:
    movq $299, %rax
    movq %rcx, %r10
    syscall
    ret

.global fanotify_init
fanotify_init:
    movq $300, %rax
    syscall
    ret

.global fanotify_mark
fanotify_mark:
    movq $301, %rax
    movq %rcx, %r10
    syscall
    ret

.global prlimit64
prlimit64:
    movq $302, %rax
    movq %rcx, %r10
    syscall
    ret

.global name_to_handle_at
name_to_handle_at:
    movq $303, %rax
    movq %rcx, %r10
    syscall
    ret

.global open_by_handle_at
open_by_handle_at:
    movq $304, %rax
    syscall
    ret

.global clock_adjtime
clock_adjtime:
    movq $305, %rax
    syscall
    ret

.global syncfs
syncfs:
    movq $306, %rax
    syscall
    ret

.global sendmmsg
sendmmsg:
    movq $307, %rax
    movq %rcx, %r10
    syscall
    ret

.global setns
setns:
    movq $308, %rax
    syscall
    ret

.global getcpu
getcpu:
    movq $309, %rax
    syscall
    ret

.global process_vm_readv
process_vm_readv:
    movq $310, %rax
    movq %rcx, %r10
    syscall
    ret

.global process_vm_writev
process_vm_writev:
    movq $311, %rax
    movq %rcx, %r10
    syscall
    ret

.global kcmp
kcmp:
    movq $312, %rax
    movq %rcx, %r10
    syscall
    ret

.global finit_module
finit_module:
    movq $313, %rax
    syscall
    ret

.global sched_setattr
sched_setattr:
    movq $314, %rax
    syscall
    ret

.global sched_getattr
sched_getattr:
    movq $315, %rax
    movq %rcx, %r10
    syscall
    ret

.global renameat2
renameat2:
    movq $316, %rax
    movq %rcx, %r10
    syscall
    ret

.global seccomp
seccomp:
    movq $317, %rax
    syscall
    ret

.global getrandom
getrandom:
    movq $318, %rax
    syscall
    ret

.global memfd_create
memfd_create:
    movq $319, %rax
    syscall
    ret

.global kexec_file_load
kexec_file_load:
    movq $320, %rax
    movq %rcx, %r10
    syscall
    ret

.global bpf
bpf:
    movq $321, %rax
    syscall
    ret

.global execveat
execveat:
    movq $322, %rax
    movq %rcx, %r10
    syscall
    ret

.global userfaultfd
userfaultfd:
    movq $323, %rax
    syscall
    ret

.global membarrier
membarrier:
    movq $324, %rax
    syscall
    ret

.global mlock2
mlock2:
    movq $325, %rax
    syscall
    ret

.global copy_file_range
copy_file_range:
    movq $326, %rax
    movq %rcx, %r10
    syscall
    ret

.global preadv2
preadv2:
    movq $327, %rax
    movq %rcx, %r10
    syscall
    ret

.global pwritev2
pwritev2:
    movq $328, %rax
    movq %rcx, %r10
    syscall
    ret

.global pkey_mprotect
pkey_mprotect:
    movq $329, %rax
    movq %rcx, %r10
    syscall
    ret

.global pkey_alloc
pkey_alloc:
    movq $330, %rax
    syscall
    ret

.global pkey_free
pkey_free:
    movq $331, %rax
    syscall
    ret

.global statx
statx:
    movq $332, %rax
    movq %rcx, %r10
    syscall
    ret

.global io_pgetevents
io_pgetevents:
    movq $333, %rax
    movq %rcx, %r10
    syscall
    ret

.global rseq
rseq:
    movq $334, %rax
    movq %rcx, %r10
    syscall
    ret

.global uretprobe
uretprobe:
    movq $335, %rax
    syscall
    ret

.global pidfd_send_signal
pidfd_send_signal:
    movq $424, %rax
    movq %rcx, %r10
    syscall
    ret

.global io_uring_setup
io_uring_setup:
    movq $425, %rax
    syscall
    ret

.global io_uring_enter
io_uring_enter:
    movq $426, %rax
    movq %rcx, %r10
    syscall
    ret

.global io_uring_register
io_uring_register:
    movq $427, %rax
    movq %rcx, %r10
    syscall
    ret

.global open_tree
open_tree:
    movq $428, %rax
    syscall
    ret

.global move_mount
move_mount:
    movq $429, %rax
    movq %rcx, %r10
    syscall
    ret

.global fsopen
fsopen:
    movq $430, %rax
    syscall
    ret

.global fsconfig
fsconfig:
    movq $431, %rax
    movq %rcx, %r10
    syscall
    ret

.global fsmount
fsmount:
    movq $432, %rax
    syscall
    ret

.global fspick
fspick:
    movq $433, %rax
    syscall
    ret

.global pidfd_open
pidfd_open:
    movq $434, %rax
    syscall
    ret

.global clone3
clone3:
    movq $435, %rax
    syscall
    ret

.global close_range
close_range:
    movq $436, %rax
    syscall
    ret

.global openat2
openat2:
    movq $437, %rax
    movq %rcx, %r10
    syscall
    ret

.global pidfd_getfd
pidfd_getfd:
    movq $438, %rax
    syscall
    ret

.global faccessat2
faccessat2:
    movq $439, %rax
    movq %rcx, %r10
    syscall
    ret

.global process_madvise
process_madvise:
    movq $440, %rax
    movq %rcx, %r10
    syscall
    ret

.global epoll_pwait2
epoll_pwait2:
    movq $441, %rax
    movq %rcx, %r10
    syscall
    ret

.global mount_setattr
mount_setattr:
    movq $442, %rax
    movq %rcx, %r10
    syscall
    ret

.global quotactl_fd
quotactl_fd:
    movq $443, %rax
    movq %rcx, %r10
    syscall
    ret

.global landlock_create_ruleset
landlock_create_ruleset:
    movq $444, %rax
    syscall
    ret

.global landlock_add_rule
landlock_add_rule:
    movq $445, %rax
    movq %rcx, %r10
    syscall
    ret

.global landlock_restrict_self
landlock_restrict_self:
    movq $446, %rax
    syscall
    ret

.global memfd_secret
memfd_secret:
    movq $447, %rax
    syscall
    ret

.global process_mrelease
process_mrelease:
    movq $448, %rax
    syscall
    ret

.global futex_waitv
futex_waitv:
    movq $449, %rax
    movq %rcx, %r10
    syscall
    ret

.global set_mempolicy_home_node
set_mempolicy_home_node:
    movq $450, %rax
    movq %rcx, %r10
    syscall
    ret

.global cachestat
cachestat:
    movq $451, %rax
    movq %rcx, %r10
    syscall
    ret

.global fchmodat2
fchmodat2:
    movq $452, %rax
    movq %rcx, %r10
    syscall
    ret

.global map_shadow_stack
map_shadow_stack:
    movq $453, %rax
    syscall
    ret

.global futex_wake
futex_wake:
    movq $454, %rax
    movq %rcx, %r10
    syscall
    ret

.global futex_wait
futex_wait:
    movq $455, %rax
    movq %rcx, %r10
    syscall
    ret

.global futex_requeue
futex_requeue:
    movq $456, %rax
    movq %rcx, %r10
    syscall
    ret

.global statmount
statmount:
    movq $457, %rax
    movq %rcx, %r10
    syscall
    ret

.global listmount
listmount:
    movq $458, %rax
    movq %rcx, %r10
    syscall
    ret

.global lsm_get_self_attr
lsm_get_self_attr:
    movq $459, %rax
    movq %rcx, %r10
    syscall
    ret

.global lsm_set_self_attr
lsm_set_self_attr:
    movq $460, %rax
    movq %rcx, %r10
    syscall
    ret

.global lsm_list_modules
lsm_list_modules:
    movq $461, %rax
    syscall
    ret

.global mseal
mseal:
    movq $462, %rax
    syscall
    ret

.global setxattrat
setxattrat:
    movq $463, %rax
    movq %rcx, %r10
    syscall
    ret

.global getxattrat
getxattrat:
    movq $464, %rax
    movq %rcx, %r10
    syscall
    ret

.global listxattrat
listxattrat:
    movq $465, %rax
    movq %rcx, %r10
    syscall
    ret

.global removexattrat
removexattrat:
    movq $466, %rax
    movq %rcx, %r10
    syscall
    ret

