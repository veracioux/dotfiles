#!/usr/bin/env bash

set -e

mkdir -p ~haris/.ssh

while read pubkey; do
    if ! grep -q "$pubkey" ~haris/.ssh/authorized_keys; then
        echo "$pubkey" >> ~haris/.ssh/authorized_keys
    fi
done </vagrant/vm_authorized_keys.pub

chown -R haris:haris ~haris/.ssh

echo haris | /vagrant/bootstrap-ansible.sh haris
