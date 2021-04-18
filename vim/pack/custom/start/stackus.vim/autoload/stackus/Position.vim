let s:Position = {}

function! s:Position.toString() abort dict
	let pos = getcurpos()
	let line = pos[1]
	let col = pos[2]
	return printf(self.format, line, col)
endfunction!

function! stackus#Position#new(format) abort
	let obj = copy(s:Position)
	let obj.format = a:format
	return obj
endfunction!
