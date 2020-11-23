if has('nvim')
	finish
endif

let g:poprompt_start = get(g:, 'poprompt_start', '<Leader>f')
let g:poprompt_height = get(g:, 'poprompt_height', 20)

hi def link popromptDirectory Directory
hi def link popromptText Normal
hi def link popromptSelected Visual
hi def link popromptPrompt Function
hi def link popromptCursor Cursor
hi def link popromptMatchCount Number
hi def link popromptNoMatches Error

call prop_type_add('PopSelected', {'highlight' : 'popromptSelected'})

command! Poprompt call poprompt#Start()

execute printf("nnoremap <silent> %s :Poprompt<CR>", g:poprompt_start)
