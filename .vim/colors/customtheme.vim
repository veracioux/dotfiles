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

" Remove pipe symbols
set fillchars+=vert:\ 

hi Normal			                      guifg=#ffffff	guibg=#202023
hi Statement	ctermfg=12                guifg=#8c9eff		            cterm=bold      gui=bold
hi Comment		ctermfg=2                 guifg=#54ba88
hi Type			ctermfg=12                guifg=#8c9eff		                            gui=bold
hi Constant		ctermfg=11                guifg=#f4ff8c
hi PreProc		ctermfg=13                guifg=#ff99c9
hi Identifier	ctermfg=14                guifg=#8cf7ff
hi Todo			ctermfg=4   ctermbg=3     guifg=#3d5afe	guibg=#ffa655   cterm=bold	    gui=bold
hi LineNr		ctermfg=7                 guifg=#78909c
hi MatchParen	ctermfg=3   ctermbg=none  guifg=#ffa655 guibg=#202023	cterm=underline gui=underline
hi Folded		ctermfg=4   ctermbg=16    guifg=#3d5afe	guibg=#303030
hi FoldColumn	ctermfg=4   ctermbg=16    guifg=#3d5afe	guibg=#303030
hi Conceal		ctermfg=14  ctermbg=16    guifg=#8cf7ff	guibg=#303030
hi Error		ctermfg=15  ctermbg=1     guifg=#ffffff	guibg=#ff5555

hi ColorColumn		        ctermbg=16                  guibg=#303030
hi SignColumn				ctermbg=16	                guibg=#202023
hi Search		ctermfg=0	ctermbg=3     guifg=#202023	guibg=#ffa655

hi VertSplit	ctermfg=8   ctermbg=0     guifg=#303030	guibg=#202023

hi StatusLine   ctermfg=12                guifg=#8c9eff
hi StatusLineNC ctermfg=12                guifg=#8c9eff

" VimDiff
hi DiffDelete	ctermfg=15	ctermbg=17
hi DiffAdd		ctermfg=15	ctermbg=18
hi DiffChange	ctermfg=15	ctermbg=21
hi DiffText		ctermfg=11	ctermbg=19		                            cterm=bold

" YouCompleteMe
hi Pmenu		ctermfg=0	ctermbg=12	  guifg=#202023 guibg=#8c9eff
hi PmenuSel		ctermfg=0	ctermbg=4	  guifg=#202023	guibg=#6b88fe
hi PmenuSbar	ctermfg=0	ctermbg=12	  guifg=#202023	guibg=#8c9eff
