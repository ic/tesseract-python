#!/usr/bin/env bash

set -ev

source scripts/common.sh

WDIR="$(get_realpath $(dirname $(dirname $(dirname "$0"))))"

PREFIX=$WDIR/tesseract_python/leptonica
mkdir -p $PREFIX

pushd leptonica-src
./configure --prefix=$PREFIX
make
make install
popd
