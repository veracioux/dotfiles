set fish_greeting ''
fish_vi_key_bindings

# Aliases
source ~/.config/fish/alias.fish
source ~/.config/fish/alias.tmp.fish
# Custom functions
source ~/.config/fish/functions/misc.fish
# Load .profile
bass source ~/.profile

#########################
# Environment variables #
#########################

set -gx PATH ~/{,projects,wiki}/scripts**/ ~/bin $PATH

# Set default pager to vim
set -gx MANPAGER 'nvim -c MANPAGER -'
set -gx MANWIDTH 80
set -gx PAGER 'nvim -c PAGER -'
set -gx EDITOR 'nvim'
set -gx VISUAL 'gvim'

###############################
# Quasi-vim-like key bindings #
###############################

bind -M default \el forward-char
bind -M insert \el forward-char
bind -M default \eh backward-char
bind -M insert \eh backward-char
bind -M default \cp up-or-search
bind -M insert \cp up-or-search
bind -M default \cn down-or-search
bind -M insert \cn down-or-search

##################
# Other bindings #
##################

# Copy the current contents of the command line
bind -M default \ec __copy_to_clipboard
bind -M insert \ec __copy_to_clipboard

# Run the current command in bash
bind -M default \eb __run_in_bash
bind -M insert \eb __run_in_bash

# Prepend o in front of current command
bind -M default \eo __prepend_o
bind -M insert \eo __prepend_o

#################
# Custom colors #
#################

set fish_color_command brblue
set fish_color_quote brgreen
set fish_color_param brcyan
set fish_color_autosuggestion brblack
set fish_color_cancel -r red
set fish_color_error red
set fish_color_comment green
set fish_color_operator normal
set fish_color_redirection brmagenta
set fish_pager_color_progress brgreen
set fish_pager_color_description green

###########
# Plugins #
###########

# pj - for projects @ oh-my-fish/plugin-pj
set -gx PROJECT_PATHS ~/projects

#################
# Miscellaneous #
#################

# Disable path shortening
set fish_prompt_pwd_dir_length 0
