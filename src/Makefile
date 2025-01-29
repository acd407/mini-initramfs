SRCS := $(wildcard *.c)
OBJS := $(SRCS:.c=)
CFLAGS += -nostdlib -ffreestanding -z noexecstack -static
CC := clang

build: $(OBJS)
	$(MAKE) -C shell
	@echo $(OBJS)

% : %.c
	$(CC) $(CFLAGS) $< -o $(BIN)/$@
