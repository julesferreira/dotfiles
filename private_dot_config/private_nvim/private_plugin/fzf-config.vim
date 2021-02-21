" ============================================================================
" FZF {{{
" ============================================================================

if has('nvim') || has('gui_running')
	let $FZF_DEFAULT_OPTS .= ' --inline-info'
	" let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

let g:fzf_colors = {
	\'fg':      ['fg', 'Normal'],
	\'bg':      ['bg', 'Normal'],
	\'hl':      ['fg', 'Comment'],
	\'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
	\'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
	\'hl+':     ['fg', 'Statement'],
	\'info':    ['fg', 'PreProc'],
	\'border':  ['fg', 'Ignore'],
	\'prompt':  ['fg', 'Conditional'],
	\'pointer': ['fg', 'Exception'],
	\'marker':  ['fg', 'Keyword'],
	\'spinner': ['fg', 'Label'],
	\'header':  ['fg', 'Comment']
\}

let g:fzf_history_dir = '~/.local/share/fzf-history'

command! -bang -nargs=? -complete=dir Files
	\ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

command! PlugHelp call fzf#run(fzf#wrap({
	\ 'source': sort(keys(g:plugs)),
	\ 'sink': function('s:plug_help_sink')}))

function! s:plug_help_sink(line)
	let dir = g:plugs[a:line].dir
	for pat in ['doc/*.txt', 'README.md']
		let match = get(split(globpath(dir, pat), "\n"), 0, '')
		if len(match)
			execute 'tabedit' match
			return
		endif
	endfor
	tabnew
	execute 'Explore' dir
endfunction

aug my_fzf_group
	au!
	nnoremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
	nnoremap <silent> <Leader>fb :Buffers<CR>
	nnoremap <silent> <Leader>fl :Lines<CR>
	nnoremap <silent> <Leader>fm :Marks<CR>
	nnoremap <silent> <Leader>fs :History/<CR>
	nnoremap <silent> <Leader>fh :History<CR>

	imap <c-x><c-f> <plug>(fzf-complete-path)
	imap <c-x><c-l> <plug>(fzf-complete-line)

	nmap <leader><tab> <plug>(fzf-maps-n)
	xmap <leader><tab> <plug>(fzf-maps-x)
	omap <leader><tab> <plug>(fzf-maps-o)
	" imap <leader><tab> <plug>(fzf-maps-i) " creates delay after <space> :/
aug end

" }}}
