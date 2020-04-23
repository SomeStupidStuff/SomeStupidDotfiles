" set runtimepath+=~/.vim_runtime
" 
" source ~/.vim_runtime/vimrcs/basic.vim
" source ~/.vim_runtime/vimrcs/filetypes.vim
" source ~/.vim_runtime/vimrcs/plugins_config.vim
" source ~/.vim_runtime/vimrcs/extended.vim
" 
" try
" source ~/.vim_runtime/my_configs.vim
" catch
" endtry
" 
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
