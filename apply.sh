#!/bin/sh
set -euo pipefail

if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root" 1>&2
    sudo sh $0
    exit 1
fi

rsync -v --delete -r . /etc/nixos
nixos-rebuild switch -j auto
