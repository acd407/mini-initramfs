.global write
.global fsync
.global _exit
.global fork
.global waitid
.global read
.global execve
.global waitpid

write:
    movq $1, %rax
    syscall
    ret

fsync:
    movq $74, %rax
    syscall
    ret

_exit:
    movq $60, %rax
    syscall

fork:
    movq $57, %rax
    syscall
    ret

waitid:
    movq $247, %rax
    movq %rcx, %r10
    syscall
    ret

read:
    movq $0, %rax
    syscall
    ret

execve:
    movq $59, %rax
    syscall
    ret

waitpid:
    movq $7, %rax
    syscall
    ret
