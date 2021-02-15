function! s:IncludeSnippet()
	echo
	let char = nr2char(getchar())
	if char == "<"
		return "#include <>\<Left>"
	elseif char == "\""
		return "#include \"\"\<Left>"
	elseif char == "\<Tab>"
		return "#include "
	else
		return "inc" . char
	endif
endfunction!

function! s:GetHeader()
	let filename = expand("%:p:t")
	let filename = substitute(filename, '\.', '_', 'g')->toupper()
	return filename
endfunction!

iabbrev <buffer><expr> mainf TabSnippet("mainf", "#include <stdio.h>\<CR>\<CR>int main(int argc, char *argv[]) {\<CR>printf(\"Hello, World!\\n\");\<CR>return 0;\<CR>}\<C-o>2k\<C-o>$")
iabbrev <buffer><expr> headf TabSnippet("headf", "#ifndef <C-r>=<SID>GetHeader()<CR><CR>#define <C-r>=<SID>GetHeader()<CR><CR><CR><CR><CR>#endif // <C-r>=<SID>GetHeader()<CR><C-o>2k")
iabbrev <buffer><expr> incs TabSnippet("incs", "#include \"\"<Left>")
iabbrev <buffer><expr> incl TabSnippet("incl", "#include <><Left>")
iabbrev <buffer><expr> def TabSnippet("def", "#define ")
iabbrev <buffer><expr> ind TabSnippet("ind", "#ifndef ")
iabbrev <buffer><expr> re TabSnippet("re", "return ")
iabbrev <buffer><expr> for TabSnippet("for", "for (;;) {<CR>}<C-o>k<C-o>$<C-o>4h")
iabbrev <buffer><expr> while TabSnippet("while", "while () {<CR>}<C-o>k<C-o>$<C-o>2h")
iabbrev <buffer><expr> if TabSnippet("if", "if () {<CR>}<C-o>k<C-o>$<C-o>2h")
iabbrev <buffer><expr> elif TabSnippet("elif", "else if () {<CR>}<C-o>k<C-o>$<C-o>2h")
iabbrev <buffer><expr> else TabSnippet("else", "else {<CR>}<C-o>O")

iabbrev <buffer><expr> inc <SID>IncludeSnippet()
