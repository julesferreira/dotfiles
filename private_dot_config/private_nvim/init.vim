if glob('~/.local/share/nvim/site/autoload/plug.vim') ==# ''
	silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | :call expand('%')
endif

call plug#begin('~/.local/share/nvim/plugged')
Plug 'christoomey/vim-tmux-navigator'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'julesferreira/vim-split-join'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-plug'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-user'
Plug 'kevinoid/vim-jsonc'
Plug 'leafgarland/typescript-vim'
Plug 'lifepillar/vim-gruvbox8'
Plug 'nelsyeung/twig.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'peitalin/vim-jsx-typescript'
Plug 'ron89/thesaurus_query.vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'yaegassy/coc-tailwindcss',  {'do': 'npm install && npm run build', 'branch': 'feat/support-v3-and-use-server-pkg'}
call plug#end()

let g:coc_global_extensions = [
	\'coc-diagnostic',
	\'coc-eslint',
	\'coc-explorer',
	\'coc-fzf-preview',
	\'coc-highlight',
	\'coc-html',
	\'coc-json',
	\'coc-phpls',
	\'coc-prettier',
	\'coc-snippets',
	\'coc-tsserver',
	\'coc-vimlsp',
\]

let mapleader = ' '
let maplocalleader = ' '

let g:gruvbox_transp_bg = 1
" let g:gruvbox_filetype_hi_groups = 1
colorscheme gruvbox8_hard

aug my_configs
	au!
	nn <localleader>vo :tabnew $MYVIMRC<cr>
	nn <localleader>vb :tabnew $MYVIMRC.bak<cr>
	nn <localleader>vs :so $MYVIMRC<cr>:AirlineRefresh<cr>
	nn <localleader>omz :tabnew $ZSH/custom/<cr>
	nn <localleader>zenv :tabnew $HOME/.zshenv<cr>
	nn <localleader>zsh :tabnew $ZDOTDIR/.zshrc<cr>
	nn <localleader>tmux :tabnew $XDG_CONFIG_HOME/tmux/tmux.conf<cr>
	nn <localleader>todo :tabnew $HOME/todo/todo.md<cr>
aug end

aug experimental_group
	au!

	nn <localleader>fx :CocCommand eslint.executeAutofix<cr>
	nn <localleader>p :CocCommand prettier.formatFile<cr>
	nn <silent><localleader>sp :set spell!<cr>

	let g:splitJoin_do_mapping = 0
	noremap <LocalLeader>j( :<c-u>call splitJoinCommon#joinParameters()<return>
	noremap <LocalLeader>j) :<c-u>call splitJoinCommon#joinParameters()<return>
	noremap <LocalLeader>j[ :<c-u>call splitJoinJs#joinArray()<return>
	noremap <LocalLeader>j[ :<c-u>call splitJoinPhp#joinArray()<return>
	noremap <LocalLeader>j] :<c-u>call splitJoinJs#joinArray()<return>
	noremap <LocalLeader>j] :<c-u>call splitJoinPhp#joinArray()<return>
	noremap <LocalLeader>j{ :<c-u>call splitJoinJs#joinObject()<return>
	noremap <LocalLeader>j} :<c-u>call splitJoinJs#joinObject()<return>
	noremap <LocalLeader>s( :<c-u>call splitJoinCommon#splitParameters()<return>
	noremap <LocalLeader>s) :<c-u>call splitJoinCommon#splitParameters()<return>
	noremap <LocalLeader>s[ :<c-u>call splitJoinJs#splitArray()<return>
	noremap <LocalLeader>s[ :<c-u>call splitJoinPhp#splitArray()<return>
	noremap <LocalLeader>s] :<c-u>call splitJoinJs#splitArray()<return>
	noremap <LocalLeader>s] :<c-u>call splitJoinPhp#splitArray()<return>
	noremap <LocalLeader>s{ :<c-u>call splitJoinJs#splitObject()<return>
	noremap <LocalLeader>s} :<c-u>call splitJoinJs#splitObject()<return>

	let g:tq_openoffice_en_file="/usr/share/mythes/th_en_US_v2"
aug end

" ============================================================================
" commentary {{{
" ============================================================================
aug commentary
	au!
	au FileType html.twig.js.css setlocal commentstring={#\ %s\ #}
aug END
" }}}

aug quickfix_experimental_group
	au!

	function! s:ToggleQf()
		for buffer in tabpagebuflist()
			if bufname(buffer) == ''
				" then it should be the quickfix window
				cclose
				return
			endif
		endfor

		copen
	endfunction

	nn <leader>co :call <sid>ToggleQf()<cr>
aug END


