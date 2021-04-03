#!/usr/bin/env sh

# NOTE: Requires sudo

pacman -S i3status ttf-font-awesome
paru -S dmenu-height

# Replace i3's ironically named sensible terminal with alacritty
rm /bin/i3-sensible-terminal
echo -e '#!/usr/bin/env sh \n'                          \
        'alacritty --class i3ConfigError,Alacritty $@'  \
        > /bin/i3-sensible-terminal

chmod a+x /bin/i3-sensible-terminal
