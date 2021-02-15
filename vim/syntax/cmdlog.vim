syntax match cmdlogCommandMarker /\v%1l^Command:/ nextgroup=cmdlogCommand skipwhite
syntax match cmdlogCommand /.*$/ contained

hi def link cmdlogCommandMarker Type
hi def link cmdlogCommand String

" General syntax that may be found in terminal output

" Numbers
syntax match cmdlogNumber /\v<([+\-]?\d+(\.\d+(f)?)?)>/
syntax match cmdlogNumber /\v<(0x[0-9a-f]+)>/
syntax match cmdlogNumber /\v<(0b[01]+)>/
syntax match cmdlogNumber /\v<(0o[0-7]+)>/
hi def link cmdlogNumber Number

" Single Quote string
syntax region cmdlogStringSQ start=+\v(^|\s)@<='+ end=+'+ skip=+\\'+

" Double Quote string
syntax region cmdlogStringDQ start=+\v(^|\s)@<="+ end=+"+ skip=+\\"+

hi def link cmdlogStringSQ String
hi def link cmdlogStringDQ String

" Function calls
syntax match cmdlogFunction /\v<[a-zA-Z_][a-zA-Z0-9_]*(\s*\()@5=/
hi def link cmdlogFunction Function

" Undefined or empty values
syntax keyword cmdlogEmpty null undefined None nullptr NULL
hi def link cmdlogEmpty Type

" Exit status code
syntax match cmdlogSuccess /\v^\[Process exited with a status code of 0\]/
syntax match cmdlogFailure /\v^\[Process exited with a status code of -?\d+\]/ contains=cmdlogSuccess
