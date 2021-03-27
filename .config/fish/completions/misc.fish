# chbg
set -l args (pushd /usr/share/backgrounds/; command ls -Q; popd )
complete --command chbg --no-files --arguments="$args"
