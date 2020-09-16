syntax match cFunction /\v\w+\s*\(@=/
hi link cFunction Function

syntax match cTypeDecl /\v(^\s*([a-zA-Z_][a-zA-Z0-9_]*\s*)*([ &*]+[a-zA-Z_][a-zA-Z0-9_]*\s*\(.*)?)@<=(typedef\s*)@<![a-zA-Z_][a-zA-Z0-9_]*([ *&]+[a-zA-Z_][a-zA-Z0-9_]*[[\]0-9A-Z_ ]*[;=(),])@=/
syntax match cPredictType /\v(^\s*|[(,]\s*)@<=[a-zA-Z_][a-zA-Z0-9_]*(\s*[&*])@=/ contains=cTypeDecl,cPointerCast
syntax match cPrefixType /\v((struct|union|enum)\s+)@<=[a-zA-Z_][a-zA-Z0-9_]*/
syntax match cCapitalCast /\v([^a-zA-Z0-9_]\(\s*)@<=[A-Z][a-zA-Z0-9_]*(\s*\))@=/ contains=cMacro
syntax match cPointerCast /\v([^a-zA-Z0-9_]\(\s*)@<=[a-zA-Z_][a-zA-Z0-9_]*(\s*\*+\s*\))@=/ contains=cMacro
syntax match cTypedefType /\v(^}\s+)@<=[a-zA-Z_][a-zA-Z0-9_]*;@=/
syntax match cTypedefTypeL /\v(^typedef.*\s+)@<=[a-zA-Z_][a-zA-Z0-9_]*(;|\s+[a-zA-Z_][a-zA-Z0-9_]*;)@=/
hi def link cPrefixType cTypeDecl
hi def link cPointerCast cCapitalCast
hi def link cTypedefType cTypeDecl
hi def link cTypedefTypeL cTypeDecl
hi def link cTypeDecl Type

syntax match cVariable /\v([^a-zA-Z0-9_ ]\s*)@<=[a-zA-Z_][a-zA-Z0-9_]*(\s*[^a-zA-Z0-9_ ])@=/ contains=cFunction,cTypeDecl,cPredictType,cCapitalCast,cCharacter,cSpecialCharacter,cTypedefType,cTypedefTypeL
syntax match cVariableDecl /\v([a-zA-Z_][a-zA-Z0-9_]*\s+)@<=[a-zA-Z_][a-zA-Z0-9_]*([[\]0-9A-Z_ ]*[;=(),])@=/ contains=cFunction,cTypedefType,cTypedefTypeL
hi link cAfterBracesList cVariable

syntax match cSymbolOp /\v[=+\-*/%!^&<>?~]|(\?.*)@=:/ contains=cComment,cCommentL

syntax match cMacro /\v<[A-Z_][A-Z0-9_]*>(\s*$)@!|(^\s*#(define|if(n?def)?)\s+)@<=[a-zA-Z_][a-zA-Z0-9_]*/ containedin=cDefine,cPreCondit
syntax match cMacroFunction /\v[A-Z_][A-Z0-9_]*\(@=/ containedin=cMacro contained
syntax match cSecondMacro /\v(^\s*#(define|if(n?def)?)\s+[a-zA-Z_][a-zA-Z0-9_]*\s+)@<=[a-zA-Z_][a-zA-Z0-9_]*/ containedin=cDefine
syntax match cSwitchMacro /\v(case\s+)@<=[A-Z_]+/
hi link cSecondMacro cMacro
hi link cMacroFunction cMacro
hi def link cMacro Macro
