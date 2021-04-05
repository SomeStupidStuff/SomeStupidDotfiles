let s:Component = {}

function! s:Component.toString() abort dict
	return self.color.toString() . self.sc.toString()
endfunction

function! stackus#Component#new(sc, color) abort
	let obj = copy(s:Component)
	let obj.sc = a:sc
	let obj.color = a:color
	return obj
endfunction
