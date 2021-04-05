if exists("g:stackus_components")
	let s:components = g:stackus_components
else
	echoerr "Could not load stackus, please ensure that g:stackus_components exists"
	finish
endif

let s:status = stackus#Statusline#new(s:components)

function! stackus#Active() abort
	return s:status.active()
endfunction

function! stackus#Inactive() abort
	return s:status.inactive()
endfunction
