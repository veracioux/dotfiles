#!/usr/bin/env sh

set -e

tmpfile="$(mktemp XXXXXXXX.tar.gz)"
extractdir="$(mktemp)"
backupdir="$(mktemp -d)"

echo "--------------------------------"
echo "Generating configs into tar file"
echo "--------------------------------"
docker run docker.veracioux.me/dotfiles-generator >"$tmpfile" --user "$(whoami)" --home ~

echo "--------------------------------"
echo "Extracting tar file"
echo "--------------------------------"
mkdir "$extractdir"
tar xf "$tmpfile" -C

echo "--------------------------------"
echo "Copying to home directory"
echo "--------------------------------"
rsync -rv --backup-dir "$backupdir" "$extractdir/" ~/

echo "--------------------------------"
echo "Overwritten files backed up to $backupdir"
echo "In case of error, restore them using:"
echo "  rsync -rv $backupdir"
