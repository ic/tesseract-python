#!/usr/bin/env bash

function get_realpath() {
  if [ "$(uname -s)" == "Darwin" ]
  then
    local queue="$1"
    if [ "${queue}" != /* ]
    then
      # Make sure we start with an absolute path.
      queue="${PWD}/${queue}"
    fi
    local current=""
    while [ -n "${queue}" ]
    do
      # Removing a trailing /.
      queue="${queue#/}"
      # Pull the first path segment off of queue.
      local segment="${queue%%/*}"
      # If this is the last segment.
      if [ "${queue}" != */* ]
      then
        segment="${queue}"
        queue=""
      else
        # Remove that first segment.
        queue="${queue#*/}"
      fi
      local link="${current}/${segment}"
      if [ -h "${link}" ]
      then
        link="$(readlink "${link}")"
        queue="${link}/${queue}"
        if [ "${link}" == /* ]
        then
          current=""
        fi
      else
        current="${link}"
      fi
    done
    echo "${current}"
  else
    readlink -f "$1"
  fi
}
