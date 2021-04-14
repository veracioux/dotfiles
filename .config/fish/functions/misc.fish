# Create a new dir and cd
function ndir;  mkdir -p "$argv"; cd "$argv"; end

# Run a command and disown
function o; $argv & disown >/dev/null 2>/dev/null; end

# Open a GUI app and disown
function open; for file in $argv; o xdg-open "$file"; end; end

# Vim help
function vh; vim -c ":h $argv | only"; end

# Save the path of the argument to the clipboard
function copypath; realpath $argv | xsel -b; end

# When you ls, save the argument so you can quickly cd to that folder.
# It's not fool-proof, but it works in most situations and it's safe.
function ls 
	lsd --color=auto $argv
	set -g __last_ls_folder "$argv"
end

# cd to the last directory you have ls-ed
function cls
	if test -n "$__last_ls_folder"
		cd "$__last_ls_folder"
	end
end

function chbg
    set path /usr/share/backgrounds/"$argv[1]"
    feh --bg-fill "$path"
    rm ~/.wallpaper
    ln -s "$path" ~/.wallpaper
end

# Productivity shortcuts
function cdcf;   set file (cf "$argv");   test -f "$file" && cd (dirname "$file"); end
function catcf;  set file (cf "$argv");   test -f "$file" && cat         "$file" ; end
function vicf;   set file (cf "$argv");   test -f "$file" && vim         "$file" ; end
function ecf;    set file (cf "$argv");   test -f "$file" && emacs       "$file" ; end

function cdcmd;  set file (fcmd "$argv"); test -f "$file" && cd (dirname "$file"); end
function catcmd; set file (fcmd "$argv"); test -f "$file" && cat         "$file" ; end
function vicmd;  set file (fcmd "$argv"); test -f "$file" && vim         "$file" ; end
function ecmd;   set file (fcmd "$argv"); test -f "$file" && emacs       "$file" ; end

####################################
# Helper functions for keybindings #
####################################

function __copy_to_clipboard
    echo (commandline -b) | xsel -b
end

function __run_in_bash
    set -l cmd (commandline -b)
    echo
    eval bash -c "'source ~/.bashrc; $cmd'"
    commandline -f repaint
    commandline -r ''
end

function __prepend_o
    commandline -C 0
    commandline -i 'o '
    commandline -f end-of-line
end

function __prepend_man
    commandline -C 0
    commandline -i 'man '
    commandline -f end-of-line
end

function __prepend_cmd_with_notify
    commandline -C 0
    commandline -i 'cmd-with-notify '
    commandline -f end-of-line
end
