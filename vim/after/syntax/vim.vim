syntax match vimBracket /\v\\?\<(Enter\>)@=/ containedin=vimMapLhs,vimMapRhs
syntax match vimBracket /\v(\<Enter)@<=\>/ containedin=vimMapLhs,vimMapRhs
syntax match vimNotation /\v\<@<=Enter\>@=/ containedin=vimMapLhs,vimMapRhs
syntax match vimUserFunc /\v<\w+#\w+(\s*\()@=/ containedin=vimFuncBody
hi def link vimAutocmdSfxList Special
