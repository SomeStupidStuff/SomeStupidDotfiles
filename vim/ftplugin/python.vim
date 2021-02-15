function! s:SendToRepl()
	let modulename = expand("%:t:r")
	let nr = bufwinnr(bufnr("!python3"))
	if nr == -1
		echoerr "There are no python3 repls in the window"
		return
	endif
	execute nr . "wincmd w"
	call term_sendkeys(bufnr("!python3"), "from importlib import reloadtry: _ = reload(" . modulename . ")except: import " . modulename . "")
endfunction!

command! PySendToRepl call <SID>SendToRepl()

function! s:OpenRepl()
	vert term ++close python3
endfunction!

command! PyOpenRepl call <SID>OpenRepl()

nnoremap <silent><buffer> <C-c><C-c> :PySendToRepl<CR>
nnoremap <silent><buffer> <C-c><C-p> :PyOpenRepl<CR><C-w><C-w>

setlocal makeprg=mypy\ --ignore-missing-imports\ %

iabbrev <buffer><expr> ins TabSnippet("ins", "isinstance()<Left>")

iabbrev <buffer><expr> class TabSnippet("class", "class :<CR>def __init__(self):<CR>pass<C-o>2k<C-o>$<C-o>h<C-o>l")
iabbrev <buffer><expr> repr TabSnippet("repr", "def __repr__(self):<CR>")
