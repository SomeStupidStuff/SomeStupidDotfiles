function! c#EditOther()
	let file = expand('%')
	if file =~ '\.h$'
		execute "e " . substitute(file, '\.h$', '.c', '')
	elseif file =~ '\.c$'
		execute "e " . substitute(file, '\.c$', '.h', '')
	endif
endfunction!
