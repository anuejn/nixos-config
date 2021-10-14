#!/bin/sh
set -euo pipefail

if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root" 1>&2
    sudo sh $0
    exit 1
fi

rsync -v --delete -r . /etc/nixos
ln -s /etc/nixos/hosts/$(hostname)/configuration.nix /etc/nixos/configuration.nix
nixos-rebuild switch -j auto --show-trace $*
