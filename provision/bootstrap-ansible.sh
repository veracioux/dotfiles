#!/usr/bin/env sh

user="$1"

# Create default user
if ! id -u "$user" &>/dev/null; then
    echo "Creating default user ($user)..."
    useradd -m -G wheel -s /bin/bash "$user"
    echo "$user ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/"$user"
    chmod 440 /etc/sudoers.d/"$user"
    echo -n "Enter password for $user: "
    passwd "$user" --stdin
fi

pacman -Sy --noconfirm archlinux-keyring python openssh
