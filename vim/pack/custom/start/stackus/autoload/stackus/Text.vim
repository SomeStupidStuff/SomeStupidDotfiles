let s:Text = {}

function! s:Text.toString() abort dict
	return self.text
endfunction

function! stackus#Text#new(text) abort
	let obj = copy(s:Text)
	let obj.text = a:text
	return obj
endfunction
