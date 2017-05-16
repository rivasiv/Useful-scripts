#!/usr/bin/env bash

export INSTALLDIR=~/projects/ARM/le/armv7-marvell-linux-gnueabi-softfp-4.6.4_64K_i686_20160226/bin
export BUILDMACH=i686-pc-linux-gnu
export TARGETMACH=arm-marvell-linux-gnueabi
export CROSS=arm-marvell-linux-gnueabi
export CC=${CROSS}-gcc
export LD=${CROSS}-ld
export AS=${CROSS}-as

../src/gdb-7.12.1/./configure --prefix=/home/rivasiv/workbench/gdb/final --host=$TARGETMACH --disable-tui

# Compile 
#make 

#compile static
make LDFLAGS=-static
make install

#check if file is correct : suppose to be builded for arm
file ./gdb/gdb