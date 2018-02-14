#!/usr/bin/env bash

set -ex

source scripts/common.sh

WDIR="$(get_realpath $(dirname $(dirname $(dirname "$0"))))"

PREFIX=$WDIR/tesseract_python/tesseract

if [ -d $PREFIX/tesseract/share/tessdata ]
then
  pushd $PREFIX/tesseract/share/tessdata
  curl --remote-name https://github.com/tesseract-ocr/tessdata/raw/3.04.00/eng.traineddata
  popd
else
  echo "Please build Tesseract before running this script."
  exit 1
fi
