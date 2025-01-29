CFLAGS += -c -nostdlib -ffreestanding -fno-stack-protector
LDFLAGS += -static -s

.PHONY: default clean

default: shell.o syscall.o
	$(LD) $(LDFLAGS) $^ -o $(BIN)/$@

%.o : %.c
	$(CC) $(CFLAGS) $< -o $@

%.o : %.S
	$(AS) $< -o $@

clean:
	@-rm shell.o syscall.o
