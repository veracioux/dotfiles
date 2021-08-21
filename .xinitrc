system-specific                             # System specific config
xset r rate 250 60                          # Increase key press rate
setxkbmap -option caps:escape               # Bind caps_lock to escape
sxhkd &                                     # Load default bindings
sxhkd.private -c ~/.sxhkd.private &         # Load private bindings
xrdb ~/.Xresources

feh --bg-fill ~/.wallpaper                  # Set wallpaper

dunst &                                     # Notification daemon
clipmenud &                                 # Daemon for dmenu clipboard
picom &                                     # Compositor
redshift &                                  # Blue light filter
autotiling &                                # Autotiling for i3
i3                                          # Window manager
