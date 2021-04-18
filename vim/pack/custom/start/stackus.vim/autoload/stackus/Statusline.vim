let s:Statusline = {}

function! s:Statusline.active() abort dict
	let output = ""
	for comp in self.active_components
		let output .= comp.toString()
	endfor
	return output
endfunction

function! s:Statusline.inactive() abort dict
	let output = ""
	for comp in self.inactive_components
		let output .= comp.toString()
	endfor
	return output
endfunction

function! stackus#Statusline#new(components) abort
	let obj = copy(s:Statusline)
	let obj.active_components = a:components[0]
	let obj.inactive_components = a:components[1]
	return obj
endfunction
