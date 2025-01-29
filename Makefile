TARGETS := build root run clean
INITRD := initramfs.cpio.gz
ROOTFS := rootfs
export BIN := $(CURDIR)/$(ROOTFS)/bin
.PHONY: default $(TARGETS)

default:
	@echo $(TARGETS)

build:
	mkdir -p $(BIN)
	$(MAKE) -C src

root: build
	@cd $(ROOTFS) && find . -print0 | cpio --null -ov --format=newc | gzip >../$(INITRD)

run: $(INITRD) bzImage
	@qemu-system-x86_64 \
	  -m 128 \
	  -nographic \
	  -serial mon:stdio \
	  -kernel bzImage \
	  -initrd initramfs.cpio.gz \
	  -append "console=ttyS0"

clean:
	@-rm -r $(ROOTFS)
	@-rm $(INITRD)
