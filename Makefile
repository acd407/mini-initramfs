INITRD := initramfs.cpio.xz
ROOTFS := rootfs
export BIN := $(CURDIR)/$(ROOTFS)/bin

.PHONY: $(ROOTFS) run debug clean

$(INITRD): $(ROOTFS)
	cd $(ROOTFS) && find . -print0 \
		| cpio --null -ov --format=newc \
		| 7z a -txz -an -si -so \
		>../$(INITRD)

$(ROOTFS):
	mkdir -p $(BIN)
	$(MAKE) -C src OUTPUT=$(BIN)
	cp -r skeleton/* $(ROOTFS)

run: $(INITRD) bzImage
	qemu-system-x86_64 \
	  -m 128 \
	  -nographic \
	  -nodefaults \
	  -serial mon:stdio \
	  -kernel bzImage \
	  -initrd $(INITRD) \
	  -append "console=ttyS0"

debug: $(INITRD) bzImage
	qemu-system-x86_64 \
	  -m 128 \
	  -nographic \
	  -nodefaults \
	  -serial mon:stdio \
	  -kernel bzImage \
	  -initrd $(INITRD) \
	  -append "console=ttyS0" \
	  -s -S

clean:
	rm -rf $(ROOTFS)
	rm -f $(INITRD)
	$(MAKE) -C src clean
