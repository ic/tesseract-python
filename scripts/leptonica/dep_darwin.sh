#!/usr/bin/env bash

set -ev

if [ -x '/opt/local/bin/port' ]
then
  echo "Getting dependencies with MacPorts."
  sudo port install autoconf \
    autoconf-archive \
    automake \
    jpeg \
    tiff \
    libpng \
    webp \
    openjpeg
elif [ -x '/usr/local/bin/brew' ]
then
  # TODO
  echo "UNTESTED"
  echo "Getting dependencies with Brew."
  brew install automake \
    autoconf \
    autoconf-archive \
    libtool \
    pkgconfig \
    jpeg \
    tiff \
    libpng \
    webp \
    openjpeg
    gcc
else
  echo "Could not find MacPorts or Homebrew in standard locations, aborting."
fi