SRCS := $(wildcard *.c)
OBJS := $(SRCS:.c=.o)
BINS := $(patsubst %.c,%,$(SRCS))
export CFLAGS += -s -nostdlib -ffreestanding -fno-stack-protector -I$(CURDIR)/include

default: $(BINS)

libc/libc.a:
	$(MAKE) -C libc

syscall.S:
	./syscall.sh

syscall.o: syscall.S

$(BINS): %: %.o syscall.o libc/libc.a
	ld -o $(OUTPUT)/$@ $^

clean:
	$(MAKE) -C libc clean
	rm -f $(OBJS)
	rm -f syscall.S syscall.o

.PHONY: default clean
