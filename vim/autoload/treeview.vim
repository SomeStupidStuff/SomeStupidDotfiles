function! treeview#ViewTree()
	" Send error if filetype does not have a regex
	if len(get(g:treeview_ft_pat, &ft, "")) == 0
		echohl Error
		echom "No matching regular expression for filetype '" . &ft . "'"
		echohl
		return
	endif
	" Store filetype and buffer number of source file to be used later
	let ft = &ft
	let buffer = bufnr("%")
	" Open tree view in preview window
	vert pedit TreeView
	" Disable wrap and line numbers
	setlocal nowrap nonumber norelativenumber buftype=nofile
	" Set width of treeview window according to g:treeview_width
	execute g:treeview_width . "wincmd |"
	" Mappings for treeview buffer
	nnoremap <buffer><silent> <CR> :call treeview#JumpToLine(line("."))<CR>
	execute printf("nnoremap <buffer><silent> R :call treeview#Reload(%d)", buffer)
	" Set filetype of tree view buffer
	let &ft=ft
	" Get matches and update tree view buffer
	let matches = treeview#Update(buffer)
	" If matches is empty, show message and exit function
	if len(matches) == 0
		echohl Error
		echom "No matches for treeview to show"
		echohl
		return
	endif
	" Selection highlight drawings
	call treeview#DrawSelection(matches, line("."))
	let autocommands = ""
	let autocommands .= "augroup TreeviewSelectionHighlight"
	let autocommands .= "	au!"
	let autocommands .= "	au CursorMoved <buffer> call treeview#DrawSelection(%s, line(\".\"))"
	let autocommands .= "	au WinLeave <buffer> call treeview#ClearSelection(%d)"
	let autocommands .= "	au WinEnter <buffer> call treeview#DrawSelection(%s, line(\".\"))"
	let autocommands .= "augroup END"
	execute printf(autocommands, matches, buffer, matches)
endfunction!

function! treeview#Reload(buffer)
	" Get new matches from update function
	let matches = treeview#Update(a:buffer)
	" If matches is empty, show message and exit function
	if len(matches) == 0
		echohl Error
		echom "No matches for treeview to show"
		echohl
		return
	endif
	" Re-define TreeviewSelectionHighlight augroup
	call treeview#DrawSelection(matches, line("."))
	let autocommands = ""
	let autocommands .= "augroup TreeviewSelectionHighlight"
	let autocommands .= "	au!"
	let autocommands .= "	au CursorMoved <buffer> call treeview#DrawSelection(%s, line(\".\"))"
	let autocommands .= "	au WinLeave <buffer> call treeview#ClearSelection(%d)"
	let autocommands .= "	au WinEnter <buffer> call treeview#DrawSelection(%s, line(\".\"))"
	let autocommands .= "augroup END"
	execute printf(autocommands, matches, buffer, matches)
endfunction!

function! treeview#Update(buffer)
	" Clear the tree view buffer
	call s:ClearBuffer()
	" Get the filetype pattern
	let pattern = get(g:treeview_ft_pat, &ft, -1)
	" Store current buffer number
	let tree_buffer = bufnr("%")
	" Move into source buffer to get matches
	execute "noautocmd keepalt b " . a:buffer
	" Get matches while in source buffer
	let matches = []
	for i in range(1, line("$"))
		let contents = getline(i)
		if contents =~ pattern
			call add(matches, [matchlist(contents, pattern)[1], i, len(contents)])
		endif
	endfor
	" Move back to tree view buffer
	execute "noautocmd keepalt b " . tree_buffer
	" Display matches
	call s:DisplayMatches(matches)
	" Return matches
	return matches
endfunction!

function! s:DisplayMatches(matches)
	for i in range(len(a:matches))
		call setline(i + 1, matches[i][0])
	endfor
endfunction!

function! treeview#DrawSelection(matches, line)
	" Don't do anything if matches is empty
	if len(a:matches) == 0
		return
	endif
	" Clear selection highlight
	# TODO: Finish this function
	call treeview#ClearSelection()
	let m = a:matches[a:line-1]
	let line = m[1]
	let length = m[2]
	call s:HighlightLine(line, length)
endfunction!

function! s:HighlightLine(line, length)
	" Called from the treeview buffer
	if !bufloaded(b:source_buffer)
		return
	endif
	let win_save = bufwinnr(bufnr())
	execute bufwinnr(b:source_buffer) . "wincmd w"
	try
		if g:treeview_view_line
			call cursor(a:line, 1)
		endif
		call prop_add(a:line, 1, {'type' : 'TreeviewSel', 'length' : a:length})
	catch
		return
	endtry
	execute win_save . "wincmd w"
endfunction!

function! treeview#ClearSelection(buffer)
	" Clear all text props with type TreeviewSel in buffer a:buffer
	call prop_remove({'type' : 'TreeviewSel', 'bufnr' : a:buffer})
endfunction!

function! treeview#JumpToLine(line)
	let line = b:treeview_matches[a:line-1][1]
	let win = bufwinnr(b:source_buffer)
	if win == -1
		execute "b " . b:source_buffer
	else
		execute win . "wincmd w"
	endif
	execute "norm " . line . "G"
	norm zO
endfunction!

function! s:ClearBuffer()
	1,$d
endfunction!
