# For commands defined in ../misc.fish

# chbg
complete --command chbg --no-files --arguments="(pushd /usr/share/backgrounds/; command ls -1; popd)"

# cmd-with-notify
complete --command cmd-with-notify -f -a '(complete -C(commandline -cp | sed "s:\S\+::"))'

# Other commands

for cmd in {,cd,vi,cat,e}cf
    complete --command $cmd --no-files -a '(lscf)'
end
for cmd in {f,cd,vi,cat,e}cmd
    complete -c $cmd -f \
        -a '(ls -1 $PATH 2>/dev/null | grep -v \':$\' | sed "s/->.*//g")'
end

complete -c snip -f -a \
    "(pushd ~/.vim/snips; command ls | sed 's_\(.*\)\.snippets_\1_g'; popd)"
