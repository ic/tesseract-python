#!/usr/bin/env bash

set -ev

source scripts/common.sh

WDIR="$(get_realpath $(dirname $(dirname $(dirname "$0"))))"

PREFIX=$WDIR/tesseract_python/leptonica
mkdir -p $PREFIX

pushd leptonica-src
./autobuild
if [ -x '/opt/local/bin/port' ]
then
  echo "Building with MacPorts."
  ./configure \
    --prefix=$PREFIX \
    --with-extra-libraries=/opt/local/lib \
    --with-extra-includes=/opt/local/include \
    LDFLAGS=-L/opt/local/lib \
    CPPFLAGS=-I/opt/local/include
  make
elif [ -x '/usr/local/bin/brew' ]
then
  # TODO
  echo "UNTESTED"
  export PATH=/usr/local/bin:$PATH
  ./configure --prefix=$PREFIX
  make
else
  echo "Could not find whether to assume MacPorts or Homebrew, aborting."
fi

make install
popd
