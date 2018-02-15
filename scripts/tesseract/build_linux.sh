#!/usr/bin/env bash

set -ex

source scripts/common.sh

WDIR="$(get_realpath $(dirname $(dirname $(dirname "$0"))))"

PREFIX=$WDIR/tesseract_python/tesseract
mkdir -p $PREFIX

LEPTONICA_HOME=$WDIR/tesseract_python/leptonica

echo "Will build with Leptonica at $LEPTONICA_HOME"

if [ -x '/usr/bin/apt-get' ]
then
  pushd tesseract-src
  # TODO
  echo "UNTESTED"
  echo "Building with an Apt environment."
  PKG_CONFIG_PATH=$LEPTONICA_HOME/lib/pkgconfig \
  LIBLEPT_HEADERSDIR=$LEPTONICA_HOME/include ./configure \
    --prefix=$PREFIX \
    LDFLAGS=-L$LEPTONICA_HOME/lib \
    CPPFLAGS=-I$LEPTONICA_HOME/include \
    LIBS="-llept"
elif [ -x '/usr/bin/yum' ]
then
  echo "Building with a Yum environment."

  is_centos=`cat /etc/issue | grep -i centos`
  if [ -n "$is_centos" ]
  then
    # CentOS is missing autconf-archive, necessary for Tesseract.
    AUTOCONF_ARCH_WDIR=/tmp/tesseract_python/autoconf-archive
    mkdir -p $AUTOCONF_ARCH_WDIR
    pushd $AUTOCONF_ARCH_WDIR
    git clone https://github.com/ic/autoconf-archive-rpmbuilder.git
    pushd autoconf-archive-rpmbuilder
    ./install
    popd
    popd
    rm -rf $AUTOCONF_ARCH_WDIR

    # The PyPa build environment for manylinux relies on CentOS,
    #   where many paths need to be fixed. Patch some.
    git apply patches/tesseract_centos_autogen.sh.patch
  fi

  pushd tesseract-src
  ./autogen.sh
  LD_LIBRARY_PATH=$LEPTONICA_HOME/lib:$LD_LIBRARY_PATH \
  PKG_CONFIG_PATH=$LEPTONICA_HOME/lib/pkgconfig \
  LIBLEPT_HEADERSDIR=$LEPTONICA_HOME/include ./configure \
    --prefix=$PREFIX \
    LDFLAGS=-L$LEPTONICA_HOME/lib \
    CPPFLAGS=-I$LEPTONICA_HOME/include \
    LIBS="-llept"
fi

make
make install
popd
