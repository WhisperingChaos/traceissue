#!/bin/bash
set -e
set -o pipefail

su user -p -c "/usr/share/code/code --no-sandbox" &
procid="$!"

wait $procid
exit







echo $(id)
/usr/share/code/code --no-sandbox &
procid="$!"

wait $procid
exit


adduser user sudo
    passwd -d user
login user
idebase.sh
