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


SRC_DIR=$WDIR/tmp/src
mkdir -p $SRC_DIR

BUILD_DIR=$WDIR/tmp/build
mkdir -p $BUILD_DIR

LIB_DIR=$BUILD_DIR/lib
mkdir -p $LIB_DIR

INCLUDE_DIR=$BUILD_DIR/include
mkdir -p $INCLUDE_DIR

# libjpeg
LIBJPEG_TARGET_INCLUDE=$INCLUDE_DIR/libjpeg
mkdir -p $LIBJPEG_TARGET_INCLUDE
LIBJPEG=$SRC_DIR/libjpeg
if [ ! -d $LIBJPEG ]
then
  git clone --recursive --quiet https://github.com/libjpeg-turbo/libjpeg-turbo.git $LIBJPEG
fi
pushd $LIBJPEG
git checkout --quiet --detach 1.5.3
autoreconf -fiv
./configure
make
cp .libs/libjpeg.a $LIB_DIR
cp *.h $LIBJPEG_TARGET_INCLUDE
popd
