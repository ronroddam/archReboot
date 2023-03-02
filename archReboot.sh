#!/usr/bin/bash

# Ron Roddam 2023
# This script compares the latest installed kernel to the current
# running kernel to see if a reboot is required to activate the newer
# kernel. It workes on both LTS and non-LTS kernels.

# Copied from Arch Forums and modified to provide more detail

# The script first tests whether the kernel is LTS or not then.
# Compares the running kernel to the installed kernel and advises
# to reboot if the comparison is not true.

STR=$(uname -r)
SUB='lts'

s1=$(pacman -Q linux-lts | sed 's/linux-lts //')
s2=$(uname -r | sed 's/-lts//')
s3=$(pacman -Q linux | sed 's/linux //')
s4=$(uname -r | sed 's/-ARCH//' | sed 's/-arch/.arch/')

if [[ "$STR" == *"$SUB"* ]]; then
  	
	if [ "$s1" == "$s2" ]; then
  	 echo The installed kernel is "$s1".
  	 echo The running kernel is "$s2".
 	 echo OK -- no reboot required.
	 echo Note - This is an LTS Kernel.
	else
  	 echo The installed kernel is "$s1".
  	 echo The running kernel is "$s2".
  	 echo REBOOT
  	 echo Note - This is an LTS Kernel.
	fi
fi

if [[ "$STR" != *"$SUB"* ]]; then

	if [ "$s3" == "$s4" ]; then
  	 echo The installed kernel is "$s3".
  	 echo The running kernel is "$s4".
  	 echo OK -- no reboot required.

	else
 	 echo The installed kernel is "$s3".
 	 echo The running kernel is "$s4".
 	 echo REBOOT
	fi 
fi
	

