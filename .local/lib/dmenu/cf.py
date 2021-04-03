#!/usr/bin/env python3

from subprocess import run, PIPE
import os, os.path

# Load regular configuration entries
entries = run('lscf', stdout=PIPE, encoding='utf-8').stdout.replace('-', ' ')
# Load dmenu scripts
dmenu_scripts = os.listdir(os.path.expanduser('~/.local/lib/dmenu/'))

# ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
# ┃ Additional entries and customization ┃
# ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
entries = ' Edit...\n' +                               \
          ' ' + entries.replace('\n', '\n ') +        \
          'dmenu ' + '\n dmenu '.join(dmenu_scripts)

# Run dmenu
n = entries.count('\n')
choice = run(['dmenu', '-l', str(n),  '-p', 'Config:'],
             input=entries, encoding='utf-8', stdout=PIPE).stdout

if not choice:
    quit()

# Strip decoration from the entry
choice = choice[2:-1].replace(' ', '-')

def run_command(cmd):
    run(['alacritty', '--class', 'Float,Alacritty', '-e',
         'fish', '-C', cmd])

# ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
# ┃ Actions based on user's choice ┃
# ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
if choice.startswith('dmenu-'):
    run_command('cd (dirname ' + __file__ + '); vim ' + choice.replace(
        'dmenu-',
        os.path.expanduser('~/.local/lib/dmenu/')
    ))
elif choice == 'Edit...':
    run_command('cd (dirname (fcmd ' + __file__ + ')); vicmd cf')
else:
    run_command('cdcf ' + choice + '; vicf ' + choice)

quit()

