#!/usr/bin/env bash

set -e

source scripts/common.sh

WDIR="$(get_realpath $(dirname $(dirname $(dirname "$0")a)))"

PREFIX=$WDIR/build/tesseract
mkdir -p $PREFIX

pushd tesseract
./autogen.sh
./configure --prefix=$PREFIX
make
make install
popd
