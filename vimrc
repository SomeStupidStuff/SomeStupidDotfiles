filetype indent plugin on

" allows me to escape insert/visual mode by typing fd quickly
inoremap fd <Esc>
vnoremap fd <Esc>

" disable wait for <Esc> in insert mode
inoremap <Esc> <Esc>

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

" mainly used for math and stuff
nnoremap <silent> <Leader>= :MathEval<CR>
vnoremap <silent> <Leader>= :MathEval<CR>

cnoremap <C-n> <Down>
cnoremap <C-p> <Up>

" change cursor shape
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[2 q"
let &t_EI = "\<Esc>[2 q"

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
set fillchars=fold:\ ,vert:│
set splitright
set scrolloff=8
set mouse=a
set cursorline
set number
set laststatus=2
set statusline=\ 
set shortmess+=cF
set showcmd
set hidden
set conceallevel=2
set concealcursor=nvci

syntax on

let g:c_minimal_highlight = 1

set background=dark
if $TERM ==# "rxvt"
	set t_Co=256
else
	set termguicolors
endif
colorscheme one-dark

nnoremap <silent> <Leader>i :echo synIDattr(synID(line('.'), col('.'), 1), "name")<CR>

function! MathEvalLines(...)
	if a:1 == a:2
		let line = getline(".")
		" Substitute random numbers
		let line = substitute(line, "rand()", '\=system("echo $RANDOM")[:-2]', 'g')
		" Output result
		call append(".", [printf("%s", eval(line))])
	else
		" Multiple Lines
		let line1 = a:1
		let line2 = a:2
		let appended = 0
		let vars = {}
		for i in range(line1, line2)
			let line = getline(i)
			" Substitute random numbers
			let line = substitute(line, 'rand()', '\=system("echo $RANDOM")[:-2]', 'g')
			for name in keys(vars)
				" Evaluate expression with variables
				let line = substitute(line, '\v<' . name . '>(\s*\=)@!', vars[name], 'g')
			endfor
			if line =~ '\v^\s*\w+\s*\=.*$'
				" Parse Variables
				let name = substitute(line, '\v\=.*$|\s', '', 'g')
				let value = printf("%s", eval(substitute(line, '\v^.*\=\s*', '', 'g')))
				let vars[name] = value
			else
				call append(line2 + appended, printf("%s", eval(line)))
				let appended += 1
				call cursor(line2 + appended, col("."))
			endif
		endfor
	end
endfunction!

command! -range MathEval call MathEvalLines(<line1>, <line2>)
