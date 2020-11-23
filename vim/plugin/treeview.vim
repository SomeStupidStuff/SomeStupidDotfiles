if has('nvim')
	finish
endif

let g:treeview_width = get(g:, "treeview_width", &columns / 4 + &columns / 5)

let g:treeview_ft_pat = get(g:, "treeview_ft_pat", {
			\ "c"          : '\v^\s*((\w+\s+)*\w+[ &*]+\w+\(.*\))\s*[;{]\s*$',
			\ "cpp"        : '\v^\s*((\w+\s+)*\w+[ &*]+\w+\(.*\))\s*[;{]\s*$',
			\ "javascript" : '\v^\s*(function\s+\w+\(.*\)).*$',
			\ "js"         : '\v^\s*(function\s+\w+\(.*\)).*$',
			\ "python"     : '\v^(\s*(def|class).*)$',
			\ "org"        : '\v^(\*+.*$)'})

let g:treeview_start = get(g:, "treeview_start", "<Leader>t")

let g:treeview_view_line = get(g:, "treeview_view_line", 1)

execute printf("nnoremap <silent> %s :call treeview#WatchFile()<CR>", g:treeview_start)

hi def link treeviewSelected Visual

call prop_type_add('TreeviewSel', {'highlight' : 'treeviewSelected'})

augroup Treeview
	au!
	au BufWritePost * if get(b:, "treeview_watch", 0) | call treeview#Update() | endif
augroup END
