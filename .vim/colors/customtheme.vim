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

hi Statement		ctermfg=12		cterm=bold
hi Comment			ctermfg=2
hi Type				ctermfg=12		cterm=bold
hi Constant			ctermfg=11
hi PreProc			ctermfg=13
hi Identifier		ctermfg=14
hi Todo				ctermfg=4		ctermbg=3		 	cterm=bold
hi LineNr			ctermfg=7
hi MatchParen		ctermfg=3		ctermbg=none		cterm=underline
hi Folded			ctermfg=4		ctermbg=16
hi FoldColumn		ctermfg=4		ctermbg=16
hi Conceal			ctermfg=14		ctermbg=16
hi Error			ctermfg=15		ctermbg=1

hi ColorColumn						ctermbg=16
hi Search			ctermfg=0		ctermbg=3

hi VertSplit		ctermfg=8		ctermbg=0

hi StatusLine ctermfg=12
hi StatusLineNC ctermfg=12

" Remove pipe symbols
set fillchars+=vert:\ 

hi Normal			guifg=White			guibg=#202023
hi Statement		guifg=#8c9eff		gui=bold
hi Comment			guifg=#54ba88
hi Type				guifg=#8c9eff		gui=bold
hi Constant			guifg=#f4ff8c
hi PreProc			guifg=#ff99c9
hi Identifier		guifg=#8cf7ff
hi Todo				guifg=#3d5afe		guibg=#ffa655	gui=bold
hi LineNr			guifg=#78909c
hi MatchParen		guifg=#ffa655		guibg=#202023	gui=underline
hi Folded			guifg=#3d5afe		guibg=#303030
hi FoldColumn		guifg=#3d5afe		guibg=#303030
hi Conceal			guifg=#8cf7ff		guibg=#303030
hi Error			guifg=White			guibg=#ff5555

hi ColorColumn							guibg=#303030
hi Search			guifg=#202023		guibg=#ffa655

hi VertSplit		guifg=#303030		guibg=#202023

hi StatusLine guifg=#8c9eff
hi StatusLineNC guifg=#8c9eff

" VimDiff

hi DiffDelete		ctermfg=15		ctermbg=17
hi DiffAdd			ctermfg=15		ctermbg=18
hi DiffChange		ctermfg=15		ctermbg=21
hi DiffText			ctermfg=11		ctermbg=19		cterm=bold

" YouCompleteMe
hi Pmenu			ctermfg=0		ctermbg=12		guifg=#202023		guibg=#8c9eff
hi PmenuSel			ctermfg=0		ctermbg=4		guifg=#202023		guibg=#6b88fe
hi PmenuSbar		ctermfg=0		ctermbg=12		guifg=#202023		guibg=#8c9eff
