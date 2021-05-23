set fish_greeting ''
fish_vi_key_bindings

# PATH
set -gx PATH ~/{,projects,wiki}/scripts**/ ~/bin $PATH

# Load other shell's config
bass source ~/.bashrc
# Aliases
source ~/.config/fish/alias.fish
source ~/.config/fish/tmp.fish
# Custom functions
source ~/.config/fish/functions/misc.fish
source ~/.config/fish/completions/misc.fish

# z.lua
set _ZL_CMD z
lua /usr/share/z.lua/z.lua --init fish | source
set -gx _ZL_CD cd

# tem
tem fish-init

# Set default pager to vim
set -gx MANPAGER 'nvim +Man!'
set -gx MANWIDTH 80
set -gx PAGER 'nvim -c PAGER -'
set -gx EDITOR 'nvim'
set -gx VISUAL 'gvim'

# ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
# ┃ Quasi-vim-like key bindings ┃
# ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

bind -M default \el forward-char
bind -M insert \el forward-char
bind -M default \eh backward-char
bind -M insert \eh backward-char
bind -M default \cp up-or-search
bind -M insert \cp up-or-search
bind -M default \cn down-or-search
bind -M insert \cn down-or-search

# ┏━━━━━━━━━━━━━━━━┓
# ┃ Other bindings ┃
# ┗━━━━━━━━━━━━━━━━┛

# Copy the current contents of the command line
bind -M default \ec __copy_to_clipboard
bind -M insert \ec __copy_to_clipboard

# Run the current command in bash
bind -M default \eb __run_in_bash
bind -M insert \eb __run_in_bash

# Prepend o in front of current command
bind -M default \eo __prepend_o
bind -M insert \eo __prepend_o

# Prepend o in front of current command
bind -M default \em __prepend_man
bind -M insert \em __prepend_man

bind -M default \et term
bind -M insert \et term

bind -M default \en __prepend_cmd_with_notify
bind -M insert \en __prepend_cmd_with_notify

# ┏━━━━━━━━━━━━━━━┓
# ┃ Custom colors ┃
# ┗━━━━━━━━━━━━━━━┛

set -U fish_color_command           brblue
set -U fish_color_quote             brgreen
set -U fish_color_param             brcyan
set -U fish_color_autosuggestion    brblack
set -U fish_color_cancel         -r red
set -U fish_color_error             red
set -U fish_color_comment           green
set -U fish_color_operator          normal
set -U fish_color_redirection       brmagenta
set -U fish_pager_color_progress    brgreen
set -U fish_pager_color_description green
set -U fish_color_end               yellow

# ┏━━━━━━━━━┓
# ┃ Plugins ┃
# ┗━━━━━━━━━┛

# pj - for projects @ oh-my-fish/plugin-pj
set -gx PROJECT_PATHS ~/projects

# ┏━━━━━━━━━━━━━━━┓
# ┃ Miscellaneous ┃
# ┗━━━━━━━━━━━━━━━┛

# Disable path shortening
set fish_prompt_pwd_dir_length 0
