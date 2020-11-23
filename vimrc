filetype indent plugin on

" allows me to escape insert/visual mode by typing fd quickly
inoremap fd <Esc>
vnoremap fd <Esc>

" disable wait for <Esc> in insert mode
inoremap <Esc> <Esc>
onoremap <Esc> <Esc>

" leader
let mapleader=" "

nnoremap <silent> <BS> :nohl<CR>

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
nnoremap \ za

" mainly used for math and stuff
nnoremap <silent> <Leader>= :MathEval<CR>
vnoremap <silent> <Leader>= :MathEval<CR>

" Just a little nitpick
vnoremap J j

cnoremap <C-n> <Down>
cnoremap <C-p> <Up>

" Auto complete behavior
inoremap <expr> <Enter> pumvisible() ? "\<C-y>" : "\<Enter>"
inoremap <expr> <C-n> pumvisible() ? "\<Down>" : "\<C-n><C-p><C-n>"
inoremap <expr> <C-p> pumvisible() ? "\<Up>" : "\<C-p><C-n><C-p>"

" If running in a terminal, use <C-BS> to kill word
if !has("gui_running")
	inoremap <C-h> <C-w>
	cnoremap <C-h> <C-w>
endif

" change cursor shape in different modes
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[2 q"
let &t_EI = "\<Esc>[2 q"

" indenting
set autoindent
set cindent
set noexpandtab
set tabstop=4
set shiftwidth=4

" Misc
set ignorecase
set smartcase
set hlsearch
set incsearch
set noruler
set completeopt=menuone,noinsert
set complete-=i
set foldmethod=indent
set nofoldenable
set foldlevel=99
set foldmethod=indent
set fillchars=fold:\ ,vert:│
set splitright
set scrolloff=8
set mouse=a
set nocursorline
set number
set laststatus=2
let &statusline=' '
set nowildmenu
set shortmess+=csF
set showcmd
set hidden
set conceallevel=2
set concealcursor=nvci

syntax on

" Plugin/syntax configuration
let g:c_minimal_highlight = 0

let g:org_bullet_icons = 1

let g:treeview_view_line = 0

" Sets 256 color for urxvt
set background=dark
if $TERM ==# "rxvt"
	set t_Co=256
	color one-dark
else
	set termguicolors
	colorscheme one-dark
endif

" Prints the current syntax under cursor
nnoremap <silent> <Leader>i :echo synIDattr(synID(line('.'), col('.'), 1), "name")<CR>
nnoremap <Leader>I :hi <C-r>=synIDattr(synID(line('.'), col('.'), 1), "name")<CR>

" A very cool math function that works regardless of filetype
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

" Custom foldtext
function! FoldText()
	let text = getline(v:foldstart)
	let text = substitute(text, '\t', repeat(' ', &shiftwidth), 'g')
	return text . "…"
endfunction!

set foldtext=FoldText()

" Spell corrects a word regardless of whether 'spell' is enabled
function! SpellCorrect()
	let spell_default = &spell
	setlocal spell
	norm 1z=
	let &spell=spell_default
	norm guiw
endfunction!

nnoremap <silent> <Leader>s :call SpellCorrect()<CR>

" A slightly better looking define-jump
function! DefineJump()
	echohl Question
	let name = input("Find in project: ")
	echohl
	try
		execute "dj " . name
	catch
		redraw
		echohl Error
		echo "Could not find '" . name . "' in any included files"
		echohl
	endtry
	echo
endfunction!

nnoremap <Leader>g :call DefineJump()<CR>

" A simple surround function
function! SurroundText()
	echo "s"
	let char = nr2char(getchar())
	if char == "\<Esc>"
		return
	endif
	if index(["(", ")"], char) >= 0
		execute "norm gv\"zdi(\<C-r>z)\<Esc>b"
	elseif index(["{", "}"], char) >= 0
		execute "norm gv\"zdi{ \<C-r>z }\<Esc>b"
	else
		execute "norm gv\"zdi" . char . "\<C-r>z" . char . "\<Esc>b"
	endif
endfunction!

vnoremap <silent> s :<C-u>call SurroundText()<CR>

" A better commandline interface
function! SilentShell(...)
	let cmd = a:1
	let cmd = substitute(cmd, '\v(^|\s)@<=\%(\s|$)@=', expand('%:p'), 'g')
	let cmd = substitute(cmd, '\v(^|\s)@<=#(\s|$)@=', expand('#:p'), 'g')
	let write = writefile(['Command: ' . cmd] + systemlist(cmd), "/tmp/output.txt")
	if write == -1
		return
	endif
	botr pedit /tmp/output.txt
	wincmd j
	12wincmd _
	let b = bufnr()
	if index(g:silent_shell_qf_commands, matchlist(getline(1),  '\v^(Command:\s*)(\S*)')[2]) >= 0
		cexpr getline(2, "$")
		execute "b " . b
	endif
endfunction!

let g:silent_shell_qf_commands = ['make', 'mypy', 'grep']

command! -nargs=+ -complete=shellcmd Shell call SilentShell(<q-args>)
nnoremap <silent> <Leader>p :pclose<CR>
cnoreabbrev sh <C-r>=getcmdtype() == ":" ? "Shell" : "sh"<CR>
cnoreabbrev make <C-r>=getcmdtype() == ":" ? "Shell make" : "make"<CR>

" Terminal mode binding
tnoremap <Esc><Esc> <C-\><C-n>

" My current terminal colors
let g:terminal_ansi_colors = ["#282c34",
							\ "#c04c55",
                            \ "#88bc69",
                            \ "#d19a66",
                            \ "#519fef",
                            \ "#b668cd",
                            \ "#56b6c2",
                            \ "#abb2bf",
                            \ "#2c3038",
                            \ "#c04c55",
                            \ "#88bc69",
                            \ "#e5c07b",
                            \ "#519fef",
                            \ "#b668cd",
                            \ "#56b6c2",
                            \ "#abb2bf"]

" Sets cursorline off in normal mode and on in insert mode
augroup InsertCursorLine
	au!
	au InsertEnter * setlocal cursorline
	au InsertLeave * setlocal nocursorline
augroup END
