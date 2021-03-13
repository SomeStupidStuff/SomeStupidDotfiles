hi link javaScriptNumber Number

syntax match javaScriptFunctionCall /\v[a-zA-Z_][a-zA-Z0-9_]*(\s*\()@=/ contains=javaScriptMemberFunction
syntax match javaScriptMemberFunction /\v(\.)@<=[a-zA-Z_][a-zA-Z0-9_]*(\s*\()@=/ contains=javaScriptRegexpString
hi link javaScriptMemberFunction Function
hi link javaScriptFunctionCall Function

syntax match javaScriptConstant /\v<_*[A-Z][A-Z_]*>/ containedin=javaScriptOperatorVar
hi link javaScriptConstant Constant

syntax match javaScriptType /\v(<(new|class|extends)\s+)@<=[a-zA-Z_][a-zA-Z0-9_]*>/ containedin=javaScriptFunctionCall
syntax match javaScriptType /\v<_*[A-Z][a-zA-Z0-9_]*(\.)@=/ containedin=javaScriptOperatorVar contains=javaScriptConstant
hi link javaScriptType Type

syntax match javaScriptConstVar /\v(const\s+)@<=[a-zA-Z_][a-zA-Z0-9_]*/
syntax match javaScriptVar /\v((let|var)\s+)@<=[a-zA-Z_][a-zA-Z0-9_]*/
" syntax match javaScriptOperatorVar /\v(([^a-zA-Z0-9_ 	]|return|^)\s*)@<=[a-zA-Z_][a-zA-Z0-9_]*(\s*[^a-zA-Z0-9_ ])@=/ contains=javaScriptRegexpString,javaScriptFunctionCall,javaScriptMemberFunction
hi link javaScriptConstVar Constant
hi link javaScriptVar Identifier
hi link javaScriptOperatorVar javaScriptVar

syntax match javaScriptOperator /[+\-*/%=<>!&|^$]/ contains=javaScriptRegexpString,javaScriptComment,javaScriptLineComment,jsComment
syntax match javaScriptTernaryOperator /\v\?|(\?.*)@<=:/
hi def link javaScriptTernaryOperator javaScriptOperator

syntax keyword javaScriptReserved get from
