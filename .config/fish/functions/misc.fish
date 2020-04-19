# Create a new dir and cd
function ndir;  mkdir -p "$argv"; cd "$argv"; end

# Run a command and disown
function o; $argv & disown >/dev/null 2>/dev/null; end

# Open a GUI app and disown
function open; for file in $argv; o xdg-open "$file"; end; end

# Run emacs and disown
function emacs; command emacsclient --create-frame $argv & disown >/dev/null 2>/dev/null; end

# When you ls, save the argument so you can quickly cd to that folder.
# It's not fool-proof, but it works in most situations and it's safe.
function ls 
	exa --color=auto $argv
	set -g __last_ls_folder "$argv"
end

# cd to the last directory you have ls-ed
function cls
	if test -n "$__last_ls_folder"
		cd "$__last_ls_folder"
	end
end

# Convert a GitHub blob link to raw content link -- echo it
function rawblob
	echo "$argv" | sed -e 's:github\.com:raw\.githubusercontent.com:' -e 's:blob/::'
end
