
#!/usr/bin/env bash

export INSTALLDIR=~/projects/ARM/le/armv7-marvell-linux-gnueabi-softfp-4.6.4_64K_i686_20160226/bin
export BUILDMACH=i686-pc-linux-gnu
export TARGETMACH=arm-marvell-linux-gnueabi
export CROSS=arm-marvell-linux-gnueabi
export CC=${CROSS}-gcc
export LD=${CROSS}-ld
export AS=${CROSS}-as

export GDB_SRC=~/workbench/gdb/src
export GDB_BUILD=~/workbench/gdb/build
mkdir -pv ~/workbench/gdb
mkdir $GDB_SRC && mkdir $GDB_BUILD
cd $GDB_SRC

#wget https://ftp.gnu.org/gnu/gdb/gdb-{put the exact version here ~ 7.12.1}tar.gz
wget https://ftp.gnu.org/gnu/gdb/gdb-7.8.tar.gz
tar -pxzf gdb-7.8.tar.gz

cd ../build/

#../src/gdb-7.12.1/./configure --prefix=~/workbench/gdb/final --host=$TARGETMACH --enable-tui
../src/gdb-7.8/./configure --prefix=/home/rivasiv/workbench/gdb/final --host=$TARGETMACH --enable-tui --with-curses --enable-static=yes

# Compile 
#make 
export CPPFLAGS="-DHAVE_NCURSES_H -DHAVE_TERM_H -I /home/rivasiv/workbench/ncurses/final/include"
export C_INCLUDE_PATH+=C_INCLUDE_PATH:/home/rivasiv/workbench/ncurses/final/include 
export LDFLAGS="-ltinfo -Wl, -O1"

#compile static
make LDFLAGS=-static LDFLAGS+=-L/home/rivasiv/workbench/ncurses/final/lib
make install

#check if file is correct : suppose to be builded for arm
cd ../final/
file ./gdb/gdb