function! OrgFoldText(lnum)
	let text = getline(a:lnum)
	let text = substitute(text, '\t', repeat(' ', &shiftwidth), 'g')
	if text =~ '\v^\*+\s.*$'
		let bullets = ["", "", "﯂", "ﰉ", "◉", "○", "✸", "◆"]
		if get(g:, "org_bullet_icons", 0)
			let index = 0
		else
			let index = 4
		endif
		let level = len(substitute(text, '\v(^\*+)@<=\s.*$', '', 'g')) - 1
		let level %= 4
		let index += level
		let text = substitute(text, '\v(^\**)@<=\*\s@=', bullets[index], '')
		let text = substitute(text, '\v(^\**)@<=\*', ' ', 'g')
	endif
	return text . "…"
endfunction!

setlocal foldtext=OrgFoldText(v:foldstart)

function! OrgFoldExpr(lnum)
	let l = a:lnum
	let text = getline(l)
	if text =~ '\v^\*+\s.*$'
		return '>' . len(substitute(text, '\s.*$', '', ''))
	elseif text =~ '\v^$' && getline(l - 1) =~ '\v^$'
		return 0
	endif
	while l > 0
		let l -= 1
		let text = getline(l)
		if text =~ '\v^\*+\s.*$'
			return len(substitute(text, '\s.*$', '', ''))
		endif
	endwhile
	return 0
endfunction!

setlocal foldmethod=expr
setlocal foldexpr=OrgFoldExpr(v:lnum)
