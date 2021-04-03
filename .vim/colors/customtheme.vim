" Remove all existing highlighting and set the defaults.
hi clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

let colors_name = "customtheme"

if has('gui_running') | let s:k  = '#1e1e1e' | else | let s:k  =  0 | endif
if has('gui_running') | let s:r  = '#ff5555' | else | let s:r  =  1 | endif
if has('gui_running') | let s:g  = '#54d1bc' | else | let s:g  =  2 | endif
if has('gui_running') | let s:y  = '#f2b374' | else | let s:y  =  3 | endif
if has('gui_running') | let s:b  = '#6980fa' | else | let s:b  =  4 | endif
if has('gui_running') | let s:m  = '#d098ff' | else | let s:m  =  5 | endif
if has('gui_running') | let s:c  = '#8cceff' | else | let s:c  =  6 | endif
if has('gui_running') | let s:w  = '#92aab7' | else | let s:w  =  7 | endif

if has('gui_running') | let s:K  = '#6b746b' | else | let s:K  =  8 | endif
if has('gui_running') | let s:R  = '#ff8c8c' | else | let s:R  =  9 | endif
if has('gui_running') | let s:G  = '#98eb98' | else | let s:G  = 10 | endif
if has('gui_running') | let s:Y  = '#e0d97b' | else | let s:Y  = 11 | endif
if has('gui_running') | let s:B  = '#99a3ff' | else | let s:B  = 12 | endif
if has('gui_running') | let s:M  = '#f298c3' | else | let s:M  = 13 | endif
if has('gui_running') | let s:C  = '#a6d9ff' | else | let s:C  = 14 | endif
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

exe "hi Normal          ".s:vmode."fg=".s:W."   ".s:vmode."bg=".s:k."                           "
exe "hi Statement       ".s:vmode."fg=".s:B."                           ".s:vmode."=bold        "
exe "hi Type            ".s:vmode."fg=".s:b."                           ".s:vmode."=bold        "
exe "hi Comment         ".s:vmode."fg=".s:g."                                                   "
exe "hi Constant        ".s:vmode."fg=".s:y."                                                   "
exe "hi PreProc         ".s:vmode."fg=".s:m."                           ".s:vmode."=bold        "
exe "hi Identifier      ".s:vmode."fg=".s:C."                           ".s:vmode."=none        "
exe "hi LineNr          ".s:vmode."fg=".s:w."   ".s:vmode."bg=".s:k."                           "
exe "hi CursorLineNr    ".s:vmode."fg=".s:G."   ".s:vmode."bg=".s:k."   ".s:vmode."=bold        "
exe "hi Special         ".s:vmode."fg=".s:M."   ".s:vmode."bg=".s:k."                           "
exe "hi Todo            ".s:vmode."fg=".s:k."   ".s:vmode."bg=".s:R."   ".s:vmode."=bold        "
exe "hi MatchParen      ".s:vmode."fg=".s:m."   ".s:vmode."bg=".s:k."   ".s:vmode."=underline   "
exe "hi Folded          ".s:vmode."fg=".s:w."   ".s:vmode."bg=".s:x."                           "
exe "hi FoldColumn      ".s:vmode."fg=".s:b."   ".s:vmode."bg=".s:x."                           "
exe "hi Conceal         ".s:vmode."fg=".s:C."   ".s:vmode."bg=".s:x."                           "
exe "hi Error           ".s:vmode."fg=".s:k."   ".s:vmode."bg=".s:r."   ".s:vmode."=bold        "
                                                                                                 
exe "hi ColorColumn     ".s:vmode."fg=".s:W."   ".s:vmode."bg=".s:x."                           "
exe "hi SignColumn                              ".s:vmode."bg=".s:x."                           "
exe "hi VertSplit       ".s:vmode."fg=".s:K."   ".s:vmode."bg=".s:K."                           "
                                                                                                 
exe "hi Search          ".s:vmode."fg=".s:k."   ".s:vmode."bg=".s:Y."   ".s:vmode."=bold        "
exe "hi StatusLine      ".s:vmode."fg=".s:B."   ".s:vmode."bg=".s:k."                           "
exe "hi StatusLineNC    ".s:vmode."fg=".s:B."   ".s:vmode."bg=".s:k."                           "
exe "hi Visual          ".s:vmode."fg=".s:k."   ".s:vmode."bg=".s:m."   ".s:vmode."=bold        "

" VimDiff
exe "hi DiffDelete      ".s:vmode."fg=".s:W."   ".s:vmode."bg=".s:r."                           "
exe "hi DiffAdd         ".s:vmode."fg=".s:k."   ".s:vmode."bg=".s:g."                           "
exe "hi DiffChange      ".s:vmode."fg=".s:k."   ".s:vmode."bg=".s:m."                           "
exe "hi DiffText        ".s:vmode."fg=".s:M."   ".s:vmode."bg=".s:x."   ".s:vmode."=bold        "

" YouCompleteMe
exe "hi Pmenu           ".s:vmode."fg=".s:k."   ".s:vmode."bg=".s:m."                           "
exe "hi PmenuSel        ".s:vmode."fg=".s:k."   ".s:vmode."bg=".s:B."                           "
exe "hi PmenuSbar       ".s:vmode."fg=".s:k."   ".s:vmode."bg=".s:m."                           "

" vim-which-key
highlight default link WhichKey           _WhichKey
highlight default link WhichKeySeperator  _WhichKeySeperator
highlight default link WhichKeyGroup      _WhichKeyGroup    
highlight default link WhichKeyDesc       _WhichKeyDesc     
highlight default link WhichKeyFloating   _WhichKeyFloating
exe "hi _WhichKey           ".s:vmode."fg=".s:y."   ".s:vmode."bg=".s:k."                       "
exe "hi _WhichKeySeparator  ".s:vmode."fg=".s:M."   ".s:vmode."bg=".s:k."                       "
exe "hi _WhichKeyFloating   ".s:vmode."fg=".s:M."   ".s:vmode."bg=".s:k."                       "
exe "hi _WhichKeyGroup      ".s:vmode."fg=".s:m."   ".s:vmode."bg=".s:k."                       "
exe "hi _WhichKeyDesc       ".s:vmode."fg=".s:B."   ".s:vmode."bg=".s:k."                       "

" vim-easymotion
exe "hi EasyMotionTarget    ".s:vmode."fg=".s:B."                       ".s:vmode."=bold        "

