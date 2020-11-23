function! s:SendToRepl()
	let modulename = expand("%:t:r")
	let nr = bufwinnr(bufnr("!python3"))
	if nr == -1
		echoerr "There are no python3 repls in the window"
		return
	endif
	execute nr . "wincmd w"
	if b:has_imported
		call term_sendkeys(bufnr("!python3"), "_ = reload(" . modulename . ")")
	else
		call term_sendkeys(bufnr("!python3"), "from importlib import reloadimport " . modulename . "")
		let b:has_imported = 1
	endif
endfunction!

command! PySendToRepl call <SID>SendToRepl()

function! s:OpenRepl()
	vert term ++close python3
	let b:has_imported = 0
endfunction!

command! PyOpenRepl call <SID>OpenRepl()

nnoremap <silent><buffer> <C-c><C-c> :PySendToRepl<CR>
nnoremap <silent><buffer> <C-c><C-p> :PyOpenRepl<CR><C-w><C-w>

setlocal makeprg=mypy\ --ignore-missing-imports\ %
