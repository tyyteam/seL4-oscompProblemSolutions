#!/bin/bash

############################################################
# Help                                                     #
############################################################
Help()
{
   # Display Help
   echo "Run qemu and gdb to help debug. \
   	You should add sel4test and qemu-loongarch-runenv to path. \
   	You can save breakpoints to la.bp or rv.bp, gdb will load the breakpoints you saved next time."
   echo
   echo "Syntax: run_debug.sh [-l|r|h]"
   echo "options:"
   echo "l to debug kernel in loongarch architecture"
   echo "r to debug kernel in riscv architecture"
   echo "h help"
}

# For example: add these variables to your path.
# SEL4_TEST=~/projects/seL4projects/sel4test/
# QEMU_LA_RUNENV=~/developtools/qemu-loongarch-runenv/

# Get the options
while getopts ":lrh" option; do
   case $option in
   	l)
   	   gnome-terminal -t "gdb loongarch kernel with breakpoints: ./la.bp" \
   	   -- sh -c "echo using port 1122, you could save your breakpoints as ./la.bp;\
   	   loongarch64-unknown-linux-gnu-gdb build_3A5000/kernel/kernel.elf \
   	   -ex 'add-symbol-file build_3A5000/elfloader/elfloader' \
   	   -ex 'add-symbol-file build_3A5000/apps/sel4test-driver/sel4test-driver' \
   	   -ex 'add-symbol-file build_3A5000/apps/sel4test-driver/sel4test-tests/sel4test-tests' \
   	   -ex 'set output-radix 16' \
     	   -ex 'target remote:1122' \
   	   -ex 'source la.bp'; \
   	   exec bash;"
   	   gnome-terminal -t "qemu-loongarch64 simulator" \
   	   -- sh -x -c "cd ${QEMU_LA_RUNENV};\
   	   bash run_loongarch.sh -k sel4test-driver-image-loongarch-3A5000 -x;\
   	   exec bash;"
   	   ;;
   	r)
   	   gnome-terminal -t "gdb riscv kernel with breakpoints: ./rv.bp" \
   	   -- sh -c "echo using port 1234, you could save your breakpoints as ./rv.bp;\
   	   riscv64-unknown-linux-gnu-gdb build_spike/kernel/kernel.elf \
   	   -ex 'add-symbol-file build_spike/elfloader/elfloader' \
   	   -ex 'add-symbol-file build_spike/apps/sel4test-driver/sel4test-driver' \
   	   -ex 'add-symbol-file build_spike/apps/sel4test-driver/sel4test-tests/sel4test-tests' \
   	   -ex 'set output-radix 16' \
   	   -ex 'target remote:1234'; \
   	   -ex 'source rv.bp'; \
   	   exec bash;"
   	   gnome-terminal -t "qemu-riscv simulator" \
   	   -- sh -c "cd build_spike/images;\
   	   set -x;\
   	   qemu-system-riscv64 -machine spike -cpu rv64 -nographic -serial mon:stdio -m size=4095M -S -s -kernel sel4test-driver-image-riscv-spike -bios none;set +x;exec bash;"
   	   ;;
   	   
   	h)
   	   Help
   	   exit;;
   	\?)
   	   echo "invalid option"
   	   exit;;
   esac
done

cd ${SEL4_TEST};

