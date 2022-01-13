#!/bin/bash
set -e
cd /home/user/src
EXEC_OUT="/home/user/exec/out/fanin"
# unless integrated with cgo code, compiler creates a statically linked executable
export CGO_ENABLED=0 
go build -o "$EXEC_OUT"

set -o pipefail
# verify statically linked executable
file "$EXEC_OUT" | tr , '\n' | grep "statically linked" >/dev/null