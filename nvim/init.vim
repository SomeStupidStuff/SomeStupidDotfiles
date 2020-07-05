" Setup
if has("syntax")
	syntax on
endif

filetype indent plugin on
"
" define leader as space
let mapleader = ' '

" plugged extension
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'jiangmiao/auto-pairs'

Plug 'easymotion/vim-easymotion'

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

" airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'gruvbox'
let g:airline#extensions#tabline#enabled = 1

" nerdtree
nnoremap <C-f> :NERDTreeToggle<CR>

" jedi-vim
" autocmd FileType python setlocal completeopt-=preview
" let g:jedi#auto_initialization = 1
" let g:jedi#popup_on_dot = 1

" auto pairs
let g:AutoPairsShortcutJump='<M-j>'
let g:AutoPairsShortcutToggle=''

" Ycm
let g:ycm_autoclose_preview_window_after_insertion  = 1
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'

" python syntax
let g:python_highlight_all = 1
let g:python_highlight_space_errors	= 0
autocmd Filetype python setlocal tabstop=4 noexpandtab

" c/c++ syntax
let g:cpp_class_decl_highlight = 1

" fzf config
nnoremap <Leader>fe :FZF<CR>
nnoremap <Leader>fr :FZF ~<CR>

let g:fzf_preview_window = ''
let g:fzf_layout = { 'left': '~100%' }

augroup fzfstatus
	autocmd!
	autocmd FileType fzf set laststatus=0 noshowmode noruler
	\| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup end

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

" changles style of splits
set splitright

" turns off signcolumn
set signcolumn=no

" sets conceal characters
set conceallevel=1
" syntax match CheckboxDone /^\[x\]/ conceal cchar=☑
" syntax match CheckboxTodo /^\[\ \]/ conceal cchar=☐

" makes width of line numbers 4
set nuw=4

" set background
set background=dark

" bind H and L to begin and end (ignoring whitespace)
nnoremap H ^
nnoremap L g_

" bind Y to yank till end of line
nnoremap Y y$

" escape insert/visual mode by typing fd
inoremap fd <Esc>
vnoremap fd <Esc>

" maps tab to toggle folds
nnoremap <Tab> za

" mapping for focusing current buffer
noremap <M-Space> :on<CR>

" buffer movement
nnoremap <M-h> :bp!<CR>
nnoremap <M-l> :bn!<CR>
nnoremap <M-k> :bd<CR>

" make split navigation easier
noremap <Leader>j <C-W>j
noremap <Leader>k <C-W>k
noremap <Leader>h <C-W>h
noremap <Leader>l <C-W>l

" tab management
nnoremap <Leader>tn :tabnew<CR>
nnoremap <Leader>td :tabclose<CR>
nnoremap <Leader>tf :tabnext<CR>
nnoremap <Leader>tb :tabprev<CR>

" misc. Leader bindings
nnoremap <Leader>w :w<CR>
nnoremap <Leader>x :wqa<CR>
nnoremap <Leader>q :qa!<CR>

" functions
function! ToggleText()
	if mapcheck("j", "gj") != "" && mapcheck("j", "gk") != ""
		set nolinebreak
		set nowrap
		unmap j
		unmap k
	else
		set linebreak
		set wrap
		nnoremap j gj
		nnoremap k gk
	endif
endfunction

command! ToggleText call ToggleText()

" popup menu highlighting
hi Pmenu ctermbg=black guibg=black
hi PmenuSbar ctermbg=grey guibg=grey
hi PmenuThumb ctermbg=black guibg=black

" get rid of tildas
hi EndOfBuffer ctermfg=bg ctermbg=bg
