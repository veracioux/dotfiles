function fish_prompt --description 'Write out the prompt'
    set -l last_pipestatus $pipestatus
    set -l normal (set_color normal)

    # Color the prompt differently when we're root
    set -l color_cwd $fish_color_cwd
    set -l prefix
    set -l suffix '$'
    if contains -- $USER root toor
        if set -q fish_color_cwd_root
            set color_cwd $fish_color_cwd_root
        end
        set suffix '#'
    end

    # If we're running via SSH, change the host color.
    set -l color_host $fish_color_host
    if set -q SSH_TTY
        set color_host $fish_color_host_remote
    end

    set -l prompt_status (__fish_print_pipestatus " [" "]" "|" \
        (set_color brred) (set_color --bold brred) $last_pipestatus)

    echo -n -s  (set_color --bold brblue)   "$USER" ' '                  \
                (set_color magenta)         (prompt_pwd)        $normal  \
                (set_color brmagenta)       (fish_vcs_prompt)            \
                (set_color brmagenta)       $prompt_status               \
                (set_color yellow)          ' ' $suffix ' '
end

