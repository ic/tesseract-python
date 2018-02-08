#!/usr/bin/env bash

#
# Supposed to run on TravisCI, where Homebrew is available.
#

VERSION=${PYTHON_VERSION:-"2.7"}

brew install python$VERSION
