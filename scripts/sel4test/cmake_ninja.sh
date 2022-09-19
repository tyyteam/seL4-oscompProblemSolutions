#!/bin/bash

############################################################
# Help                                                     #
############################################################
Help()
{
   # Display Help
   echo "Run cmake and ninja to help build."
   echo
   echo "Syntax: run_debug.sh [-l|r|h]"
   echo "options:"
   echo "l to run cmake and ninja of loongarch architecture"
   echo "r to run cmake and ninja of riscv architecture"
   echo "a to run cmake and ninja of arm architecture"
   echo "h help"
}

# Get the options
while getopts ":lrah" option; do
   case $option in
   	l)
   	   cd build_3A5000 && rm -rf ./*   	   
   	   ../init-build.sh -DPLATFORM=3A5000 -DLoongarch64=1 -DSIMULATION=1
   	   ninja
   	   cd ..
   	   ;;
   	r)
   	   cd build_spike && rm -rf ./*   	   
   	   ../init-build.sh -DPLATFORM=spike -DRISCV64=1 -DSIMULATION=1
   	   ninja
   	   cd ..
   	   ;;
   	a)
   	   cd build_rpi && rm -rf ./*   	   
   	   ../init-build.sh -DPLATFORM=rpi3 -DBAMBOO=TRUE -DAARCH64=TRUE -DSIMULATION=1
   	   ninja
   	   cd ..
   	   ;;
   	   
   	h)
   	   Help
   	   exit;;
   	\?)
   	   echo "invalid option"
   	   exit;;
   esac
done
