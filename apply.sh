#!/bin/sh
set -euo pipefail

if [ $# -ne 1 ]; then
    echo "usage: $0 hostname" 1>&2
    exit 1 
fi

if [ "$1" == "$(hostname)" ]; then
    if [[ $EUID -ne 0 ]]; then
        echo "This script must be run as root" 1>&2
        sudo sh $0 $*
        exit 1
    fi
    rsync -v --delete -r . /etc/nixos
    ln -s /etc/nixos/hosts/$(hostname)/configuration.nix /etc/nixos/configuration.nix
    nixos-rebuild switch -j auto --show-trace
else
    nixops deploy -d $1
fi


