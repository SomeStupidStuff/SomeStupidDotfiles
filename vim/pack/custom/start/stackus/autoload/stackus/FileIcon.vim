let s:FileIcon = {}

let s:ft_map = {
			\ "c" : "",
			\ "cpp" : "",
			\ "cs" : "",
			\ "lisp" : "ﬦ",
			\ "clojure" : "",
			\ "scheme" : "ﬦ",
			\ "haskell" : "",
			\ "python" : "",
			\ "ruby" : "",
			\ "perl" : "",
			\ "lua" : "",
			\ "vim" : "",
			\ "html" : "",
			\ "css" : "",
			\ "javascript" : "",
			\ "typescript" : "ﯤ",
			\ "json" : "",
			\ "php" : "",
			\ "java" : "",
			\ "sh" : "",
			\ "bash" : "",
			\ "rust" : "",
			\ "go" : "ﳑ",
			\ "asm" : "",
			\ "nasm" : "",
			\ "text" : "",
			\ "markdown" : "",
			\ "org" : "",
			\ "plaintex" : "",
			\ "tex" : "",
			\ }

function! s:FileIcon.toString() abort dict
	let ft = &l:ft
	if len(ft) == 0 || !has_key(s:ft_map, ft)
		return ''
	endif
	return printf(self.format, s:ft_map[ft])
endfunction!

function! stackus#FileIcon#new(format) abort
	let obj = copy(s:FileIcon)
	let obj.format = a:format
	return obj
endfunction!
