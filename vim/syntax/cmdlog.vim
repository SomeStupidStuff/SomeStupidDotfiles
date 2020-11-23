syntax match cmdlogCommandMarker /\v%1l^Command:/ nextgroup=cmdlogCommand skipwhite
syntax match cmdlogCommand /.*$/ contained

hi def link cmdlogCommandMarker Type
hi def link cmdlogCommand String

" General syntax that may be found in terminal output

syntax match cmdlogNumber /\v<([+\-]?\d+(\.\d+(f)?)?)>/
syntax match cmdlogNumber /\v<(0x[0-9a-f]+)>/
syntax match cmdlogNumber /\v<(0b[01]+)>/
syntax match cmdlogNumber /\v<(0o[0-7]+)>/
hi def link cmdlogNumber Number

" Single Quote string
syntax region cmdlogStringSQ start=+'+ end=+'+ skip=+\\'+

" Double Quote string
syntax region cmdlogStringDQ start=+"+ end=+"+ skip=+\\"+

hi def link cmdlogStringSQ String
hi def link cmdlogStringDQ String
