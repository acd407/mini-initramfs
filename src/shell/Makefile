CFLAGS += -nostdlib -ffreestanding -fno-stack-protector
LDFLAGS += -static

shell: shell.o syscall.o
	$(LD) $(LDFLAGS) $^ -o $(BIN)/$@

%.o : %.c
	$(CC) -c $(CFLAGS) $< -o $@

%.o : %.S
	$(AS) $< -o $@
