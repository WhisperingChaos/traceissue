#!/bin/bash
set -e
DIR_PARENT="$(dirname "$0")"
# obtain linux id of go project source group
"$DIR_PARENT"/.project/nameGet.sh