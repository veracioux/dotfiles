set -l args (command ls (~/.vim/snips) | sed 's_\(.*\)\.snippets_\1_g')
complete --command snip --no-files --arguments="$args"
