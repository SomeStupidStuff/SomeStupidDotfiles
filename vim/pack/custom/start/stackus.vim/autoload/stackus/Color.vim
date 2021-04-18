let s:Color = {}
let s:Color.count = 0

function! s:Color.toString() abort dict
	return "%#" . self.name . "#"
endfunction

function! stackus#Color#new(fg, bg, style) abort
	let obj = copy(s:Color)
	let obj.name = "StackusGroup" . s:Color.count
	execute printf("hi %s guifg=%s guibg=%s gui=%s term=%s cterm=%s", obj.name, a:fg, a:bg, a:style, a:style, a:style)
	let s:Color.count += 1
	return obj
endfunction
