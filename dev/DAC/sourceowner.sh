#!/bin/bash
set -e
DIR_PARENT="$(dirname "$0")"
# obtain linux id of go project source owner
ls -n "$DIR_PARENT"/src/go.mod| awk '{print $3}'