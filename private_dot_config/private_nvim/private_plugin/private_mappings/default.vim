nn <localleader>vo :tabnew ~/.config/nvim/init.vim<cr>
nn <localleader>vb :tabnew ~/.config/nvim/init.vim.bak<cr>
nn <localleader>vs :so ~/.config/nvim/init.vim<cr>

inoremap jk <esc>
cnoremap jk <c-c>
inoremap <esc> <nop>
nn j gj
nn k gk

no ; :
nn : <nop>

nnoremap <C-W>\ :vsplit<CR>
nnoremap <C-W>- :split<CR>

