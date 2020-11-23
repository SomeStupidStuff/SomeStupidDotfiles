syntax match swkHeader /\v^\s*.*:\s*$/
syntax match swkBulletPoint /\v^\s*-/
syntax match swkBulletSubject /\v(^\s*-\D\s*)@<=[^:]*(\s*:)@=/
syntax match swkBulletSubjectSep /\v(^\s*-\D\s*[^:]*\s*)@<=:/
syntax match swkBulletContent /\v(^\s*-\D\s*[^:]*\s*:?)@<=.*$/ contains=swkBulletSubject,swkBulletSubjectSep,swkString

syntax match swkParagraphContent /\v(^(\s{4}))[A-Z].*$/ contains=swkString

syntax region swkString start=+"+ end=+"+
hi def link swkString String

syntax match swkMathOperator /\v[+*/%=<>]/ contains=swkParagraphContent
syntax match swkMathOperator /\v(\d\s*)@<=-/
syntax match swkMathOperator /\v-(\d)@=/

syntax match swkMathVariable /\v(^\s*|[^a-zA-Z0-9_ 	]\s*)@<=(<[abcd]?[xyz]>|<[abcd]>)(\s*$|\s*[^a-zA-Z0-9_ 	])@=/

syntax keyword swkMathFunction pow rand
hi def link swkMathFunction Function

syntax match swkNumber /\v\d+/
hi def link swkNumber Number
