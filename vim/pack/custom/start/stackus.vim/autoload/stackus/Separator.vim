let s:Separator = {}

function! s:Separator.toString() abort dict
	return "%="
endfunction!

function! stackus#Separator#new() abort
	let obj = copy(s:Separator)
	return obj
endfunction!
