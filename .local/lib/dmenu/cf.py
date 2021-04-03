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
    run_command('vicmd cf')
else:
    run_command('vicf ' + choice)

quit()

# ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
# ┃ OLD CODE; WILL BE REMOVED PROBABLY ┃
# ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

# Get a list of all configuration entries
entries_flat = run(['lscf'], stdout=PIPE, encoding='utf-8').stdout.split('\n')[:-1]
entries_flat.sort()

# Some entries are hyphenated like alias, alias-tmp, alias-gui, alias-gui-tmp
# We want to display them as a sequence of nested dmenu prompts:
#   alias
#   ├─ tmp
#   └─ gui
#      └─ tmp
tree = {}
for item in entries_flat:
    t = tree
    for part in item.split('-'):
        t = t.setdefault(part, {})

tree_extended = tree.copy()

# ┏━━━━━━━━━━━━━━━━━━━━┓
# ┃ Additional options ┃
# ┗━━━━━━━━━━━━━━━━━━━━┛
tree_extended['Edit...'] = {}

# ┏━━━━━━━━━━━━━━━━━┓
# ┃ Item decoration ┃
# ┗━━━━━━━━━━━━━━━━━┛
# NOTE: Decoration must consist of exactly 2 characters prepended to the entry
def get_top_level():
    """Return a string containing the top level dmenu entries"""
    return ' Edit...\n' +                      \
            ' ' + '\n '.join(tree.keys())

# Recursively call dmenu on the tree entries
def recurse(tree, entry=''):
    if entry:                                       # create
        choices = ' ' + '\n '.join(tree.keys())   # list
    else:                                           # of
        choices = get_top_level()                   # choices

    if entry:                                       # add current entry 
        choices = ' ' + entry + '\n' + choices

    dmenu_cmd = ['dmenu', '-l', str(len(choices))]  # dmenu command
    if entry != '':                                 # add a prompt also
        dmenu_cmd += ['-p', entry + ':']
    p = run(dmenu_cmd, stdout=PIPE, input=choices,  # run dmenu
                 encoding='utf-8')
    choice = p.stdout[:-1]                          # remove \n

    if p.returncode != 0: quit()                    # USER MADE NO CHOICE

    if choice[0] == '':                            # the user chose the
        return ''                                   # entry from the prompt

    choice_raw = choice[2:]                         # strip the icon
    prefix = '-' if entry else ''
    if tree[choice_raw] == {}:                      # we have reached a leaf
        return prefix + choice_raw
    else:
        return prefix + choice_raw + recurse(tree[choice_raw], choice_raw)

choice = recurse(tree_extended)

def run_command(cmd):
    run(['alacritty', '--class', 'Float,Alacritty', '-e',
         'fish', '-C', cmd])

# ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
# ┃ Actions based on user's choice ┃
# ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
if not choice:
    quit()
elif choice == 'Edit...':
    run_command('vicmd cf')
else:
    run_command('vicf ' + choice)
