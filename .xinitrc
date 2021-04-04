/home/haris/.local/bin/system_specific      # System specific config
xset r rate 250 60                          # Increase key press rate
setxkbmap -option caps:escape               # Bind caps_lock to escape
xbindkeys                                   # Load bindings from .xbindkeysrc

feh --bg-fill ~/.wallpaper                  # Set wallpaper

dunst &                                     # Notification daemon
clipmenud &                                 # Daemon for dmenu clipboard
picom &                                     # Compositor
i3                                          # Window manager
