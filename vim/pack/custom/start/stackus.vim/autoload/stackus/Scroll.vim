let s:Scroll = {}

function! s:Scroll.toString() abort dict
	return printf(self.format, "%P")
endfunction!

function! stackus#Scroll#new(format) abort
	let obj = copy(s:Scroll)
	let obj.format = a:format
	return obj
endfunction!
