function! s:DeclareEnd(...)
	echo
	let char = nr2char(getchar())
	if a:0 == 2 && char == "\<Tab>"
		return a:2 . " \<CR>end" . a:2 . "\<C-o>k"
	elseif char == "\<Tab>"
		let result = a:2 . " " . a:3 . "\<CR>end" . a:2 . "\<C-o>k\<C-o>$\<C-o>"
		let l = len(a:3)
		if l > 1
			return result . (l - 1) . "h"
		elseif l == 1
			return result . "h"
		endif
	else
		return a:1 . char
	endif
endfunction!

iabbrev <buffer><expr> elif TabSnippet("elif", "elseif ")
iabbrev <buffer><expr> re TabSnippet("re", "return ")
iabbrev <buffer><expr> aug TabSnippet("aug", "augroup <CR>au!<CR>au<CR>augroup END<C-o>3k")
iabbrev <buffer><expr> func <SID>DeclareEnd("func", "function!", "()")
iabbrev <buffer><expr> if <SID>DeclareEnd("if", "if")
iabbrev <buffer><expr> while <SID>DeclareEnd("while", "while")
iabbrev <buffer><expr> for <SID>DeclareEnd("for", "for")

setlocal foldmethod=marker
let &l:define = '\v(^\s*(let|set|setlocal|setl|setglobal|setg|function|command|augroup)\s*(!)?\s+(\&)?(\w:)?)'
