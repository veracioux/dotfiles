#!/usr/bin/env python

# -*- coding: utf-8 -*-

# This script is a simple wrapper which prefixes each i3status line with custom
# information. It is a python reimplementation of:
# http://code.stapelberg.de/git/i3status/tree/contrib/wrapper.pl
#
# To use it, ensure your ~/.i3status.conf contains this line:
#     output_format = "i3bar"
# in the 'general' section.
# Then, in your ~/.i3/config, use:
#     status_command i3status | ~/i3status/contrib/wrapper.py
# In the 'bar' section.
#
# In its current version it will display the cpu frequency governor, but you
# are free to change it to display whatever you like, see the comment in the
# source code below.
#
# © 2012 Valentin Haenel <valentin.haenel@gmx.de>
#
# This program is free software. It comes without any warranty, to the extent
# permitted by applicable law. You can redistribute it and/or modify it under
# the terms of the Do What The Fuck You Want To Public License (WTFPL), Version
# 2, as published by Sam Hocevar. See http://sam.zoy.org/wtfpl/COPYING for more
# details.
#
# This file has been modified by Haris Gušić <harisgusic.dev@gmail.com>

import sys
import json

def print_line(message):
    """ Non-buffered printing to stdout. """
    sys.stdout.write(message + '\n')
    sys.stdout.flush()

def read_line():
    """ Interrupted respecting reader for stdin. """
    # try reading a line, removing any extra whitespace
    try:
        line = sys.stdin.readline().strip()
        # i3status sends EOF, or an empty line
        if not line:
            sys.exit(3)
        return line
    # exit on ctrl-c
    except KeyboardInterrupt:
        sys.exit()

# On some networks my Wi-Fi randomly drops. It is very irritating, but at least
# this way I get a warning on the status bar
def wifi_drop_status():
    from subprocess import call, DEVNULL
    if call(['ping', '-c', '1', 'archlinux.org'], stdout=DEVNULL) == 0:
        return ""
    else:
        return "  "

if __name__ == '__main__':
    # Skip the first line which contains the version header.
    print_line(read_line())

    # The second line contains the start of the infinite array.
    print_line(read_line())

    while True:
        line, prefix = read_line(), ''
        # ignore comma at start of lines
        if line.startswith(','):
            line, prefix = line[1:], ','

        j = json.loads(line)
        # insert information into the start of the json, but could be anywhere
        # CHANGE THIS LINE TO INSERT SOMETHING ELSE

        wifi_drop = wifi_drop_status()
        if not wifi_drop:
            j[1]['separator'] = True
            j[1]['full_text'] += ' '
        else:
            j[1]['color'] = '#ff5555'

        j.insert(2, {
            'full_text' : wifi_drop,
            'name'      : 'wifi_drop',
            'separator' : True,
            'color'     : '#ff5555',
        })

        # and echo back new encoded json
        print_line(prefix+json.dumps(j))
