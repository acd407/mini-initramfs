LIBNAME = libc.a
SO_NAME = libc.so

SRCS := $(wildcard *.c)
OBJS := $(SRCS:.c=.o)

all: $(LIBNAME) $(SO_NAME)

$(LIBNAME): $(OBJS)
	$(AR) rcs $@ $^

$(SO_NAME): $(OBJS)
	$(CC) -s -shared $(CFLAGS) -o $@ $^

%.o: %.c
	$(CC) -fPIC -c $(CFLAGS) $< -o $@

clean:
	rm -f $(OBJS) $(LIBNAME) $(SO_NAME)

# 提供一个伪目标，确保clean总是被执行，即使有同名文件存在
.PHONY: clean all
