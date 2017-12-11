export NCURSES_SRC=~/workbench/ncurses/src
export NCURSES_BUILD=~/workbench/ncurses/build
mkdir -pv ~/workbench/ncurses
mkdir $NCURSES_SRC && mkdir $NCURSES_BUILD
cd $NCURSES_SRC

wget http://ftp.gnu.org/pub/gnu/ncurses/ncurses-5.6.tar.gz
tar -pxzf ncurses-5.6.tar.gz 

#wget http://ftp.gnu.org/pub/gnu/ncurses/ncurses-6.0.tar.gz
#tar -pxzf ncurses-6.0.tar.gz

export INSTALLDIR=~/projects/ARM/le/armv7-marvell-linux-gnueabi-softfp-4.6.4_64K_i686_20160226/bin
export BUILDMACH=i686-pc-linux-gnu
export TARGETMACH=arm-marvell-linux-gnueabi
export CROSS=arm-marvell-linux-gnueabi
export CC=${CROSS}-gcc
export LD=${CROSS}-ld
export AS=${CROSS}-as

cd ../build/
#../src/ncurses-6.0/./configure --host=$TARGETMACH --prefix=/home/rivasiv/workbench/ncurses/final --with-shared --without-debug --without-ada --enable-overwrite
../src/ncurses-5.6/./configure --host=$TARGETMACH --prefix=/home/rivasiv/workbench/ncurses/final --with-shared --without-debug --without-ada --enable-overwrite --with-fallbacks

make
make install