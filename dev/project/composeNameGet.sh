#!/bin/bash
###############################################################################
#
#  Purpose:
#    Generate a compose project name that conforms to an earlier set of
#    constraints. - These constraints are documented by the following github 
#    link: https://github.com/docker/compose/issues/2119
#
#    Although the project name constraints were relaxed, the Docker Compose
#    version: v2.0.1 used by this project seems to rely on the enforcement of
#    certain constraints.  For example, the compose "ps" command can't find
#    containers started by its corresponding "up".
#
#    Use namespaceGet.sh+nameGet+$1 to produce a relatively unique project
#    that's used to identify docker resources, like containers, that are
#    owned (created, maniuplated, and destroyed) by the project when executing
#    compose commands.  docker compose tags, using its labeling feature, every 
#    resource owned by the project.
#
#    In:
#      $1 - Optionally specify a suffix
#      nameGet.sh - include "project name" AKA: enclosing directory name
#        which can also be github repository name.
#      namespaceGet.sh - include directory name that encapsulates the 
#        "project name". 
#
#    STDOUT
#      namespaceGet.sh+nameGet+$1
# 
###############################################################################

DIR_UP="$(dirname "$0")"
NAME="$("$DIR_UP"/nameGet.sh)"
NAME_SPACE="$("$DIR_UP"/namespaceGet.sh)"
echo $NAME_SPACE$NAME$1 | tr '[:upper:]' '[:lower:]' | sed -e 's/[^a-z0-9]//g'