#!/usr/bin/env bash

set -ev

SYSTEM_NAME=`uname -s | tr '[:upper:]' '[:lower:]'`

if [[ $SYSTEM_NAME ]]
then
  bash scripts/tesseract/dep_$SYSTEM_NAME.sh
else
  echo "System not supported. Please use either Linux or Darwin."
  exit 1
fi
