set -l args (cat (fcmd cf) | sed -n 's/\s*\(.*\))/\1/p')
complete --command cf --no-files --arguments="$args"
