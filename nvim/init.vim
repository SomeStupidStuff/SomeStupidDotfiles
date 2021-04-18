" Setup {{{1
if has("syntax")
	syntax on
endif

filetype indent plugin on

let mapleader = ' '
"1}}}
" Plugin stuff {{{1
" Local Plugins {{{2
let s:plugins_dir = "~/.vim/pack/custom/start/"

function! s:LoadLocal(name) abort
	let &runtimepath = &runtimepath . "," . s:plugins_dir . a:name
endfunction

call s:LoadLocal("duozen.vim")
" 2}}}
" Plugged {{{2
call plug#begin('~/.vim/plugged')

Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()
" 2}}}
" Colorscheme stuff {{{2
colorscheme onedark
let g:airline_theme = 'onedark'
let g:onedark_hide_endofbuffer = 1

augroup ColorschemeOverride
	au!
	au Colorscheme * hi EndOfBuffer guifg=bg guibg=bg ctermfg=bg ctermbg=bg
	au Colorscheme * hi MatchParen gui=bold
	au Colorscheme * hi def link vimMapMod vimMapModKey
	au Colorscheme * hi def link vimBracket vimMapModKey
	au Colorscheme onedark hi pythonDecorator guifg=#98c379
	au Colorscheme onedark hi pythonDecoratorName guifg=#98c379
	au Colorscheme onedark hi javaScriptMember guifg=#e5c07b
	au Colorscheme onedark hi cType guifg=#c768dd
	au Colorscheme onedark hi cStorageClass guifg=#c768dd
	au Colorscheme onedark hi cStructure guifg=#c768dd
	au Colorscheme onedark hi cInclude guifg=#c768dd
	au Colorscheme onedark hi cPreProc guifg=#c768dd
	au Colorscheme onedark hi cPreCondit guifg=#c768dd
	au Colorscheme onedark hi Conceal guifg=#61afef
augroup END
"2}}}
" Airline {{{2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
"2}}}
" Fzf {{{2
nnoremap <silent> <Leader>f :FZF<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <M-Space> :Lines<CR>

let $FZF_DEFAULT_OPTS = ''

let g:fzf_preview_window = ''

let g:fzf_layout = { 'down': '~15%' }

let g:fzf_colors =
			\ { 'fg'    : ['fg',  'Normal'],
			\ 'bg'      : ['bg',  'Normal'],
			\ 'hl'      : ['fg',  'Comment'],
			\ 'fg+'     : ['fg+', 'CursorLine', 'CursorColumn', 'Normal'],
			\ 'bg+'     : ['bg+', 'CursorLine', 'CursorColumn'],
			\ 'border'  : ['fg',  'Ignore'],
			\ 'prompt'  : ['fg',  'Conditional'],
			\ 'pointer' : ['fg',  'Exception'],
			\ 'marker'  : ['fg',  'Keyword'],
			\ }
" 2}}}
" General Config {{{1
set runtimepath+=~/.vim/
set cursorline
set scrolloff=5
set number
set autoindent
set cindent
set noexpandtab
set softtabstop=0
set tabstop=4
set shiftwidth=4
set incsearch
set inccommand=nosplit
set ignorecase
set smartcase
set hlsearch
set noshowmode
set noruler
set fillchars=fold:\ ,vert:│
set foldlevel=99
set signcolumn=no
set completeopt=menuone,noinsert,preview
set conceallevel=2
set numberwidth=4
set conceallevel=2
set concealcursor=nvci
set mouse=a

" True color
if $TERM != "rxvt"
	set termguicolors
endif

" set background
set background=dark

" Syntax config
let g:org_bullet_icons = 1

function! FoldText()
	let text = getline(v:foldstart)
	let text = substitute(text, "	", repeat(' ', &shiftwidth), 'g')
	return text . "…"
endfunction!

set foldtext=FoldText()
"1}}}
" Bindings {{{1
" better command navigation
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>

" Nohl when pressing backsapce
nnoremap <silent><expr> <BS> bufname("%") == "[Command Line]" ? "<CR>" : &ft == "qf" ? "<CR>" : ":nohl<CR>"

" bind Y to yank till end of line
nnoremap Y y$

" escape insert/visual mode by typing fd
inoremap fd <Esc>
vnoremap fd <Esc>

" Just a nitpick
vnoremap J j

" Word deletion
inoremap <C-h> <C-w>
cnoremap <C-h> <C-w>

" Fold toggle
nnoremap \ za

" buffer movement
nnoremap <silent> <M-h> :bp!<CR>
nnoremap <silent> <M-l> :bn!<CR>
nnoremap <silent> <M-k> :bd<CR>

" Show highlight group under cursor
nnoremap <Leader>i :echo synIDattr(synID(line("."), col("."), 1), "name")<CR>

" make split navigation easier
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>h <C-w>h
nnoremap <Leader>l <C-w>l

" misc. Leader bindings
nnoremap <silent> <Leader>w :w<CR>
nnoremap <silent> <Leader>q :qa!<CR>
nnoremap <silent> <Leader>o o<Esc>
nnoremap <silent> <Leader>O O<Esc>
"1}}}
