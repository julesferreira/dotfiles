aug my_default_mappings
	au!

	inoremap jk <esc>
	cnoremap jk <c-c>
	inoremap <esc> <nop>
	nn j gj
	nn k gk

	no ; :
	nn : <nop>

	nnoremap <C-W>\ :vsplit<CR>
	nnoremap <C-W>- :split<CR>

aug end

