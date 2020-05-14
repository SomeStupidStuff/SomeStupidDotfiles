" allows me to escape insert mode by typing fd quickly 
imap fd <Esc>
vmap fd <Esc>

" sets relative line number
set relativenumber
set number

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

" makes width of line numbers smaller
set nuw=2

" Colorscheme
colorscheme peaksea

" Airline theme
let g:airline_theme='owo'

" set background
set background=dark

" removes tildas
if !has("gui_running")
	hi EndOfBuffer ctermbg=bg ctermfg=bg
endif

" Popup menu highlighting
hi Pmenu ctermbg=black guibg=black
hi PmenuSbar ctermbg=grey guibg=grey
hi PmenuThumb ctermbg=black guibg=black
