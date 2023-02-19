#!/usr/bin/env sh

exec 3>&1 1>&2

set -e

# Entrypoint for the container created from Dockerfile

usage() {
    echo 'Usage: docker run docker.veracioux.me/dotfiles-generator [OPTIONS]'
    echo '  -r, --remote    The remote repository to clone'
    echo '  -b, --branch    The git ref to checkout'
    echo '  -u, --user      The UNIX user the config is meant for'
    echo '  -h, --home      The path of the home directory, if it differs from /home/<user>'
}

parsed_args="$(getopt --name run --options hr:b:u:h --long help,remote:,branch:,user:,home: -- "$@")"

eval set -- "$parsed_args"

remote=https://github.com/veracioux/dotfiles
branch=master
home= # Intentionally empty
user="$(whoami)"

while :; do
    case "$1" in
        -r | --remote)
            remote="$2"
            shift 2
            ;;
        -b | --branch)
            branch="$2"
            shift 2
            ;;
        -u | --user)
            if [ -z "$home" ]; then
                export HOME="/home/$user"
            fi
            shift 2
            ;;
        -H | --home)
            home="$1"
            export HOME="$2"
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

cd ~
git config --global init.defaultBranch non-master-to-avoid-conflict
git init
git remote add origin "$remote"
git fetch origin "$branch:$branch" --depth 1
git checkout "$branch"

cd ~

emacs --script .haris/bootstrap/tangle-all.sh

exec 1>&3
cd /tmp/tangle-"$user"
tar czv .
