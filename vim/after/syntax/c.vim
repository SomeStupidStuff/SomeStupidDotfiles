" This syntax can be very slow on large files, so be warned
if line('$') > 500
	finish
endif

syntax match cFunction /\v\w+\s*\(@=/
hi def link cFunction Function

" syntax match cVariable /\v([^a-zA-Z0-9_ ]\s*)@<=[a-zA-Z_][a-zA-Z0-9_]*(\s*[^a-zA-Z0-9_ ])@=/ contains=cFunction,cTypeDecl,cPredictType,cCapitalCast,cCharacter,cSpecialCharacter,cTypedefType,cTypedefTypeL
" syntax match cVariableDecl /\v([a-zA-Z_][a-zA-Z0-9_]*\s+)@<=[a-zA-Z_][a-zA-Z0-9_]*([[\]0-9A-Z_ ]*[;=(),])@=/ contains=cFunction,cTypedefType,cTypedefTypeL

syntax match cMacro /\v<[A-Z_][A-Z0-9_]*>(\s*$)@!|(^\s*#(define|if(n?def)?)\s+)@<=[a-zA-Z_][a-zA-Z0-9_]*/ containedin=cDefine,cPreCondit
syntax match cMacroFunction /\v[A-Z_][A-Z0-9_]*\(@=/ containedin=cMacro contained
syntax match cMacro /\v(^\s*#(define|if(n?def)?)\s+[a-zA-Z_][a-zA-Z0-9_]*\s+)@<=[a-zA-Z_][a-zA-Z0-9_]*/ containedin=cDefine
syntax match cMacro /\v(case\s+)@<=[A-Z_]+/
hi link cMacroFunction cMacro
hi def link cMacro Macro

syntax match cSymbolOp /\v[=+\-*/%!^&<>?~]|(\?.*)@=:/ contains=cComment,cCommentL

if !get(g:, "c_minimal_highlight", 0)
	syntax match cTypeOverride /\v(^\s*|[(,]\s*)@5<=[a-zA-Z_][a-zA-Z0-9_]*(\s*[&*])@5=/ contains=cTypeDecl
	syntax match cTypeDecl /\v(^\s*([a-zA-Z_][a-zA-Z0-9_]*\s*)*([ &*]+[a-zA-Z_][a-zA-Z0-9_]*\s*\(.*)?)@<=(typedef\s*)@5<![a-zA-Z_][a-zA-Z0-9_]*([ *&]+[a-zA-Z_][a-zA-Z0-9_]*[[\]0-9A-Z_ ]*[;=(),])@5=/
	syntax match cTypeDecl /\v((struct|union|enum)\s+)@10<=[a-zA-Z_][a-zA-Z0-9_]*/
	syntax match cTypeDecl /\v([^a-zA-Z0-9_]\(\s*)@5<=[A-Z][a-zA-Z0-9_]*(\s*\))@5=/
	syntax match cTypeDecl /\v([^a-zA-Z0-9_]\(\s*)@5<=[a-zA-Z_][a-zA-Z0-9_]*(\s*\*+\s*\))@5=/ contains=cMacro
	syntax match cTypeDecl /\v(^}\s+)@5<=[a-zA-Z_][a-zA-Z0-9_]*;@1=/
	syntax match cTypeDecl /\v(^typedef.*\s+)@5<=[a-zA-Z_][a-zA-Z0-9_]*(;|\s+[a-zA-Z_][a-zA-Z0-9_]*;)@5=/
	hi def link cTypeDecl Type
endif
