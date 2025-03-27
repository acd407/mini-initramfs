#include <string.h>

unsigned long strlen (const char *str) {
    int count = 0;
    while (str[count])
        count++;
    return count;
}

void *memset (void *dst, int c, unsigned long n) {
    char *cdst = (char *) dst;
    int i;
    for (i = 0; i < n; i++) {
        cdst[i] = c;
    }
    return dst;
}

void *memmove (void *__dest, const void *__src, size_t __n) {
    const char *src = __src;
    char *dest = __dest;
    for (int i = 0; i < __n; i++) {
        dest[i] = src[i];
    }
    return __dest;
}

char *strcpy (char *dest, const char *src) {
    return memmove (dest, src, strlen (src) + 1);
}
