syntax on
set number relativenumber
set statusline=\ %f\ %h%w%m%r\ %=%(%l,%c%V\ %=\ %P%)\ 
set nocompatible				" required
filetype off					" required
filetype plugin on
set noautoread
set exrc
set showcmd
set breakindent
set clipboard^=unnamed
set maxmempattern=2000
set updatetime=90				" used by gitgutter

set tabstop=4 shiftwidth=4
set expandtab
set softtabstop=0
set smarttab
set autoindent

set foldmethod=syntax nofoldenable

set textwidth=80 colorcolumn=81
set virtualedit=all
set ignorecase smartcase incsearch

if has('gui_running')
	set guioptions -=T guioptions -=m
	set mouse=a
endif
if !has('nvim')
	set noesckeys
endif

" Special buffers and syntax highlighting

au BufEnter * if &syntax == '' && expand('%:e') == '' | set ft=sh | endif
au BufNewFile,BufRead *.spacemacs set syntax=lisp
au BufNewFile,BufRead .octaverc set syntax=matlab
au BufNewFile,BufRead *.snippets set ft=snippets
au BufNewFile,BufRead *.py set foldmethod=indent
au BufNewFile,BufRead *.fish set ft=fish
au BufNewFile,BufRead PKGBUILD set ft=sh
au BufNewFile,BufRead * if &filetype == 'make' | set noexpandtab | endif

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

	Plugin 'vifm/vifm.vim'
	Plugin 'lervag/vimtex'
	Plugin 'tpope/vim-abolish'
	Plugin 'preservim/nerdcommenter'
	Plugin 'sirver/ultisnips'
	Plugin 'easymotion/vim-easymotion'
	Plugin 'honza/vim-snippets'
	Plugin 'ap/vim-css-color'
	Plugin 'Rykka/InstantRst'
	Plugin 'Rykka/riv.vim'
	Plugin 'preservim/nerdtree'
	Plugin 'lambdalisue/vim-pager'
	Plugin 'lambdalisue/vim-manpager'

	" Syntax highlighting
	Plugin 'dag/vim-fish'

    " IDE 
	Plugin 'ycm-core/YouCompleteMe'
    Plugin 'sheerun/vim-polyglot'
    Plugin 'preservim/tagbar' 			" NOTE: requires ctags installed
    Plugin 'dyng/ctrlsf.vim'			" NOTE: requires ack installed
    Plugin 'derekwyatt/vim-fswitch'
    Plugin 'derekwyatt/vim-protodef'
	Plugin 'matze/vim-move'
	Plugin 'junegunn/vim-easy-align'
	Plugin 'airblade/vim-gitgutter'

	" Misc
	if has('nvim')
		Plugin 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
	endif
	Plugin 'PotatoesMaster/i3-vim-syntax'

call vundle#end()

filetype plugin indent on		"required

" Set theme
colorscheme customtheme

