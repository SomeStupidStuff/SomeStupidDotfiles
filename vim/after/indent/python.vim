function! s:PrevNonBlank(lnum)
	let lnum = a:lnum - 1
	while getline(lnum) =~ '^\s*$'
		if lnum == 0
			return lnum
		endif
		let lnum -= 1
	endwhile
	return lnum
endfunction!

function! PythonCustomIndent(lnum)
	let pat = '^.*:\s*$'
	if a:lnum == 1
		return 0
	endif
	let lnum = s:PrevNonBlank(a:lnum)
	if getline(lnum) =~ pat 
		return indent(lnum) + &shiftwidth
	endif
	let closed = indent(lnum)
	while lnum == 0 || getline(lnum) !~ pat || (getline(lnum) =~ pat && indent(lnum) >= closed)
		echom closed
		if lnum == 0
			return 0
		endif
		let closed = min([closed, indent(lnum)])
		let lnum = s:PrevNonBlank(lnum)
	endwhile
	echom "End " . closed
	return indent(lnum) + &shiftwidth
endfunction!

setlocal indentexpr=PythonCustomIndent(v:lnum)
