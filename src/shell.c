#include <stdint.h>
#include <stdlib.h>
#include <sys/syscall.h>
#include <sys/wait.h>
#include <unistd.h>

#define _STR(x) #x
#define STR(x)  _STR (x)

#ifndef NDEBUG
#define assert(cond)                                                           \
    do {                                                                       \
        if (! (cond)) {                                                        \
            const char msg[] = "Assertion failed: " #cond " at " __FILE__      \
                               ":" STR (__LINE__) "\n";                        \
            write (STDERR_FILENO, msg, sizeof (msg) - 1);                      \
            exit (EXIT_FAILURE);                                               \
        }                                                                      \
    } while (0)
#else
#define assert(cond) ((void) 0)
#endif

int64_t _syscall (
    int64_t syscallnum, int64_t arg0, int64_t arg1, int64_t arg2, int64_t arg3,
    int64_t arg4, int64_t arg5
) {
    register int64_t rax asm ("rax") = syscallnum;
    register int64_t rdi asm ("rdi") = arg0;
    register int64_t rsi asm ("rsi") = arg1;
    register int64_t rdx asm ("rdx") = arg2;
    register int64_t r10 asm ("r10") = arg3;
    register int64_t r8 asm ("r8") = arg4;
    register int64_t r9 asm ("r9") = arg5;

    // Execute the syscall instruction.
    asm volatile (
        "syscall"
        : "+a"(rax) // rax is both an input and output operand
        : "D"(rdi), "S"(rsi), "d"(rdx), "r"(r10), "r"(r8),
          "r"(r9) // remaining arguments in any general-purpose register
        : "rcx", "r11",
          "memory" // syscall modifies rcx and r11, and may affect memory
    );

    // Handle potential error codes.
    if ((uint64_t) (rax) >= (uint64_t) (-125)) {
        // This indicates an error has occurred.
        // You might want to set errno or handle the error here.
    }

    return rax;
}

ssize_t write (int __fd, const void *__buf, size_t __n) {
    return _syscall (SYS_write, __fd, (int64_t) __buf, __n, 0, 0, 0);
}

int fsync (int __fd) { return _syscall (SYS_fsync, __fd, 0, 0, 0, 0, 0); }

#define exit _exit
void _exit (int __status) {
    _syscall (SYS_exit, __status, 0, 0, 0, 0, 0);
    while (1)
        ;
}

__pid_t fork (void) { return _syscall (SYS_fork, 0, 0, 0, 0, 0, 0); }

int waitid (idtype_t __idtype, __id_t __id, siginfo_t *__infop, int __options) {
    return _syscall (
        SYS_waitid, __idtype, __id, (int64_t) __infop, __options, 0, 0
    );
}

ssize_t read (int __fd, void *__buf, size_t __nbytes) {
    return _syscall (SYS_read, __fd, (int64_t) __buf, __nbytes, 0, 0, 0);
}

int execve (const char *__path, char *const __argv[], char *const __envp[]) {
    return _syscall (
        SYS_execve, (int64_t) __path, (int64_t) __argv, (int64_t) __envp, 0, 0,
        0
    );
}

unsigned long strlen (const char *str) {
    int count = 0;
    while (str[count])
        count++;
    return count;
}

void perror (const char *msg) {
    write (STDERR_FILENO, msg, strlen (msg));
    fsync (STDERR_FILENO);
}

void *memset (void *dst, int c, unsigned long n) {
    char *cdst = (char *) dst;
    int i;
    for (i = 0; i < n; i++) {
        cdst[i] = c;
    }
    return dst;
}

#define READBUF 80
#define ARGSBUF 20

void _start (void) {
    char const command_prompt[] = "# "; // 最后有一个 \0
    while (1) {
        write (STDOUT_FILENO, command_prompt, sizeof (command_prompt) - 1);

        // 获取用户输入
        char input_buf[READBUF] = {0};
        read (STDIN_FILENO, input_buf, READBUF);
        // 解析要执行的命令
        int input_len = strlen (input_buf);
        if (input_len == 0)
            break;
        else if (input_len == 1) // 就一个换行
            continue;
        input_buf[input_len - 1] = '\0';
        // 解析命令行参数
        int args_count = 1;
        char *args_p_buf[ARGSBUF] = {[0] = input_buf, 0};
        for (int i = 0; i < input_len; i++)
            if (input_buf[i] == ' ')
                input_buf[i] = '\0';
        for (int i = 0; i < input_len; i++)
            if (input_buf[i] == '\0' && input_buf[i + 1] != '\0')
                args_p_buf[args_count++] = input_buf + i + 1;

        pid_t pid = fork();
        if (pid) {
            siginfo_t info;
            if (waitid (P_PID, pid, &info, WEXITED) == -1) {
                perror ("waitid failed\n");
                exit (EXIT_FAILURE);
            }
        } else {
            execve (input_buf, args_p_buf, NULL);
            perror ("unknown command\n");
            exit (EXIT_FAILURE);
        }
    }
    exit (EXIT_SUCCESS);
}
