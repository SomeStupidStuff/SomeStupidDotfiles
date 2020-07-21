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

" airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'gruvbox'
let g:airline#extensions#tabline#enabled = 1

" nerdtree
nnoremap <silent> <C-f> :NERDTreeToggle<CR>

" jedi-vim
" autocmd FileType python setlocal completeopt-=preview
" let g:jedi#auto_initialization = 1
" let g:jedi#popup_on_dot = 1

" auto pairs
let g:AutoPairsShortcutJump='<M-j>'
let g:AutoPairsShortcutToggle=''

nnoremap <Leader>cc :ColorToggle<CR>

" Ycm
let g:ycm_autoclose_preview_window_after_insertion  = 1
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
let g:ycm_clangd_args=['--header-insertion=never']
let g:ycm_confirm_extra_conf = 0
nnoremap <silent> gd :YcmCompleter GoTo<CR>
nnoremap <silent> gr :YcmCompleter GoToReferences<CR>
nnoremap <silent> <Leader>tt :YcmCompleter GetType<CR>

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
nnoremap <silent> <Leader>fe :FZF<CR>
nnoremap <silent> <Leader>fr :FZF ~<CR>
nnoremap <silent> <Leader>bb :Buffers<CR>

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
noremap <silent> <M-Space> :on<CR>

" buffer movement
nnoremap <silent> <M-h> :bp!<CR>
nnoremap <silent> <M-l> :bn!<CR>
nnoremap <silent> <M-k> :bd<CR>

" make split navigation easier
noremap <Leader>j <C-W>j
noremap <Leader>k <C-W>k
noremap <Leader>h <C-W>h
noremap <Leader>l <C-W>l

" tab management
nnoremap <silent> <Leader>tn :tabnew<CR>
nnoremap <silent> <Leader>td :tabclose<CR>
nnoremap <silent> <Leader>tf :tabnext<CR>
nnoremap <silent> <Leader>tb :tabprev<CR>

" misc. Leader bindings
nnoremap <silent> <Leader>w :w<CR>
nnoremap <silent> <Leader>x :wqa<CR>
nnoremap <silent> <Leader>q :qa!<CR>

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
		set spell
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
