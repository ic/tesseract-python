#!/usr/bin/env bash

set -ev

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
  LIBLEPT_HEADERSDIR=$LEPTONICA_HOME/include ./configure \
    --prefix=$PREFIX \
    --with-extra-libraries=/opt/local/lib \
    --with-extra-libraries=$LEPTONICA_HOME/lib \
    --with-extra-includes=/opt/local/include \
    --with-extra-includes=$LEPTONICA_HOME/include \
    LDFLAGS=-L/opt/local/lib \
    CPPFLAGS=-I/opt/local/include
  make
elif [ -x '/usr/local/bin/brew' ]
then
  # TODO
  echo "UNTESTED"
  LIBLEPT_HEADERSDIR=$LEPTONICA_HOME/include ./configure \
    --prefix=$PREFIX \
    --with-extra-libraries=$LEPTONICA_HOME/lib \
    --with-extra-includes=$LEPTONICA_HOME/include \
    CC=clang \
    CXX=clang++ \
    CPPFLAGS=-I/usr/local/opt/icu4c/include \
    LDFLAGS=-L/usr/local/opt/icu4c/lib
  make -j
else
  echo "Could not find whether to assume MacPorts or Homebrew, aborting."
fi

make install
popd
