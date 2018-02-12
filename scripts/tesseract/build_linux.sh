#!/usr/bin/env bash

set -ex

source scripts/common.sh

WDIR="$(get_realpath $(dirname $(dirname $(dirname "$0"))))"

PREFIX=$WDIR/tesseract_python/tesseract
mkdir -p $PREFIX

pushd tesseract-src
./autogen.sh
LIBLEPT_HEADERSDIR=$LEPTONICA_HOME/include ./configure \
  --prefix=$PREFIX \
  --with-extra-libraries=$LEPTONICA_HOME/lib \
  --with-extra-includes=$LEPTONICA_HOME/include
make
make install
popd
