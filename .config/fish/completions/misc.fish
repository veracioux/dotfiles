# For commands defined in ../misc.fish

# chbg
set -l args (pushd /usr/share/backgrounds/; command ls -Q; popd )
complete --command chbg --no-files --arguments="$args"

# Other commands

set -l args (cat (fcmd cf) | sed -n 's/\s*\(.*\))/\1/p')
for cmd in {,cd,vi,cat,e}cf
    complete --command $cmd --no-files --arguments="$args"
end

set -l args (ls -1 $PATH 2>/dev/null | grep -v ':$' | sed 's/->.*//g')
for cmd in {,cd,vi,cat,e}cmd
    complete --command $cmd --no-files --arguments="$args"
end

set -l args (pushd ~/.vim/snips; command ls | sed 's_\(.*\)\.snippets_\1_g'; popd)
complete --command snip --no-files --arguments="$args"
