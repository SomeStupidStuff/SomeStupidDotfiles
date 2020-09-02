filetype indent on

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
nnoremap <silent> <Leader>o o<Esc>
nnoremap <silent> <Leader>O O<Esc>

nnoremap <Leader>f :bn!<CR>
nnoremap <Leader>b :bp!<CR>

nnoremap <Leader>a i#ifndef <Esc>:let @m=expand("%")<CR>"mphr_bgU$y$o#define <Esc>po#endif // <Esc>pO<CR><CR><Esc>ki

cnoremap <C-n> <Down>
cnoremap <C-p> <Up>

" save created folds
" augroup Save_Folds
"   autocmd!
"   autocmd BufWinLeave * mkview
"   autocmd BufWinEnter * silent! loadview
" augroup END
nnoremap <Leader>vs :mkview<CR>
nnoremap <Leader>vo :silent! loadview<CR>

" change cursor shape
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Auto complete behavior
inoremap <expr> <Enter> pumvisible() ? "\<C-y>" : "\<Enter>"
inoremap <expr> <C-n> pumvisible() ? "\<Down>" : "\<C-n><C-p><C-n>"
inoremap <expr> <C-p> pumvisible() ? "\<Up>" : "\<C-p><C-n><C-p>"

" indenting
set autoindent
set cindent
set noexpandtab
set tabstop=4
set shiftwidth=4

" Misc
set ignorecase
set smartcase
set nohlsearch
set incsearch
set noruler
set completeopt=menuone,noinsert
set complete-=i
set foldmethod=indent
set nofoldenable
set foldlevel=2
set foldmethod=indent
set fillchars=fold:\ ,
set splitright
set scrolloff=8
set mouse=a
set laststatus=0
set cursorline

set background=dark
if $TERM ==# "rxvt"
	colorscheme desert
	set statusline=\ 
	augroup CustomColors
		au!
		au ColorScheme * hi clear NonText
		au ColorScheme * hi NonText ctermfg=0
		au ColorScheme * hi StatusLine ctermfg=darkgray
		au ColorScheme * hi StatusLineNC ctermfg=darkgray
		au ColorScheme * hi VertSplit ctermfg=darkgray
		au ColorScheme * hi LineNr ctermfg=darkgreen
		au ColorScheme * hi CursorLineNr cterm=bold ctermfg=yellow
		au ColorScheme * hi clear CursorLine
		au ColorScheme * hi Visual ctermfg=lightgray ctermbg=black
		au ColorScheme * hi Search ctermfg=black ctermbg=white
		au ColorScheme * hi IncSearch ctermfg=black ctermbg=white
		au ColorScheme * hi Pmenu ctermfg=darkgray ctermbg=black
		au ColorScheme * hi PmenuSel ctermfg=lightgray ctermbg=darkgray
		au ColorScheme * hi PmenuThumb ctermbg=gray
		au ColorScheme * hi PmenuSbar ctermbg=white
	augroup END
	set number
	syntax on
else
	colorscheme simple-dark-transparent
	syntax off
	augroup CustomColors
		au!
		au Colorscheme * hi StatusLine cterm=NONE ctermfg=NONE ctermbg=NONE
		au Colorscheme * hi StatusLineNC cterm=NONE ctermfg=NONE ctermbg=NONE
		au Colorscheme * hi Normal cterm=NONE ctermfg=white ctermbg=NONE
		au ColorScheme * hi clear CursorLine
	augroup END
endif
