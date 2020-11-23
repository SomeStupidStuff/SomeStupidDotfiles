augroup CmdlogFileType
	au!
	au BufEnter,BufRead,BufWrite /tmp/output.txt set ft=cmdlog
augroup END
