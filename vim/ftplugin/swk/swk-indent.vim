function! SchoolWorkIndent(lnum)
	let line = a:lnum
	while line > 0
		let line -= 1
		if getline(line) =~ '\v^\s*.*:\s*$'
			return indent(line) + &shiftwidth
		endif
	endwhile
	return 0
endfunction!

setlocal indentexpr=SchoolWorkIndent(v:lnum)
