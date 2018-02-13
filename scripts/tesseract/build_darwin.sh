#!/usr/bin/env bash

set -ex

source scripts/common.sh

WDIR="$(get_realpath $(dirname $(dirname $(dirname "$0"))))"

PREFIX=$WDIR/tesseract_python/tesseract
mkdir -p $PREFIX

LEPTONICA_HOME=$WDIR/tesseract_python/leptonica

echo "Will build with Leptonica at $LEPTONICA_HOME"

pushd tesseract-src
./autogen.sh
if [ -x '/opt/local/bin/port' ]
then
  echo "Building with MacPorts."
  PKG_CONFIG_PATH=$LEPTONICA_HOME/lib/pkgconfig \
  LIBLEPT_HEADERSDIR=$LEPTONICA_HOME/include ./configure \
    --prefix=$PREFIX \
    --with-extra-libraries=/opt/local/lib \
    --with-extra-libraries=$LEPTONICA_HOME/lib \
    --with-extra-includes=/opt/local/include \
    --with-extra-includes=$LEPTONICA_HOME/include \
    LDFLAGS=-L/opt/local/lib \
    CPPFLAGS=-I/opt/local/include
elif [ -x '/usr/local/bin/brew' ]
then
  # TODO
  echo "UNTESTED"
  PKG_CONFIG_PATH=$LEPTONICA_HOME/lib/pkgconfig \
  LIBLEPT_HEADERSDIR=$LEPTONICA_HOME/include ./configure \
    --prefix=$PREFIX \
    --with-extra-libraries=$LEPTONICA_HOME/lib \
    --with-extra-includes=$LEPTONICA_HOME/include \
    CC=clang \
    CXX=clang++ \
    CFLAGS="-m64" \
    LDFLAGS="-L/usr/local/opt/icu4c/lib -L$LEPTONICA_HOME/lib" \
    CPPFLAGS="-I/usr/local/opt/icu4c/include -I$LEPTONICA_HOME/include"
else
  echo "Could not find whether to assume MacPorts or Homebrew, aborting."
fi

make

make install
popd
