export PCRE_SRC=~/workbench/pcre/src
export PCRE_BUILD=~/workbench/pcre/build
mkdir -pv ~/workbench/pcre
mkdir $PCRE_SRC && mkdir $PCRE_BUILD
cd $PCRE_SRC


wget ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.41.tar.gz
tar -pxzf pcre-8.41.tar.gz


export INSTALLDIR=~/projects/ARM/le/armv7-marvell-linux-gnueabi-softfp-4.6.4_64K_i686_20160226/bin
export BUILDMACH=i686-pc-linux-gnu
export TARGETMACH=arm-marvell-linux-gnueabi
export CROSS=arm-marvell-linux-gnueabi
export CC=${CROSS}-gcc
export LD=${CROSS}-ld
export AS=${CROSS}-as

cd ../build/
../src/pcre-8.41/./configure --host=$TARGETMACH --prefix=/home/rivasiv/workbench/pcre/final 

make
make install