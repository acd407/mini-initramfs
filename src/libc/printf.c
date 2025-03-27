#include <stdarg.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>

volatile int panicked = 0;

static char digits[] = "0123456789abcdef";

int fputchar (int __fileno, int __c) {
    write (__fileno, &__c, 1);
    return __c;
}

static void printint (int __fileno, int64_t xx, int base, int sign) {
    char buf[16];
    uint64_t x;

    if (sign && (sign = (xx < 0)))
        x = -xx;
    else
        x = xx;

    int i = 0;
    do {
        buf[i++] = digits[x % base];
    } while ((x /= base) != 0);

    if (sign)
        buf[i++] = '-';

    while (--i >= 0)
        fputchar (__fileno, buf[i]);
}

static void printptr (int __fileno, uint64_t x) {
    int i;
    fputchar (__fileno, '0');
    fputchar (__fileno, 'x');
    for (i = 0; i < (sizeof (uint64_t) * 2); i++, x <<= 4)
        fputchar (__fileno, digits[x >> (sizeof (uint64_t) * 8 - 4)]);
}

int fprintf (int __fileno, const char *__restrict __format, ...) {
    va_list ap;
    int i, cx, c0, c1, c2;
    char *s;

    va_start (ap, __format);
    for (i = 0; (cx = __format[i] & 0xff) != 0; i++) {
        if (cx != '%') {
            fputchar (__fileno, cx);
            continue;
        }
        i++;
        c0 = __format[i + 0] & 0xff;
        c1 = c2 = 0;
        if (c0)
            c1 = __format[i + 1] & 0xff;
        if (c1)
            c2 = __format[i + 2] & 0xff;
        if (c0 == 'd') {
            printint (__fileno, va_arg (ap, int), 10, 1);
        } else if (c0 == 'l' && c1 == 'd') {
            printint (__fileno, va_arg (ap, uint64_t), 10, 1);
            i += 1;
        } else if (c0 == 'l' && c1 == 'l' && c2 == 'd') {
            printint (__fileno, va_arg (ap, uint64_t), 10, 1);
            i += 2;
        } else if (c0 == 'u') {
            printint (__fileno, va_arg (ap, int), 10, 0);
        } else if (c0 == 'l' && c1 == 'u') {
            printint (__fileno, va_arg (ap, uint64_t), 10, 0);
            i += 1;
        } else if (c0 == 'l' && c1 == 'l' && c2 == 'u') {
            printint (__fileno, va_arg (ap, uint64_t), 10, 0);
            i += 2;
        } else if (c0 == 'x') {
            printint (__fileno, va_arg (ap, int), 16, 0);
        } else if (c0 == 'l' && c1 == 'x') {
            printint (__fileno, va_arg (ap, uint64_t), 16, 0);
            i += 1;
        } else if (c0 == 'l' && c1 == 'l' && c2 == 'x') {
            printint (__fileno, va_arg (ap, uint64_t), 16, 0);
            i += 2;
        } else if (c0 == 'p') {
            printptr (__fileno, va_arg (ap, uint64_t));
        } else if (c0 == 's') {
            if ((s = va_arg (ap, char *)) == 0)
                s = "(null)";
            for (; *s; s++)
                fputchar (__fileno, *s);
        } else if (c0 == '%') {
            fputchar (__fileno, '%');
        } else if (c0 == 0) {
            break;
        } else {
            // Print unknown % sequence to draw attention.
            fputchar (__fileno, '%');
            fputchar (__fileno, c0);
        }
    }
    va_end (ap);

    return 0;
}

int fputs (int __fileno, char *__str) {
    return fprintf (__fileno, __str);
}

int printf (const char *format, ...) {
    va_list args;
    int result;

    va_start (args, format);
    result = fprintf (STDOUT_FILENO, format, args);
    va_end (args);

    return result;
}

int putchar (int __c) {
    return fputchar (STDOUT_FILENO, __c);
}

int puts (int __fileno, char *__str) {
    return fputs (STDOUT_FILENO, __str);
}
