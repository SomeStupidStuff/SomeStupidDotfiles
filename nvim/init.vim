" Setup
if has("syntax")
	syntax on
endif

filetype indent plugin on

" define leader as space
let mapleader = ' '

" plugged extension
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'jiangmiao/auto-pairs'

Plug 'chrisbra/Colorizer'

Plug 'ycm-core/YouCompleteMe'
Plug 'vim-python/python-syntax'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'pangloss/vim-javascript'

Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

" gruvbox
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
let g:airline_theme = 'gruvbox'
hi Pmenu ctermbg=black guibg=#212c28

" one-dark
" colorscheme onedark
" let g:airline_theme = 'onedark'
" let g:onedark_hide_endofbuffer = 1

" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" nerdtree
nnoremap <silent> <Leader>e :NERDTreeToggle<CR>

" jedi-vim
" let g:jedi#auto_initialization = 1
" let g:jedi#popup_on_dot = 1

" auto pairs
let g:AutoPairsShortcutJump='<M-j>'
let g:AutoPairsShortcutToggle=''

nnoremap <Leader>c :ColorToggle<CR>

" Ycm
let g:ycm_autoclose_preview_window_after_insertion  = 0
let g:ycm_autoclose_preview_window_after_completion = 0
nnoremap <silent> <Leader>p :pc<CR>
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
let g:ycm_clangd_args=['--header-insertion=never']
let g:ycm_confirm_extra_conf = 0
nnoremap <silent> gd :YcmCompleter GoTo<CR>
nnoremap <silent> gr :YcmCompleter GoToReferences<CR>
nnoremap <silent> <Leader>t :YcmCompleter GetType<CR>

" python syntax
let g:python_highlight_all = 1
let g:python_highlight_space_errors	= 0
autocmd Filetype python setlocal tabstop=4 noexpandtab

" c/c++ syntax
let g:cpp_class_decl_highlight = 1
augroup cgroup
	autocmd!
	autocmd BufEnter *.h set ft=c
augroup end

" fzf config
nnoremap <silent> <Leader>r :FZF<CR>
nnoremap <silent> <Leader>b :Buffers<CR>

let g:fzf_preview_window = ''

let g:fzf_layout = { 'down': '~25%' }

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

augroup fzfstatus
	autocmd!
	autocmd FileType fzf set laststatus=0 noshowmode noruler
	\| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup end

" Adds .vim/after to path
set runtimepath+=~/.vim/after

" Highlight line under cursor
set cursorline

" changes scroll
set scrolloff=5

" relative line numbers
set relativenumber
set number

" tab config
set autoindent
set cindent
set noexpandtab
set softtabstop=0
set tabstop=4
set shiftwidth=4

" changes style of searches
set ignorecase
set smartcase
set nohlsearch

" splits
set fillchars=fold:\ ,vert:│

" turns off signcolumn
set signcolumn=no

" better pmenu completion
set completeopt=menuone,noinsert,preview

" sets conceal characters
set conceallevel=2
" set concealcursor=ni

" makes width of line numbers 4
set nuw=4

" True color
if $TERM != "rxvt"
	set termguicolors
endif

" set background
set background=dark

" better command navigation
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>

" bind Y to yank till end of line
nnoremap Y y$

" escape insert/visual mode by typing fd
inoremap fd <Esc>
vnoremap fd <Esc>

" mapping for focusing current buffer
nnoremap <silent> <M-Space> :Lines<CR>

" buffer movement
nnoremap <silent> <M-h> :bp!<CR>
nnoremap <silent> <M-l> :bn!<CR>
nnoremap <silent> <M-k> :bd<CR>

" make split navigation easier
nnoremap <Leader>j <C-W>j
nnoremap <Leader>k <C-W>k
nnoremap <Leader>h <C-W>h
nnoremap <Leader>l <C-W>l

" tab management
" nnoremap <silent> <Leader>tn :tabnew<CR>
" nnoremap <silent> <Leader>td :tabclose<CR>
" nnoremap <silent> <Leader>tf :tabnext<CR>
" nnoremap <silent> <Leader>tb :tabprev<CR>

" misc. Leader bindings
nnoremap <silent> <Leader>w :w<CR>
nnoremap <silent> <Leader>x :wqa<CR>
nnoremap <silent> <Leader>q :qa!<CR>
nnoremap <silent> <Leader>o o<Esc>
nnoremap <silent> <Leader>O O<Esc>

nnoremap <Leader>a i#ifndef <Esc>:let @m=expand("%")<CR>"mphr_bgU$y$o#define <Esc>po#endif // <Esc>pO<CR><CR><Esc>ki
iabb cmain #include <stdio.h><CR><CR>int main(int argc, char *argv[]) {<CR>printf("Hello, World!\n");<CR>return 0;}

" functions
function! ToggleText()
	if mapcheck("j", "gj") != "" && mapcheck("j", "gk") != ""
		set nolinebreak
		set nowrap
		set nospell
		unmap j
		unmap k
	else
		set linebreak
		set wrap
		set spell
		nnoremap j gj
		nnoremap k gk
	endif
endfunction

command! ToggleText call ToggleText()
command! So w | so %

" get rid of tildas
hi EndOfBuffer guifg=bg guibg=bg ctermfg=bg ctermbg=bg
