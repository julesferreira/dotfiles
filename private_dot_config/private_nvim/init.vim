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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-plug'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-user'
Plug 'kevinoid/vim-jsonc'
Plug 'lifepillar/vim-gruvbox8'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/ReplaceWithRegister'
call plug#end()

let g:coc_global_extensions = [
	\'coc-diagnostic',
	\'coc-eslint',
	\'coc-explorer',
	\'coc-fzf-preview',
	\'coc-highlight',
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
colorscheme gruvbox8_hard
