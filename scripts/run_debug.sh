#!/bin/bash

############################################################
# Help                                                     #
############################################################
Help()
{
   # Display Help
   echo "Run qemu and gdb to help debug."
   echo
   echo "Syntax: run_debug.sh [-l|r|h]"
   echo "options:"
   echo "l to debug kernel in loongarch architecture"
   echo "r to debug kernel in riscv architecture"
   echo "h help"
}

# Get the options
while getopts ":lrh" option; do
   case $option in
   	l)
   	   gnome-terminal -t "gdb loongarch kernel" -- sh -x -c "echo port is 1122;loongarch64-unknown-linux-gnu-gdb ~/files/oscomp/sel4test/build_3A5000/kernel/kernel.elf -ex 'target remote:1122' -ex 'add-symbol-file /home/lqt/files/oscomp/sel4test/build_3A5000/apps/sel4test-driver/sel4test-driver'; exec bash;"
   	   gnome-terminal -t "qemu-loongarch64 simulator" -- sh -x -c "cd ~/office/qemu-loongarch-runenv/qemu-loongarch-runenv;bash run_loongarch.sh -k sel4test-driver-image-loongarch-3A5000 -x;exec bash;"
   	   ;;
   	r)
   	   gnome-terminal -t "gdb riscv kernel" -- sh -c "echo port is 1234;riscv64-unknown-linux-gnu-gdb ~/files/oscomp/sel4test/build_spike/kernel/kernel.elf -ex 'target remote:1234'; exec bash;"
   	   gnome-terminal -t "qemu-riscv simulator" -- sh -c "cd ~/files/oscomp/sel4test/build_spike/images;set -x;qemu-system-riscv64 -machine spike -cpu rv64 -nographic -serial mon:stdio -m size=4095M -S -s -kernel sel4test-driver-image-riscv-spike -bios none;set +x;exec bash;"
   	   ;;
   	   
   	h)
   	   Help
   	   exit;;
   	\?)
   	   echo "invalid option"
   	   exit;;
   esac
done

cd ~/files/oscomp/sel4test;

