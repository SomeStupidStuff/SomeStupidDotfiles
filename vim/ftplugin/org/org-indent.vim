function! OrgIndent(lnum)
	let line = a:lnum
	if getline(line) =~ '\v^\*+\s.*$'
		return 0
	elseif getline(line-1) =~ '\v^\s*\-\s.*$'
		return indent(line-1) + &shiftwidth
	endif
	while line > 0
		let line -= 1
		if getline(line) =~ '\v^\*+\s.*$'
			return len(substitute(getline(line), '\s.*$', '', '')) + 1
		endif
	endwhile
	return 0
endfunction!

setlocal indentexpr=OrgIndent(v:lnum)