" ┏━━━━━━━━━━━━━━━━━┓
" ┃ Custom mappings ┃
" ┗━━━━━━━━━━━━━━━━━┛
	let mapleader = "\<Space>"

	noremap		Y		y$
	noremap		vv		V
	noremap		V		v$
	map			<C-c>	"+y
	noremap		<leader>t :silent !term<CR>
    noremap     <M-j>   <C-e>
    noremap     <M-k>   <C-y>
	noremap		<M-w>	<C-w><C-w>

	""" Insertions

	" Header under/overline
	noremap 	<leader>h yyp0Vr
	noremap 	<leader>H yyP0Vr
	" Line separator -- depends on NERDCommenter
	noremap		<leader>S 60i#
	" Create a nice Unicode box around the current line of text, and comment out
	nmap <leader>b <leader>B#<esc>
	" Same as above, but lets you specify a comment delimiter
	nmap <leader>B I <esc>yyPhVr━jphVr━A┛<esc>kr┃kr┓I ┏<esc>j0i ┃<esc>jI ┗<esc>h<C-v>kkI

	" Commands

	cnoreabbrev W w
	" Subvert is part of Abolish plugin
	cnoreabbrev S Subvert
	command! Src so ~/.vimrc

	nmap <leader>r :!./%<CR>
	nmap <leader>m :make
	nmap <leader>c :!cmake -S . -B _build && cmake --build _build<CR>

	" NERDTree
	noremap		<leader>n :NERDTreeToggle<CR>

	" GVim - toggle menubar
	function ToggleMenubar()
		if &go=~#'m'
			set go-=m
		else
			set go+=m
		endif
	endfunction
	noremap		<M-m> :call ToggleMenubar()<CR>

" ┏━━━━━━━━━━━━━━━┓
" ┃ YouCompleteMe ┃
" ┗━━━━━━━━━━━━━━━┛
	if !exists('g:ycm_semantic_triggers')
		let g:ycm_semantic_triggers = {}
	endif

	if !has('nvim') " TODO Why do I have this problem
		au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme
	endif
	
	" Make YCM work with UltiSnips
    let g:ycm_key_list_select_completion = ['<C-n>']
    let g:ycm_key_list_previous_completion = ['<C-p>']
    let g:SuperTabDefaultCompletionType = '<C-n>'

	let g:ycm_auto_hover = ''
	nmap <leader>D <plug>(YCMHover)

	set completeopt-=preview
	let g:ycm_show_diagnostics_ui = 0
	let g:ycm_autoclose_preview_window_after_insertion = 1
	let g:ycm_confirm_extra_conf = 0

" ┏━━━━━━━━━━━┓
" ┃ UltiSnips ┃
" ┗━━━━━━━━━━━┛
	let g:UltiSnipsExpandTrigger = "<tab>"
	let g:UltiSnipsJumpForwardTrigger = "<tab>"
	let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

	let g:UltiSnipsSnippetsDir = "~/.vim/snips"
	let g:UltiSnipsSnippetDirectories = [ '/home/haris/.vim/snips', '/home/haris/templates/latex']

" ┏━━━━━━━━┓
" ┃ Vimtex ┃
" ┗━━━━━━━━┛
	let g:vimtex_complete_enabled = 1
	let g:vimtex_complete_close_braces = 1
    let g:vimtex_fold_enabled = 1
	let g:tex_flavor='latex'
	let g:vimtex_view_method='zathura'
	let g:vimtex_quickfix_mode = 0
	set conceallevel=1
	let g:tex_conceal = 'abdmgs'
	let g:vimtex_syntax_conceal = {
				\ 'fancy': 1,
				\ 'accents': 1,
				\ 'greek': 1,
				\ 'math_bounds': 1,
				\ 'math_delimiters': 1,
				\ 'math_fracs': 1,
				\ 'math_super_sub': 1,
				\ 'styles': 1
				\}
	let g:vimtex_compiler_latexmk = {
				\ 'build_dir' : '_build',
				\}
	nmap ysc <plug>(vimtex-cmd-create)
	vmap ysc <plug>(vimtex-cmd-create)

" ┏━━━━━━━━━━━━┓
" ┃ EasyMotion ┃
" ┗━━━━━━━━━━━━┛
	nmap \ <Plug>(easymotion-prefix)

" ┏━━━━━━━━━━┓
" ┃ NERDTree ┃
" ┗━━━━━━━━━━┛
	let NERDTreeShowBookmarks   = 1 			" Show the bookmarks table
	let NERDTreeShowHidden      = 1 			" Show hidden files
	let NERDTreeShowLineNumbers = 0 			" Hide line numbers
	let NERDTreeMinimalMenu     = 1 			" Use the minimal menu (m)
	let NERDTreeWinPos          = 'left' 		" Panel opens on the left side
	let NERDTreeWinSize         = 31        	" Set panel width to 31 columns

" ┏━━━━━━━━┓
" ┃ Tagbar ┃
" ┗━━━━━━━━┛
	let g:tagbar_autofocus   = 1 				" Focus the panel when opening
	let g:tagbar_autoshowtag = 1				" Highlight the active tag
	let g:tagbar_position = 'botright vertical' " Make vertical and place right
	nmap <F8> :TagbarToggle<CR>
	set tags=.tags

" ┏━━━━━━━━┓
" ┃ CtrlFS ┃
" ┗━━━━━━━━┛
	let g:ctrlsf_backend = 'ack' 							" Use the ack tool as the backend
	let g:ctrlsf_auto_close = { "normal":0, "compact":0 } 	" Auto close the results panel when opening a file
	let g:ctrlsf_auto_focus = { "at":"start" }				" Immediately switch focus to the search window
	let g:ctrlsf_auto_preview = 0							" Don't open the preview window automatically
	let g:ctrlsf_case_sensitive = 'smart'					" Use the smart case sensitivity search scheme
	let g:ctrlsf_default_view = 'normal'					" Normal mode, not compact mode
	let g:ctrlsf_regex_pattern = 0							" Use absoulte search by default
	let g:ctrlsf_position = 'right'							" Position of the search window
	let g:ctrlsf_winsize = '46'								" Width or height of search window
	let g:ctrlsf_default_root = 'cwd'						" Search from the current working directory

	" (Ctrl-F + f) Open search prompt (Normal Mode)
	nmap <C-F>f <Plug>CtrlSFPrompt
	" (Ctrl-F + f) Open search prompt with selection (Visual Mode)
	xmap <C-F>f <Plug>CtrlSFVwordPath
	" (Ctrl-F + F) Perform search with selection (Visual Mode)
	xmap <C-F>F <Plug>CtrlSFVwordExec
	" (Ctrl-F + n) Open search prompt with current word (Normal Mode)
	nmap <C-F>n <Plug>CtrlSFCwordPath
	" (Ctrl-F + o )Open CtrlSF window (Normal Mode)
	nnoremap <C-F>o :CtrlSFOpen<CR>
	" (Ctrl-F + t) Toggle CtrlSF window (Normal Mode)
	nnoremap <C-F>t :CtrlSFToggle<CR>
	" (Ctrl-F + t) Toggle CtrlSF window (Insert Mode)
	inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

" ┏━━━━━━━━━┓
" ┃ FSwitch ┃
" ┗━━━━━━━━━┛
	au! BufEnter *.cpp let b:fswitchdst = 'hpp,h'
	au! BufEnter *.h let b:fswitchdst = 'cpp,c'
	nmap <silent> <Leader>of :FSHere<cr>
	nmap <silent> <Leader>ol :FSSplitRight<cr>
	nmap <silent> <Leader>oh :FSSplitLeft<cr>
	nmap <silent> <Leader>ok :FSSplitAbove<cr>
	nmap <silent> <Leader>oj :FSSplitBelow<cr>
	nmap <silent> <Leader>oL :FSRight<cr>
	nmap <silent> <Leader>oH :FSLeft<cr>
	nmap <silent> <Leader>oK :FSAbove<cr>
	nmap <silent> <Leader>oJ :FSBelow<cr>

" ┏━━━━━━━━━━┓
" ┃ Protodef ┃
" ┗━━━━━━━━━━┛
	" Pull in prototypes
	nmap <buffer> <silent> <leader> ,PP
	" Pull in prototypes without namespace definition
	nmap <buffer> <silent> <leader> ,PN

" ┏━━━━━━┓
" ┃ Move ┃
" ┗━━━━━━┛
    let g:move_key_modifier = 'C'

" ┏━━━━━━━┓
" ┃ Align ┃
" ┗━━━━━━━┛
	xmap ga <Plug>(EasyAlign)
	nmap ga <Plug>(EasyAlign)

" ┏━━━━━┓
" ┃ FZF ┃
" ┗━━━━━┛
	nmap <leader>/ :FZF<CR>

" ┏━━━━━┓
" ┃ Riv ┃
" ┗━━━━━┛
	let g:riv_disable_folding = 0
	let g:riv_fold_level = 1
	let g:riv_fold_auto_update = 0
	let g:riv_auto_fold_force = 0
	let g:riv_auto_format_table = 0
