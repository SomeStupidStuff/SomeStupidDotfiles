function! s:CountParen(line, opens, closes)
	let line = getline(a:line)
	let parens = 0
	for i in range(len(line))
		let char = line[i]
		if index(a:opens, char) >= 0
			let parens += 1
		elseif index(a:closes, char) >= 0
			let parens -= 1
		endif
	endfor
	return parens
endfunction!

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
	if a:lnum == 1
		return 0
	endif
	let line = getline(a:lnum)
	let prev = getline(a:lnum - 1)
	if line !~ '\v^\s*$'
		let curr_parens = s:CountParen(a:lnum, ["(", "[", "{"], ["}", "]", ")"])
		if curr_parens < 0
			let non_blank = s:PrevNonBlank(a:lnum)
			let prev_parens = s:CountParen(non_blank, ["(", "[", "{"], ["}", "]", ")"])
			let spaces = curr_parens * &shiftwidth + prev_parens * &shiftwidth + indent(non_blank)
			if spaces < 0
				let spaces = 0
			endif
			return spaces
		endif
		return -1
	elseif prev =~ '\v^.*:\s*(#.*)?$'
		return &shiftwidth + indent(a:lnum - 1)
	endif
	let prev_parens = s:CountParen(a:lnum - 1, ["(", "[", "{"], ["}", "]", ")"])
	if prev_parens < 0
		let prev_parens = 0
	endif
	return prev_parens * &shiftwidth + indent(s:PrevNonBlank(a:lnum))
endfunction!

setlocal noautoindent

setlocal indentexpr=PythonCustomIndent(v:lnum)
