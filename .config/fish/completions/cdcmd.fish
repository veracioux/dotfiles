set -l args (ls -1 $PATH 2>/dev/null | grep -v ':$' | sed 's/->.*//g')
complete --command cdcmd --no-files --arguments="$args"
