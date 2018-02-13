#!/usr/bin/env bash

source venv/bin/activate

if [ -n "$TRAVIS_TAG" ]
then
  ls -l $TRAVIS_BUILD_DIR
  twine upload -u $USER -p $PASS --skip-existing $TRAVIS_BUILD_DIR/wheelhouse/tesseract*;
else
  echo "Travis tag missing. Aborting distribution.";
fi
