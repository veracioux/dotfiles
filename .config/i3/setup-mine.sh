#!/usr/bin/env sh

# NOTE: Requires sudo

rm /bin/i3-sensible-terminal
echo -e '#!/usr/bin/env sh \n'                          \
        'alacritty --class i3ConfigError,Alacritty $@'  \
        > /bin/i3-sensible-terminal

chmod a+x /bin/i3-sensible-terminal
