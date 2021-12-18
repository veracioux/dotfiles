system-specific                             # System specific config
xset r rate 200 60                          # Increase key press rate
sxhkd &                                     # Load default bindings
sxhkd.private -c ~/.sxhkd.private &         # Load private bindings
xrdb ~/.Xresources

feh --bg-fill ~/.wallpaper                  # Set wallpaper

dunst &                                     # Notification daemon
clipmenud &                                 # Daemon for dmenu clipboard
picom &                                     # Compositor
redshift &                                  # Blue light filter
autotiling &                                # Autotiling for i3
xset s 1000                                 # Set lock timeout
xss-lock --ignore-sleep -- xlock &          # Lock screen daemon
i3                                          # Window manager
