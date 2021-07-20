function fish_mode_prompt
	[ -n "$EMACS_VTERM" ] && return
	switch $fish_bind_mode
		case default
			set_color --bold brred
			echo '[N] '
		case insert
			# Show nothing
		case replace_one
			set_color --bold green
			echo '[r] '
		case replace
			set_color --bold blue
			echo '[R] '
		case visual
			set_color --bold magenta
			echo '[V] '
		case '*'
			set_color --bold red
			echo '?'
	end
	set_color normal
end
