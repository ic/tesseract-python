#!/usr/bin/env bash

set -ev

SYSTEM_NAME=`uname -s | tr '[:upper:]' '[:lower:]'`

if [ -n "$SYSTEM_NAME" ]
then
  bash scripts/tesseract/build_$SYSTEM_NAME.sh
else
  echo "System not supported. Please use either Linux or Darwin."
  exit 1
fi
