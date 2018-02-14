#!/usr/bin/env bash

set -ex

source scripts/common.sh

WDIR="$(get_realpath $(dirname $(dirname $(dirname "$0"))))"

TESSDATA=$WDIR/tesseract_python/tesseract/share/tessdata

if [ -d $TESSDATA ]
then
  pushd $TESSDATA
  curl --location --remote-name https://github.com/tesseract-ocr/tessdata/raw/3.04.00/eng.traineddata
  popd
else
  echo "Please build Tesseract before running this script."
  exit 1
fi
