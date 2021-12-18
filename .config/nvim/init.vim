source ~/.vimrc

set inccommand=split

command! Src so ~/.config/nvim/init.vim
command! So so .nvimrc

colorscheme customtheme

if exists('g:started_by_firenvim') && g:started_by_firenvim

    set laststatus=0 nonumber noruler noshowcmd relativenumber!
	noremap <CR> :wq<CR>
	inoremap <CR> <C-o>:wq<CR>

	fu! AutoResize()
		if expand('%') !~ '.*overleaf.*'
			autocmd TextChanged,TextChangedI,TextChangedP * silent let &lines=line('$')
		else
			autocmd! TextChanged,TextChangedI,TextChangedP *
		endif
	endfu

	autocmd BufNewFile,BufEnter,BufRead * call AutoResize()

	let g:firenvim_config = { 
   		\ 'globalSettings': {
       	\ 'alt': 'all',
    	\  },
    	\ 'localSettings': {
       	 	\ '.*': {
				\ 'cmdline': 'firenvim',
				\ 'priority': 0,
				\ 'selector': 'textarea',
				\ 'takeover': 'always',
			\ },
		\ }
	\ }

	let fc = g:firenvim_config['localSettings']

	let fc['.*'] = {'takeover': 'never'}
	let fc['localhost:.*'] = { 'takeover': 'never' }
	let fc['facebook.*'] = { 'takeover': 'never' }
	let fc['mail\.google.*'] = { 'takeover': 'never' }
	let fc['desmos.com*'] = { 'takeover': 'never' }
	let fc['github.com*'] = { 'takeover': 'never' }
	let fc['exam.net*'] = { 'takeover': 'never' }

	au BufEnter localhost* silent set ft=python
	au BufEnter github.com* silent set ft=markdown

endif

source ~/.config/nvim/init.tmp.vim

let g:python3_host_prog = '/bin/python3'
