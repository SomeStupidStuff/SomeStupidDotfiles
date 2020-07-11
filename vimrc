" allows me to escape insert/visual mode by typing fd quickly
inoremap fd <Esc>
vnoremap fd <Esc>

" make split navigation easier
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" indenting config
set autoindent
set cindent
set noexpandtab
set tabstop=4
set shiftwidth=4

" Misc
set noshowmode
set noshowcmd
set splitright

" color
set background=dark
colorscheme simple-dark-transparent
syntax off

set laststatus=0
set statusline=
hi StatusLine cterm=NONE ctermfg=NONE ctermbg=NONE
hi StatusLineNC cterm=NONE ctermfg=NONE ctermbg=NONE
hi Normal cterm=NONE ctermfg=white ctermbg=NONE

" Airline theme
" let g:airline_theme='owo'
