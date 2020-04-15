set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry

" allows me to escape insert mode by typing fd quickly 
inoremap fd <Esc>

" sets relative line number
set relativenumber
set number

" indenting config
set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4

" makes width of line numbers smaller
set nuw=2

" removes tildas
hi EndOfBuffer ctermbg=bg ctermfg=bg
