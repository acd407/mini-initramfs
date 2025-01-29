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

#define exit(x) _exit (x)

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
