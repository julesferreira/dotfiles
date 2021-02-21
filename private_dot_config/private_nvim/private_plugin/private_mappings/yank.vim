fu! s:get_line_summary()
	let l:max_length = 60
	let l:line = trim(getline('.'))
	if (strchars(l:line) > l:max_length)
		let l:line = strcharpart(l:line, 0, l:max_length - 3) . '...'
	endif
	return expand('%') . ' | L' . line('.') . ' | ' . l:line
endf

aug my_yank_group
	au!
	nn <silent><leader>yf :let @+ = expand("%")<cr>
	nn <silent><leader>yl :let @+ = <sid>get_line_summary()<cr>
aug end
