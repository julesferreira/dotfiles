" ============================================================================
" motion {{{
" ============================================================================

aug my_motion_group
	au!

	" map <Leader> <Plug>(easymotion-prefix)
	let g:EasyMotion_do_mapping = 0

	let g:incsearch#auto_nohlsearch = 1
	map n  <Plug>(incsearch-nohl-n)
	map N  <Plug>(incsearch-nohl-N)
	map *  <Plug>(incsearch-nohl-*)
	map #  <Plug>(incsearch-nohl-#)
	nmap f <Plug>(easymotion-f)
	nmap F <Plug>(easymotion-F)

	function! s:incsearch_config(...) abort
		return incsearch#util#deepextend(deepcopy({
		\   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
		\   'keymap': {
		\     "\<CR>": '<Over>(easymotion)'
		\   },
		\   'is_expr': 0
		\ }), get(a:, 1, {}))
	endfunction

	function! s:config_easyfuzzymotion(...) abort
		return extend(copy({
		\   'converters': [incsearch#config#fuzzyword#converter()],
		\   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
		\   'keymap': {"\<CR>": '<Over>(easymotion)'},
		\   'is_expr': 0,
		\   'is_stay': 0
		\ }), get(a:, 1, {}))
	endfunction

	noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
	noremap <silent><expr> <leader>/  incsearch#go(<SID>config_easyfuzzymotion())

	" Require tpope/vim-repeat to enable dot repeat support
	" Jump to anywhere with only `s{char}{target}`
	" `s<CR>` repeat last find motion.
	nmap s <Plug>(easymotion-overwin-f)
	" Bidirectional & within line 't' motion
	" omap t <Plug>(easymotion-bd-tl)
	 " type `l` and match `l`&`L`
	let g:EasyMotion_smartcase = 1
	" Smartsign (type `3` and match `3`&`#`)
	let g:EasyMotion_use_smartsign_us = 1

	au User EasyMotionPromptBegin silent! CocDisable
	au User EasyMotionPromptEnd silent! CocEnable
aug end

" }}}
