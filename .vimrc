syntax on
set number
set relativenumber
set nocompatible				 "required
filetype off					 "required
filetype plugin on
set exrc
set showcmd
let mapleader = "\<Space>"
set breakindent
set clipboard^=unnamed

set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=0
set smarttab
set autoindent

set foldmethod=syntax
set nofoldenable

set colorcolumn=81
set tw=80
set ignorecase
set smartcase
set incsearch
if has('gui_running')
	set guioptions -=T
	set guioptions -=m
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

	Plugin 'ycm-core/YouCompleteMe'

	" Misc
	if has('nvim')
		Plugin 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
	endif

call vundle#end()

filetype plugin indent on		"required

" Set theme
colorscheme customtheme

"""""""""""""""""""
" Custom mappings "
"""""""""""""""""""

	noremap		Y		y$
	noremap		vv		V
	noremap		V		v$
	map			<C-c>	"+y
	noremap		<leader>t :silent !term<CR>
    noremap     <M-j>   <C-e>
    noremap     <M-k>   <C-y>

	""" Insertions

	" Header under/overline
	noremap 	<leader>h yyp0Vr
	noremap 	<leader>H yyP0Vr
	" Line separator -- depends on NERDCommenter
	noremap		<leader>S 60i#

	" Commands

	cnoreabbrev W w
	" Subvert is part of Abolish plugin
	cnoreabbrev S Subvert
	command! Src so ~/.vimrc

	" NERDTree
	noremap		<leader>n :NERDTreeToggle<CR>

	" Splits navigation
	noremap		<C-h> <C-w>h
	noremap		<C-j> <C-w>j
	noremap		<C-k> <C-w>k
	noremap		<C-l> <C-w>l

	" GVim - toggle menubar
	function ToggleMenubar()
		if &go=~#'m'
			set go-=m
		else
			set go+=m
		endif
	endfunction
	noremap		<M-m> :call ToggleMenubar()<CR>

"""""""""""""""""
" YouCompleteMe "
"""""""""""""""""

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

"""""""""""""
" UltiSnips "
"""""""""""""

	let g:UltiSnipsExpandTrigger = "<tab>"
	let g:UltiSnipsJumpForwardTrigger = "<tab>"
	let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

	let g:UltiSnipsSnippetsDir = "~/.vim/my-snippets"
	let g:UltiSnipsSnippetDirectories = [ '/home/haris/.vim/my-snippets', '/home/haris/templates/latex']

""""""""""
" Vimtex "
""""""""""

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

""""""""""""""
" EasyMotion "
""""""""""""""
	nmap \ <Plug>(easymotion-prefix)

"""""""
" Riv "
"""""""

	let g:riv_disable_folding = 1
	let g:riv_fold_level = 0
	let g:riv_fold_auto_update = 0
	let g:riv_auto_fold_force = 0
	let g:riv_auto_format_table = 0
