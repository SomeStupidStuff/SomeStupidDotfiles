let s:GitBranch = {}

function! s:GitBranch.toString() abort dict
	silent let branch = trim(system("git rev-parse --abbrev-ref HEAD"))
	if v:shell_error != 0
		return ''
	endif
	return printf(self.format, branch)
endfunction!

function! stackus#GitBranch#new(format) abort
	let obj = copy(s:GitBranch)
	let obj.format = a:format
	return obj
endfunction!
