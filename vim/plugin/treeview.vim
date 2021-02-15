if has('nvim')
	finish
endif

let g:treeview_width = get(g:, "treeview_width", &columns / 4 + &columns / 5)

let g:treeview_ft_pat = get(g:, "treeview_ft_pat", {
			\ "c"          : '\v^\s*((\w+\s+)*\w+[ &*]+\w+\(.*\))\s*[;{]\s*$',
			\ "vim"        : '\v^(\s*function!?\s+.*\(.*\).*)$',
			\ "cpp"        : '\v^\s*((\w+\s+)*\w+[ &*]+\w+\(.*\))\s*[;{]\s*$',
			\ "js"         : '\v^\s*(function\s+\w+\(.*\)).*$',
			\ "python"     : '\v^(\s*(def|class).*)$',
			\ "org"        : '\v^(\*+.*$)'})

let g:treeview_start = get(g:, "treeview_start", "<Leader>t")

let g:treeview_view_line = get(g:, "treeview_view_line", 1)

execute printf("nnoremap <silent> %s :call treeview#ViewTree()<CR>", g:treeview_start)

hi def link treeviewSelected Visual

call prop_type_add('TreeviewSel', {'highlight' : 'treeviewSelected'})
