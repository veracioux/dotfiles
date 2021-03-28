#!/usr/bin/env sh

# NOTE: Requires sudo

rm /bin/i3-sensible-terminal
ln -s $(type $TERM | awk '{print $3}') /bin/i3-sensible-terminal
