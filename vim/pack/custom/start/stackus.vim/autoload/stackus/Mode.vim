let s:Mode = {}

function! s:Mode.toString() abort dict
	return printf(self.format, mode())
endfunction

function! stackus#Mode#new(format) abort
	let obj = copy(s:Mode)
	let obj.format = a:format
	return obj
endfunction
