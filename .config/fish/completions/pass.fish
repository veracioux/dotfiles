source /usr/share/fish/vendor_completions.d/pass.fish
complete -c pass -a 'add' -n "no_positional_args"
complete -c pass -a '(complete -C "pass show ")' -f -n '__fish_seen_subcommand_from add'
