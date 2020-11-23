augroup SchoolWork
	au!
	au BufRead,BufEnter,BufWrite ~/School/*.txt set ft=swk
	au BufRead,BufEnter,BufWrite *.swk set ft=swk
augroup END
