#!/usr/bin/env bash

set -ev

source scripts/common.sh

WDIR="$(get_realpath $(dirname $(dirname $(dirname "$0"))))"

PREFIX=$WDIR/tesseract_python/leptonica
mkdir -p $PREFIX

SELF_LIB_DIR=$WDIR/tmp/build/lib
SELF_INCLUDE_DIR=$WDIR/tmp/build/include

pushd leptonica-src
ACLOCAL_PATH=/usr/share/aclocal:$ACLOCAL_PATH ./autobuild
./configure \
    --prefix=$PREFIX \
    --with-extra-includes=$SELF_INCLUDE_DIR/libjpeg \
    LDFLAGS="-static -L$SELF_LIB_DIR"
make
make install
popd
