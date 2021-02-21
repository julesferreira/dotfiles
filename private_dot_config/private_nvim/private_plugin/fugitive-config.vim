function! s:GitGrepWord()
	let l:winnr = winnr()

	exe 'normal! "zyiw\<cr>'
	exe "Ggrep '\\b".@z."\\b'"
	exe "normal! \<c-o>"
	cope
	redraw!

	if l:winnr !=# winnr()
		wincmd p
	endif
endfunction

aug my_fugitive_group
	au!
	nn <leader>gg :call <sid>GitGrepWord()<cr>
aug end
