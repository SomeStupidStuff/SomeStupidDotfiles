function! treeview#WatchFile()
	if !len(get(g:treeview_ft_pat, &ft, ""))
		echohl Error
		echom "No matching regular expression for filetype '" . &ft . "'"
		echohl
		return
	endif
	let b:treeview_watch = 1
	let bfnr = bufnr()
	let ft=&ft
	vsplit TreeView
	setlocal nowrap nonumber norelativenumber
	execute g:treeview_width . "wincmd |"
	nnoremap <buffer><silent> <CR> :call treeview#JumpToLine(line("."))<CR>
	let &ft=ft
	let b:source_buffer = bfnr
	call setbufvar(bfnr, "treeview_watch_buffer", bufnr())
	execute bufwinnr(b:source_buffer) . "wincmd w"
	let err = treeview#Update()
	if err
		echohl Error
		echom "No matches for treeview to show"
		echohl
		return
	endif
	execute bufwinnr(b:treeview_watch_buffer) . "wincmd w"
	call treeview#RedrawHighlight(line("."))
	au CursorMoved <buffer> call treeview#RedrawHighlight(line("."))
	au WinLeave <buffer> call treeview#ClearHighlight()
	au WinEnter <buffer> call treeview#RedrawHighlight(line('.'))
endfunction!

function! treeview#Update()
	if !bufloaded(b:treeview_watch_buffer)
		let b:treeview_watch = 0
		return
	endif
	call s:ClearBuffer()
	let re = get(g:treeview_ft_pat, &ft, -1)
	let matches = []
	for i in range(1, line("$"))
		if getline(i) =~ re
			call add(matches, [matchlist(getline(i), re)[1], i, len(getline(i))])
		endif
	endfor
	if !len(matches)
		execute "bd! " . b:treeview_watch_buffer
		return 1
	endif
	call setbufvar(b:treeview_watch_buffer, "treeview_matches", matches)
	call s:DisplayMatches()
	return 0
endfunction!

function! s:DisplayMatches()
	let matches = getbufvar(b:treeview_watch_buffer, "treeview_matches")
	for i in range(len(matches))
		call setbufline(b:treeview_watch_buffer, i + 1, matches[i][0])
	endfor
	call setbufvar(b:treeview_watch_buffer, "&modified", 0)
endfunction!

function! treeview#RedrawHighlight(line)
	if len(get(b:, "treeview_matches", [])) == 0
		return
	endif
	call treeview#ClearHighlight()
	let match = b:treeview_matches[a:line-1]
	let line = match[1]
	let length = match[2]
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

function! treeview#ClearHighlight()
	" Called from the treeview buffer
	let win_save = bufwinnr(bufnr())
	execute bufwinnr(b:source_buffer) . "wincmd w"
	call prop_remove({'type' : 'TreeviewSel'})
	execute win_save . "wincmd w"
endfunction!

function! treeview#JumpToLine(line)
	" Called from the treeview buffer
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
	let win_save = bufwinnr(bufnr())
	execute bufwinnr(b:treeview_watch_buffer) . "wincmd w"
	1,$d
	execute win_save . "wincmd w"
endfunction!
