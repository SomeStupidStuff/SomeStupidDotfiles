set nocompatible
set termguicolors
set tabstop=4
set shiftwidth=4
set background=dark
set scrolloff=8
set cursorline
set nu
set incsearch
set smartcase
set conceallevel=2
set concealcursor=nvi

color darkret

set laststatus=2
source statusline.vim

hi Pmenu guifg=fg guibg=Gray11
hi PmenuSbar guifg=fg guibg=Gray12
hi PmenuSel guifg=fg guibg=Gray25
hi PmenuThumb guifg=fg guibg=Gray50

inoremap fd <Esc>
vnoremap fd <Esc>

let mapleader=" "

nnoremap <Leader>w :w<CR>
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l
