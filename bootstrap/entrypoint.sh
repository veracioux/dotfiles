#!/usr/bin/env sh

exec 3>&1 1>&2

set -e

# Entrypoint for the container created from Dockerfile

usage() {
    echo 'Usage: docker run docker.veracioux.me/dotfiles-generator [OPTIONS]'
    echo '  -u, --user      The UNIX user the config is meant for'
    echo '  -h, --home      The path of the home directory, if it differs from /home/<user>'
}

parsed_args="$(getopt --name run --options hr:b:u:h --long help,user:,home: -- "$@")"

eval set -- "$parsed_args"

home=''
user=''

while :; do
    case "$1" in
        -u | --user)
            user="$2"
            if [ -z "$home" ]; then
                home="/home/$user"
            fi
            shift 2
            ;;
        -H | --home)
            home="$2"
            shift 2
            ;;
        --)
            shift; break
            ;;
        *)
            usage
            exit 0
            ;;
    esac
done

if [ -z "$user" ]; then
    echo "ERROR: --user option is required" >&2
    exit 1
fi

cd ~/.haris

# For some reason the '#+SETUPFILE' directive is ignored, so I have to manually
# replace them with the contents of ~/.haris/.setup.org.
sed '/#+SETUPFILE: .*\.setup\.org$/{
s_#+SETUPFILE: .*\.setup\.org$__g
r .setup.org
}' -i *.org */*.org

# These are used by the tangle script to determine destinations
export USER="$user" HOME="$home"
emacs --script bootstrap/tangle-all.sh

exec 1>&3
cd "$home"
tar czv .
