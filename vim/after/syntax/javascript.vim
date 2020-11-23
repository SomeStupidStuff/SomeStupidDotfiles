hi link javaScriptNumber Number

syntax match javaScriptFunctionCall /\v[a-zA-Z_][a-zA-Z0-9_]*(\s*\()@=/ contains=javaScriptMemberFunction
syntax match javaScriptMemberFunction /\v(\.)@<=[a-zA-Z_][a-zA-Z0-9_]*(\s*\()@=/
hi link javaScriptMemberFunction Function
hi link javaScriptFunctionCall Function

syntax keyword javaScriptMath Math
hi link javaScriptMath javaScriptKeyword
hi link javaScriptMember javaScriptKeyword

syntax match javaScriptConstVar /\v(const\s+)@<=[a-zA-Z_][a-zA-Z0-9_]*/
syntax match javaScriptVar /\v((let|var)\s+)@<=[a-zA-Z_][a-zA-Z0-9_]*/
syntax match javaScriptOperatorVar /\v(([^a-zA-Z0-9_ 	]|^)\s*)@<=[a-zA-Z_][a-zA-Z0-9_]*(\s*[^a-zA-Z0-9_ ])@=/ contains=javaScriptFunctionCall,javaScriptMemberFunction
hi link javaScriptConstVar Identifier
hi link javaScriptVar Identifier
hi link javaScriptOperatorVar Identifier

syntax match javaScriptOperator /[+\-*/%=<>!&|^$]/ contains=javaScriptComment,javaScriptLineComment,jsComment
syntax match javaScriptTernaryOperator /\v\?|(\?.*)@<=:/
hi def link javaScriptTernaryOperator javaScriptOperator
