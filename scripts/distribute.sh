#!/usr/bin/env bash

set -ex

source venv/bin/activate

if [ -n "$TRAVIS_TAG" ]
then
  ls -l $TRAVIS_BUILD_DIR
  twine upload -u $PYPI_USER -p $PYPI_PASS --skip-existing ${TRAVIS_BUILD_DIR}/wheelhouse/tesseract*
else
  echo "Travis tag missing. Aborting distribution.";
fi
