#!/usr/bin/env bash

set -ev

source scripts/common.sh

WDIR="$(get_realpath $(dirname $(dirname $(dirname "$0"))))"

PREFIX=$WDIR/tesseract_python/tesseract
mkdir -p $PREFIX

pushd tesseract-src
./autogen.sh
./configure --prefix=$PREFIX
make
make install
popd
