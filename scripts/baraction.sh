#!/bin/bash
# Bar action script for spectrwm

# Color mapping
normal=0
vol=6
excess_vol=7
label=8
bat=9

function volume {
  volume="$(amixer get Master | awk -F'[][]' 'END{ gsub("%",""); print $2 }')"

  # Set volume bar color to green
  echo -n "+@fg=$vol; "
  
  # Muted
  if [ -z "$(amixer get Master | grep '\[on\]')" ]
  then
    echo -n 'X'
  else
    # Draw the volume bar
    for (( i=0; i <= "$(( ($volume-1) / 10 ))"; i++ ))
    do
      # Color excess of 100% red
      if [ $i -eq 10 ]
      then
        echo -n "+@fg=$excess_vol;" 
      fi
      echo -n '|'
    done
  fi
}

function brightness {

  xbacklight -get | awk 'BEGIN {FS="."} {ORS=""; print $1 "\n"}'

}

function battery {
  acpi | awk 'BEGIN {RS=" "} /???%/ { gsub(",",""); print $0 }'
}

while :; do
  echo "+@fg=$label; Vol: $(volume) +@fg=$label; Br: +@fg=$bat; $(brightness) +@fg=$label; Bat: +@fg=$bat; $(battery)"
  sleep 0.2 
done
