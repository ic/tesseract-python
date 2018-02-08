#!/usr/bin/env bash

set -ev

if [[ -x '/usr/bin/apt-get' ]]
then
  # TODO
  echo "UNTESTED"
  echo "Getting dependencies with Apt."
  sudo apt-get --assume-yes install g++ \
    autoconf \
    automake \
    libtool \
    autoconf-archive \
    pkg-config \
    libleptonica-dev \
    libpng-dev \
    libjpeg8-dev \
    libtiff5-dev \
    zlib1g-dev
elif [[ -x '/usr/bin/yum' ]]
then
  # TODO
  echo "UNTESTED"
  echo "Getting dependencies with Yum."
  sudo yum install g++ \
    autoconf \
    automake \
    libtool \
    autoconf-archive \
    libleptonica-dev \
    pkg-config \
    libpng-dev \
    libjpeg8-dev \
    libtiff5-dev \
    zlib1g-dev
else
  echo "Could not find Apt or Yum in standard locations, aborting."
fi
