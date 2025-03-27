#ifndef _H_ASSERT

#include <unistd.h>
#include <utils.h>
#ifndef NDEBUG
#define assert(cond)                                                           \
    do {                                                                       \
        if (!(cond)) {                                                         \
            const char msg[] = "Assertion failed: " #cond " at " __FILE__      \
                               ":" STR (__LINE__) "\n";                        \
            write (STDERR_FILENO, msg, sizeof (msg) - 1);                      \
            exit (EXIT_FAILURE);                                               \
        }                                                                      \
    } while (0)
#else
#define assert(cond) ((void) 0)
#endif

#endif
