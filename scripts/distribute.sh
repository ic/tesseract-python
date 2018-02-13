#!/usr/bin/env bash

source venv/bin/activate

pip install --upgrade twine

if [ -n "$TRAVIS_TAG" ]
then
  ls -l $TRAVIS_BUILD_DIR
  twine upload -u $USER -p $PASS --skip-existing $TRAVIS_BUILD_DIR/wheelhouse/tesseract*;
else
  echo "Travis tag missing. Aborting distribution.";
fi
