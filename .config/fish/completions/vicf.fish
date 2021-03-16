set -l args (cat (fcmd cf) | sed -n 's/\s*\(.*\))/\1/p')
complete --command vicf --no-files --arguments="$args"
