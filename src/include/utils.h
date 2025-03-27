#ifndef _H_UTILS

#define _STR(x) #x
#define STR(x) _STR (x)

#define _CONCAT(a, b) a##b
#define CONCAT(a, b) _CONCAT (a, b)

#endif
