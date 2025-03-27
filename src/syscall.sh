#!/bin/bash
echo -n >syscall.S
test -f table.json || wget https://syscalls.mebeim.net/db/x86/64/x64/latest/table.json
jq -r '.syscalls[] | "\(.number) \(.name) \(.signature | length)"' table.json |
    while read -a args; do
        if test ${args[2]} -ge 4; then
            prepare_arg4="
    movq %rcx, %r10"
        else
            prepare_arg4=
        fi
        cat >>syscall.S <<EOF
.global ${args[1]}
${args[1]}:
    movq \$${args[0]}, %rax$prepare_arg4
    syscall
    ret

EOF
    done
