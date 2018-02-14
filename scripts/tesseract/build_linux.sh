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
LD_LIBRARY_PATH=/usr/lib:$LD_LIBRARY_PATH \
PKG_CONFIG_PATH=$LEPTONICA_HOME/lib/pkgconfig \
LIBLEPT_HEADERSDIR=$LEPTONICA_HOME/include ./configure \
  --prefix=$PREFIX \
  LDFLAGS=-L$LEPTONICA_HOME/lib \
  CPPFLAGS=-I$LEPTONICA_HOME/include \
  LIBS="-llept"
make
make install
popd
