SRCS := $(wildcard *.c)
OBJS := $(SRCS:.c=.o)
CFLAGS += -nostdlib -ffreestanding -z noexecstack -static

build: $(OBJS)
	@echo $(OBJS)

%.o : %.c
	$(CC) $(CFLAGS) $< -o $(BIN)/$@
