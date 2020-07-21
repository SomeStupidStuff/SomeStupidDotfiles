" allows me to escape insert/visual mode by typing fd quickly
inoremap fd <Esc>
vnoremap fd <Esc>

" leader
let mapleader=" "

" make split navigation easier
nnoremap <Leader>j <C-W>j
nnoremap <Leader>k <C-W>k
nnoremap <Leader>h <C-W>h
nnoremap <Leader>l <C-W>l

" bindings
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :qa!<CR>
nnoremap <Leader>x :wq!<CR>

nnoremap <Leader>f :bn!<CR>
nnoremap <Leader>b :bp!<CR>

nnoremap <silent> <Tab>   :cnext<CR>
nnoremap <silent> <S-Tab> :cprev<CR>

nnoremap <Leader>a i#ifndef <Esc>:let @m=expand("%")<CR>"mphr_bgU$y$o#define <Esc>po#endif // <Esc>pO<CR><CR><Esc>ki

cnoremap <C-g> <Esc><CR>:<BS>

" save created folds
augroup Save_Folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END

" indenting
set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4

" Misc
set ignorecase
set smartcase
set nohlsearch
set noshowmode
set noshowcmd
set splitright
set scrolloff=8
set mouse=a

set background=dark
colorscheme simple-dark-transparent
syntax off

set laststatus=0
set statusline=
hi StatusLine cterm=NONE ctermfg=NONE ctermbg=NONE
hi StatusLineNC cterm=NONE ctermfg=NONE ctermbg=NONE
hi Normal cterm=NONE ctermfg=white ctermbg=NONE
