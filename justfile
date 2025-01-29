#!/usr/bin/env just --justfile

SRC_DIR := 'src'
ROOT_DIR := 'initramfs'
BIN_DIR := ROOT_DIR / 'bin'
INITRAMFS := 'initramfs.cpio.gz'

default:
    @just --list

build:
    #!/usr/bin/env bash
    test -d {{ BIN_DIR }} || mkdir -p {{ BIN_DIR }}
    for src in $(echo {{ SRC_DIR }}/*); do
        _basename=$(basename $src)
        clang $src -nostdlib -ffreestanding -z noexecstack -static -O0 -o {{ BIN_DIR }}/${_basename%.*}
    done
    if not test -f {{ BIN_DIR }}/init; then
        for i in {{ BIN_DIR }}/*; do
            if [[ $i =~ sh ]]; then
                ln -sv $(basename $i) {{ BIN_DIR }}/init
            fi
        done
    fi

initramfs: build
    @cd {{ ROOT_DIR }} && find . -print0 | cpio --null -ov --format=newc | gzip >../{{ INITRAMFS }}

kernel:
    @test -f bzImage

run: initramfs kernel
    @qemu-system-x86_64 \
     -m 128 \
     -nographic \
     -serial mon:stdio \
     -kernel bzImage \
     -initrd {{ INITRAMFS }} \
     -append "console=ttyS0"

clean:
    @rm -rf {{ ROOT_DIR }}
    @rm -f  {{ INITRAMFS }}
