#!/bin/bash
DIR_PARENT="$(dirname "$0")"
DIR_PROJECT="$(readlink -f "$DIR_PARENT"/../../../)"
basename "$DIR_PROJECT"