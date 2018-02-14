#!/usr/bin/env bash

set -ev

source scripts/common.sh

WDIR="$(get_realpath $(dirname $(dirname $(dirname "$0"))))"

PREFIX=$WDIR/tesseract_python/leptonica
mkdir -p $PREFIX

pushd leptonica-src
ACLOCAL_PATH=/usr/share/aclocal:$ACLOCAL_PATH ./autobuild
./configure --prefix=$PREFIX
make
make install
popd
