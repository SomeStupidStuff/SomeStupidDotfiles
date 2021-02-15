" Makes it so that template types that have a lot of builtin names aren't
" completely highlighted purple. This doesn't affect comparison so long as
" you put spaces between the operator and the identifiers.
" Example: Option<i32> is completely highlighted in purple. This makes it so
" that the brackets are now highlighted white.
syntax match rustTemplateBrackets /\v(\w+|::)@<=[<>]+/ containedin=rustOperator contained

syntax keyword rustKeyword dyn

syntax match rustIdentifier /\v(<impl\s+)@<=\w+>/
