set -l args (cat (fcmd cf) | sed -n 's/\s*\(.*\))/\1/p')
complete --command cdcf --no-files --arguments="$args"
