let s:Filename = {}

function! s:Filename.toString() abort dict
	let output = printf(self.format, "%t")
	if &l:modified
		let output .= self.modified
	endif
	return output
endfunction

function! stackus#Filename#new(format, modified) abort
	let obj = copy(s:Filename)
	let obj.format = a:format
	let obj.modified = a:modified
	return obj
endfunction
