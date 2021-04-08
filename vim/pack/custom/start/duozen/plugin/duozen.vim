let g:duozen_parens = get(g:, "duozen_parens", [
			\ ["(", ")"],
			\ ["{", "}"],
			\ ["[", "]"],
			\ ["'", "'"],
			\ ['"', '"']])

let cr_mapping = maparg("<CR>", "i", v:false, v:true)

if cr_mapping.expr
	let rhs = cr_mapping.rhs
	execute printf(
		\ "inoremap <expr> <CR> duozen#SurroundParen() ? '<CR><C-o>O' : (%s)",
		\ rhs)
else
	inoremap <expr> <CR> duozen#SurroundParen() ? '<CR><C-o>O' : '<CR>'
endif

inoremap <expr> <BS> duozen#SurroundParen() ? '<C-o>x<BS>' : '<BS>'

for [open, close] in g:duozen_parens
	execute printf(
		\ "inoremap <silent> %s <C-r>=duozen#OpenParen(%s, %s)<CR>",
		\ open,
		\ string(open),
		\ string(close))
	if open != close
		execute printf(
			\ "inoremap <silent> %s <C-r>=duozen#CloseParen('%s', '%s')<CR>",
			\ close,
			\ open,
			\ close)
	endif
endfor
