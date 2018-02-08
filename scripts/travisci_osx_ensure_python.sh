#!/usr/bin/env bash

#
# Supposed to run on TravisCI, where Homebrew is available.
#

VERSION=${PYTHON_VERSION:-"2.7"}

if [[ $VERSION = "2.7" ]]
then
  brew install python
else
  ver=`echo $VERSION | tr -d '.'`
  brew install python@$ver.rb
fi
