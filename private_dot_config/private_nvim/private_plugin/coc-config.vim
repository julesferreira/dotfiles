aug my_coc_group
	au!
	" Highlight the symbol and its references when holding the cursor.
	au CursorHold * silent call CocActionAsync('highlight')
	" Update signature help on jump to snippet placeholder.
	au User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

	ino <silent><expr> <tab>
		\ pumvisible() ? coc#_select_confirm() :
		\ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<cr>" :
		\ my#config#coc#prev_char_is_spaceish() ? "\<tab>" :
		\ coc#refresh()

	let g:coc_snippet_next = '<tab>'

	" Make <CR> auto-select the first completion item and notify coc.nvim to
	" format on enter, <cr> could be remapped by other vim plugin
	inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

	" Use `[g` and `]g` to navigate diagnostics
	" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
	nm <silent> [g <Plug>(coc-diagnostic-prev)
	nm <silent> ]g <Plug>(coc-diagnostic-next)

	" GoTo code navigation.
	nm <silent> gd <Plug>(coc-definition)
	nn <silent> gn j$h%h:call CocActionAsync("jumpDefinition")<cr>
	nm <silent> gy <Plug>(coc-type-definition)
	nm <silent> gi <Plug>(coc-implementation)
	nm <silent> gu <Plug>(coc-references)

	" Use K to show documentation in preview window.
	nnoremap <silent> K :call my#config#coc#show_documentation()<CR>

	" Map function and class text objects
	" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
	xmap if <Plug>(coc-funcobj-i)
	omap if <Plug>(coc-funcobj-i)
	xmap af <Plug>(coc-funcobj-a)
	omap af <Plug>(coc-funcobj-a)
	xmap ic <Plug>(coc-classobj-i)
	omap ic <Plug>(coc-classobj-i)
	xmap ac <Plug>(coc-classobj-a)
	omap ac <Plug>(coc-classobj-a)

	" Add `:Format` command to format current buffer.
	command! -nargs=0 Format :call CocAction('format')

	nmap <Leader>f [fzf-p]
	xmap <Leader>f [fzf-p]

	nnoremap <silent> [fzf-p]p     :<C-u>CocCommand fzf-preview.FromResources project_mru git<CR>
	nnoremap <silent> [fzf-p]gs    :<C-u>CocCommand fzf-preview.GitStatus<CR>
	nnoremap <silent> [fzf-p]ga    :<C-u>CocCommand fzf-preview.GitActions<CR>
	nnoremap <silent> [fzf-p]b     :<C-u>CocCommand fzf-preview.Buffers<CR>
	nnoremap <silent> [fzf-p]B     :<C-u>CocCommand fzf-preview.AllBuffers<CR>
	nnoremap <silent> [fzf-p]o     :<C-u>CocCommand fzf-preview.FromResources buffer project_mru<CR>
	nnoremap <silent> [fzf-p]<C-o> :<C-u>CocCommand fzf-preview.Jumps<CR>
	nnoremap <silent> [fzf-p]g;    :<C-u>CocCommand fzf-preview.Changes<CR>
	nnoremap <silent> [fzf-p]/     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'"<CR>
	nnoremap <silent> [fzf-p]*     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>
	nnoremap          [fzf-p]gr    :<C-u>CocCommand fzf-preview.ProjectGrep<Space>
	xnoremap          [fzf-p]gr    "sy:CocCommand   fzf-preview.ProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"
	nnoremap <silent> [fzf-p]t     :<C-u>CocCommand fzf-preview.BufferTags<CR>
	nnoremap <silent> [fzf-p]q     :<C-u>CocCommand fzf-preview.QuickFix<CR>
	nnoremap <silent> [fzf-p]l     :<C-u>CocCommand fzf-preview.LocationList<CR>

	" Use <C-l> for trigger snippet expand.
	imap <C-l> <Plug>(coc-snippets-expand)
	" Use <C-j> for select text for visual placeholder of snippet.
	vmap <C-j> <Plug>(coc-snippets-select)
	" Use <C-j> for jump to next placeholder, it's default of coc.nvim
	let g:coc_snippet_next = '<c-j>'
	" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
	let g:coc_snippet_prev = '<c-k>'
	" Use <C-j> for both expand and jump (make expand higher priority.)
	imap <C-j> <Plug>(coc-snippets-expand-jump)

	" convert visual selection to snippet
	xmap <leader>snip <Plug>(coc-convert-snippet)

	" coc-explorer
	nn <space>e :CocCommand explorer<CR>

	call coc#config('explorer', {'icon.enableNerdfont': 'true'})
	call coc#config('explorer.file.showHiddenFiles', 'true')

	call coc#config('diagnostic', {
		\'enableSign': v:false,
		\'checkCurrentLine': v:true,
	\})

aug end
