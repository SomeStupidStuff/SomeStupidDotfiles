function s:CountParens(open, close) abort
	if a:open == a:close
		return len(filter(split(getline("."), '\.*'), {_, c -> c == a:open})) % 2
	endif
	let c = 0
	for i in split(getline("."), '\zs')
		if i == a:open
			let c += 1
		elseif i == a:close
			let c -= 1
		endif
	endfor
	return c
endfunction

function duozen#SurroundParen() abort
	let line = getline(".")
	let col = col(".") - 1
	let open = line[col - 1]
	let close = line[col]
	for [o, c] in g:duozen_parens
		if o == open && c == close
			return 1
		endif
	endfor
	return 0
endfunction

function duozen#OpenParen(open, close) abort
	let c = s:CountParens(a:open, a:close)
	let line = getline(".")
	let col = col(".") - 1
	if a:open == a:close && line[col] == a:open
		return "\<Right>"
	elseif a:open == a:close && c == 0
		return printf("%s%s\<Left>", a:open, a:close)
	elseif a:open == a:close && c == 1
		return a:open
	elseif c < 0
		return a:open
	else
		return printf("%s%s\<Left>", a:open, a:close)
	endif
endfunction

function duozen#CloseParen(open, close) abort
	let c = s:CountParens(a:open, a:close)
	let line = getline(".")
	let col = col(".") - 1
	if c > 0
		return a:close
	elseif line[col] == a:close
		return "\<Right>"
	else
		return a:close
	endif
endfunction
