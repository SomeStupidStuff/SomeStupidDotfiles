" escape insert/visual mode by typing fd
imap fd <Esc>
vmap fd <Esc>

" plugged extension
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'davidhalter/jedi-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-python/python-syntax'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'pangloss/vim-javascript'

call plug#end()

" gruvbox
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox

" airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'gruvbox'
let g:airline#extensions#tabline#enabled = 1

" nerdtree
map <C-f> :NERDTreeToggle<Enter>

" jedi-vim
autocmd FileType python setlocal completeopt-=preview
let g:jedi#auto_initialization = 1
let g:jedi#popup_on_dot = 1

" auto pairs
let g:AutoPairsShortcutJump='<M-j>'
let g:AutoPairsShortcutToggle=''


" python syntax
let g:python_highlight_all = 1
let g:python_highlight_space_errors	= 0
autocmd Filetype python setlocal tabstop=4 noexpandtab

" c/c++ syntax
let g:cpp_class_decl_highlight = 1

" syntax
if has("syntax")
	syntax on
endif

" Highlight line under cursor
set cursorline

" define leader as ','
let mapleader = ','

" relative line numbers
set relativenumber
set number

" make split navigation easier
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

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

" makes width of line numbers smaller
set nuw=4

" creates a shortcut for :noh
nmap <C-]> :noh<Enter>

" maps tab to toggle folds
nmap <Tab> za

" buffer movement
nmap <M-h> :bp<Enter>
nmap <M-l> :bn<Enter>
nmap <M-k> :bd<Enter>

" tab management
nmap <M-t> :tabnew<Enter>
nmap <M-d> :tabclose<Enter>
nmap <M-n> :tabnext<Enter>
nmap <M-p> :tabprev<Enter>

" set background
set background=dark

" Popup menu highlighting
hi Pmenu ctermbg=black guibg=black
hi PmenuSbar ctermbg=grey guibg=grey
hi PmenuThumb ctermbg=black guibg=black

" get rid of tildas
hi EndOfBuffer ctermfg=bg ctermbg=bg
