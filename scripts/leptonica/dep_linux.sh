#!/usr/bin/env bash

set -ex

if [ -x '/usr/bin/apt-get' ]
then
  # TODO
  echo "UNTESTED"
  echo "Getting dependencies with Apt."
  apt-get --assume-yes install g++ \
    autoconf \
    automake \
    libtool \
    autoconf-archive \
    pkg-config \
    nasm \
    git \
    libpng-dev \
    libtiff5-dev \
    zlib1g-dev
elif [ -x '/usr/bin/yum' ]
then
  # TODO
  echo "UNTESTED"
  echo "Getting dependencies with Yum."
  yum install -y gcc \
    autoconf \
    automake \
    libtool \
    pkgconfig \
    nasm \
    git \
    libpng-devel \
    libtiff-devel \
    zlib-devel
else
  echo "Could not find Apt or Yum in standard locations, aborting."
fi


source scripts/common.sh
WDIR="$(get_realpath $(dirname $(dirname $(dirname "$0"))))"


LIB_DIR=$WDIR/tesseract_python/lib
mkdir -p $LIB_DIR

SRC_DIR=$WDIR/tmp/src
mkdir -p $SRC_DIR

BUILD_DIR=$WDIR/tmp/build
mkdir -p $BUILD_DIR

# libjpeg
LIBJPEG=$SRC_DIR/libjpeg
git clone https://github.com/libjpeg-turbo/libjpeg-turbo.git $LIBJPEG
git checkout 1.5.3
pushd $LIBJPEG
autoreconf -fiv
./configure
make
cp .libs/libjpeg.so.62.2.0 .libs/libjpeg.so $LIB_DIR
popd
