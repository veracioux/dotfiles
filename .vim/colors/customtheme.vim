" Set 'background' back to the default.  The value can't always be estimated
" and is then guessed.
hi clear Normal
set bg&

" Remove all existing highlighting and set the defaults.
hi clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

let colors_name = "customtheme"

if has('gui_running') | let s:k  = '#202023' | else | let s:k  =  0 | endif
if has('gui_running') | let s:r  = '#ff5555' | else | let s:r  =  1 | endif
if has('gui_running') | let s:g  = '#54ba88' | else | let s:g  =  2 | endif
if has('gui_running') | let s:y  = '#ffa655' | else | let s:y  =  3 | endif
if has('gui_running') | let s:b  = '#6b88fe' | else | let s:b  =  4 | endif
if has('gui_running') | let s:m  = '#d098ff' | else | let s:m  =  5 | endif
if has('gui_running') | let s:c  = '#8cceff' | else | let s:c  =  6 | endif
if has('gui_running') | let s:w  = '#92aab7' | else | let s:w  =  7 | endif
if has('gui_running') | let s:K  = '#6b746b' | else | let s:K  =  8 | endif
if has('gui_running') | let s:R  = '#ff8c8c' | else | let s:R  =  9 | endif
if has('gui_running') | let s:G  = '#8cff8c' | else | let s:G  = 10 | endif
if has('gui_running') | let s:Y  = '#dee695' | else | let s:Y  = 11 | endif
if has('gui_running') | let s:B  = '#8C9EFF' | else | let s:B  = 12 | endif
if has('gui_running') | let s:M  = '#f2aacc' | else | let s:M  = 13 | endif
if has('gui_running') | let s:C  = '#8cceff' | else | let s:C  = 14 | endif
if has('gui_running') | let s:W  = '#dddddd' | else | let s:W  = 15 | endif
if has('gui_running') | let s:x  = '#303030' | else | let s:x  = 16 | endif         " color 16

let s:n  = 'none'

if has('gui_running')
      let s:vmode = 'gui'
else
      let s:vmode = 'cterm'
endif

" Remove pipe symbols
set fillchars+=vert:\ 

exe "hi Normal          ".s:vmode."fg=".s:W."                                                   "
exe "hi Statement       ".s:vmode."fg=".s:B."                           ".s:vmode."=bold        "
exe "hi Type            ".s:vmode."fg=".s:b."                           ".s:vmode."=bold        "
exe "hi Comment         ".s:vmode."fg=".s:g."                                                   "
exe "hi Constant        ".s:vmode."fg=".s:M."                                                   "
exe "hi PreProc         ".s:vmode."fg=".s:Y."                                                   "
exe "hi Identifier      ".s:vmode."fg=".s:C."                           ".s:vmode."=none        "
exe "hi LineNr          ".s:vmode."fg=".s:w."   ".s:vmode."bg=".s:k."                           "
exe "hi Todo            ".s:vmode."fg=".s:B."   ".s:vmode."bg=".s:y."   ".s:vmode."=bold        "
exe "hi MatchParen      ".s:vmode."fg=".s:y."   ".s:vmode."bg=".s:y."   ".s:vmode."=underline   "
exe "hi Folded          ".s:vmode."fg=".s:w."   ".s:vmode."bg=".s:x."                           "
exe "hi FoldColumn      ".s:vmode."fg=".s:b."   ".s:vmode."bg=".s:x."                           "
exe "hi Conceal         ".s:vmode."fg=".s:C."   ".s:vmode."bg=".s:x."                           "
exe "hi Error           ".s:vmode."fg=".s:W."   ".s:vmode."bg=".s:r."                           "
                                                                                                 
exe "hi ColorColumn     ".s:vmode."fg=".s:W."   ".s:vmode."bg=".s:x."                           "
exe "hi SignColumn                              ".s:vmode."bg=".s:x."                           "
exe "hi VertSplit       ".s:vmode."fg=".s:K."   ".s:vmode."bg=".s:K."                           "
                                                                                                 
exe "hi Search          ".s:vmode."fg=".s:k."   ".s:vmode."bg=".s:y."   ".s:vmode."=bold        "
exe "hi StatusLine      ".s:vmode."fg=".s:B."   ".s:vmode."bg=".s:B."                           "
exe "hi StatusLineNC    ".s:vmode."fg=".s:B."   ".s:vmode."bg=".s:B."                           "

" VimDiff
exe "hi DiffDelete      ".s:vmode."fg=".s:W."   ".s:vmode."bg=".s:r."                           "
exe "hi DiffAdd         ".s:vmode."fg=".s:k."   ".s:vmode."bg=".s:g."                           "
exe "hi DiffChange      ".s:vmode."fg=".s:k."   ".s:vmode."bg=".s:m."                           "
exe "hi DiffText        ".s:vmode."fg=".s:M."   ".s:vmode."bg=".s:x."   ".s:vmode."=bold        "

" YouCompleteMe
exe "hi Pmenu           ".s:vmode."fg=".s:k."   ".s:vmode."bg=".s:m."                           "
exe "hi PmenuSel        ".s:vmode."fg=".s:k."   ".s:vmode."bg=".s:B."                           "
exe "hi PmenuSbar       ".s:vmode."fg=".s:k."   ".s:vmode."bg=".s:m."                           "
