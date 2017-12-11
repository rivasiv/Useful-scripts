#!/usr/bin/env bash

# Download strace source strace-4.7.tar.xz

# Unpack file
tar xJf strace-4.7.tar.xz
cd strace-4.7

export INSTALLDIR=/home/rivasiv/projects/ARM/le/armv7-marvell-linux-gnueabi-softfp-4.6.4_64K_i686_20160226/bin
export BUILDMACH=i686-pc-linux-gnu
export TARGETMACH=arm-marvell-linux-gnueabi
export CROSS=arm-marvell-linux-gnueabi
export CC=${CROSS}-gcc
export LD=${CROSS}-ld
export AS=${CROSS}-as


export STRACE_SRC=~/workbench/strace/src
export STRACE_BUILD=~/workbench/strace/build
mkdir -pv ~/workbench/strace
mkdir $STRACE_SRC && mkdir $STRACE_BUILD
cd $STRACE_SRC

cd ../build/
../src/strace-4.16/./configure --prefix=/home/rivasiv/workbench/strace/final --host=$TARGETMACH
make LDFLAGS=-static
make install

