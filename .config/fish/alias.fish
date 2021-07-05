alias src_fish='source ~/.config/fish/config.fish'
alias emacs 'o emacsclient --create-frame'
function dragon; dragon-drag-and-drop $argv & disown; end

abbr rm 'rm -i'
abbr mv 'mv -i'

# Pacman commands
abbr p   'pacman'
abbr pqi 'pacman -Qi'
abbr pql 'pacman -Ql'
abbr pqm 'pacman -Qm'
abbr pqm 'pacman -Qm'
abbr pqo 'pacman -Qo'
abbr pqs 'pacman -Qs'
abbr pss 'pacman -Ss'
abbr sp  'cmd-with-notify sudo pacman'
abbr sps 'cmd-with-notify sudo pacman -S'
abbr spr 'cmd-with-notify sudo pacman -R'

abbr g 'git'
abbr v 'vim'
abbr s 'sudo'
abbr paru 'cmd-with-notify paru'
abbr py 'python'
abbr copy 'xsel -b'
abbr paste 'xsel -b -o'
abbr oct 'OCTAVE_BASIC=true octave'

abbr yt 'ytfzf -t -s'
abbr t  'tem'
abbr vf 'vim (fzf)'
abbr fm 'vifm'
abbr fb 'facebook-cli'
abbr c  'conf'

abbr tb 'nc termbin.com 9999'
abbr asc 'asciinema'
abbr mic 'amixer set Capture toggle'

set aur 'aur@aur.archlinux.org'
