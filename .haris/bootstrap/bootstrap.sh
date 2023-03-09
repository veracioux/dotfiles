#!/usr/bin/env bash

set -e

tmpfile="$(mktemp -t XXXXXXXX.tar.gz)"
extractdir="$(mktemp -d)"
backupdir="$(mktemp -dt tangle-home-backup-"$(whoami)"-XXXXXXX)"

check_missing_then_install() {
    local distro="$(lsb_release --id | cut -f2)"
    local install_cmd
    local packages=()
    case "$distro" in
        Arch)
            install_cmd=(sudo pacman -S);;
        Ubuntu)
            install_cmd=(sudo apt install);;
    esac
    for name in "$@"; do
        if [ ! -x "$(command -v "$name")" ]; then
            packages=("${packages[@]}" "$name")
        fi
    done
    if [ "${#packages[@]}" = 0 ]; then
        return 0;
    fi
    echo "Some required commands missing. Will be installed using:" >&2
    echo "    ${install_cmd[*]} ${packages[@]}" >&2
    read -n1 -p "Ok? [Y/n]: " ok
    if [ -z "$ok" -o "${ok^}" = "Y" ]; then
        "${install_cmd[@]}" "${packages[@]}"
    else
        return 1
    fi
}

check_missing_then_install docker rsync

echo "--------------------------------"
echo "Generating configs into tar file"
echo "--------------------------------"
docker run docker.veracioux.me/dotfiles-generator >"$tmpfile" --user "$(whoami)" --home ~ --branch bootstrap # TODO tmp

echo "--------------------------------"
echo "Extracting tar file"
echo "--------------------------------"
tar xf "$tmpfile" --directory "$extractdir"

echo "--------------------------------"
echo "Copying to home directory"
echo "--------------------------------"
rsync -rv --backup-dir "$backupdir" "$extractdir/" ~/

echo "--------------------------------"
echo "Overwritten files backed up to $backupdir"
echo "In case of error, restore them using:"
echo "  rsync -rv $backupdir/ ~/"
