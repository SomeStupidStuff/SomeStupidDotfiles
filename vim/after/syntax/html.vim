syntax match htmlEquals /=/ containedin=htmlTag,htmlEvent,htmlScriptTag
syntax match htmlTagNumber /[0-9]\+/ containedin=htmlTag
hi link htmlTagNumber Number
