#!/usr/bin/env bash

set -ev

if [[ -x '/opt/local/bin/port' ]]
then
  echo "Getting dependencies with MacPorts."
  sudo port install autoconf \
    autoconf-archive \
    automake \
    libtool \
    pkgconfig \
    leptonica
elif [[ -x '/usr/local/bin/brew' ]]
then
  # TODO
  echo "UNTESTED"
  echo "Getting dependencies with Brew."
  brew install automake \
    autoconf \
    autoconf-archive \
    libtool \
    pkgconfig \
    icu4c \
    leptonica \
    gcc
else
  echo "Could not find MacPorts or Homebrew in standard locations, aborting."
fi
