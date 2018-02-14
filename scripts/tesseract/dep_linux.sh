#!/usr/bin/env bash

set -ex

if [ -x '/usr/bin/apt-get' ]
then
  # TODO
  echo "UNTESTED"
  echo "Getting dependencies with Apt."
  apt-get --assume-yes install g++ \
    autoconf \
    automake \
    libtool \
    autoconf-archive \
    pkg-config \
    libpng-dev \
    libjpeg8-dev \
    libtiff5-dev \
    zlib1g-dev
elif [ -x '/usr/bin/yum' ]
then
  # TODO
  echo "UNTESTED"
  echo "Getting dependencies with Yum."
  yum install -y gcc \
    autoconf \
    automake \
    libtool \
    pkgconfig \
    libpng-devel \
    libjpeg-devel \
    libtiff-devel \
    zlib-devel
else
  echo "Could not find Apt or Yum in standard locations, aborting."
fi
