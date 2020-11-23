function! s:GetDirectory(prefix)
	let all = glob(a:prefix . "*", 0 , 1)
	let directories = []
	let files = []
	for name in all
		let shortened = substitute(name, '\v^\/home\/[^\/]+', '~', '')
		if isdirectory(name)
			call add(directories, shortened . "/")
		else
			call add(files, shortened)
		endif
	endfor
	return directories + files
endfunction!

function! s:GetInput(window)
	let l:input = ""
	call win_execute(a:window, "let l:input = getline(1)[2:-2]")
	return l:input
endfunction!

function! poprompt#Start()
	if !has("gui_running")
		let g:poprompt_cursor_save=&t_ve
		setlocal t_ve=
	else
		let g:poprompt_cursor_save=&guicursor
		setlocal guicursor=a:xxx
	endif
	let g:poprompt_width = max([&columns / 3, 70])
	let window = popup_create(">  ", #{
									\ pos: 'center',
									\ mapping: 0,
									\ border: [],
									\ borderchars: ['─', '│', '─', '│', '┌', '┐', '┘', '└'],
									\ highlight: "Normal",
									\ minwidth: g:poprompt_width,
									\ minheight: g:poprompt_height
									\})
	call matchadd('popromptDirectory', '\v.{-}\/', 10, -1, {'window' : window})
	call matchadd('popromptText', '\v%1l(\> )@<=.*( $)@=', 10, -1, {'window' : window})
	call matchadd('popromptPrompt', '\v%1l\> ', 20, -1, {'window' : window})
	call matchadd('popromptCursor', '\v%1l $', 20, -1, {'window' : window})
	call matchadd('popromptMatchCount', '\v%2l\[\d+\/\d+\]', 10, -1, {'window' : window})
	call matchadd('popromptNoMatches', '\v%2l\[0\/\d+\]', 15, -1, {'window' : window})
	call s:Run(window)
	call poprompt#End()
endfunction!

function! s:Run(window)
	let prefix = ""
	let selected = 0
	let all_matches = s:GetDirectory(prefix)
	while 1
		let matches = s:MatchedFiles(a:window, all_matches)
		if len(matches) == 0
			let arr = all_matches
		else
			let arr = matches
		endif
		if selected >= len(arr)
			let selected = len(arr)-1
		endif
		call win_execute(a:window, 'call setline(2, "[" . len(matches) . "/" . len(all_matches) . "]")')
		call s:ClearMatches(a:window)
		call s:DisplayMatches(a:window, arr, selected)
		if len(arr)
			let id = s:ShowSelected(a:window, selected)
		endif
		redraw
		let nr = getchar()
		let char = nr2char(nr)
		if char == "\<Esc>"
			break
		elseif nr is# "\<BS>"
			call win_execute(a:window, "if len(getline(1)) > 3 | call setline(1, getline(1)[:-3] . ' ') | endif")
		elseif char == "\<CR>"
			if len(arr) == 0
				let input = s:GetInput(a:window)
				if len(input)
					execute "e " . prefix . input
					break
				endif
			endif
			let name = arr[selected]
			if name[len(name)-1] != "/"
				execute "e " . name
				break
			else
				call win_execute(a:window, "call setline(1, '>  ')")
				let prefix = name
				let all_matches = s:GetDirectory(prefix)
				call s:ClearMatches(a:window)
				let selected = 0
			endif
		elseif char == "\<Tab>"
			let slashes = count(prefix, "/")
			if slashes <= 1
				let prefix = ""
			else
				let found = 0
				let i = 0
				while found != slashes - 1
					if prefix[i] == "/"
						let found += 1
					endif
					let i += 1
				endwhile
				let prefix = prefix[:i-1]
			endif
			let all_matches = s:GetDirectory(prefix)
			call s:ClearMatches(a:window)
			let selected = 0
		elseif char == "~"
			let prefix = "~/"
			let all_matches = s:GetDirectory(prefix)
			call s:ClearMatches(a:window)
			let selected = 0
		elseif char == "\<C-n>"
			call s:HideSelected(a:window, selected)
			let selected = s:Down(arr, selected)
			let id = s:ShowSelected(a:window, selected)
		elseif char == "\<C-p>"
			call s:HideSelected(a:window, selected)
			let selected = s:Up(arr, selected)
			let id = s:ShowSelected(a:window, selected)
		elseif char == "\<C-u>"
			call win_execute(a:window, "call setline(1, '>  ')")
			let all_matches = s:GetDirectory(prefix)
			call s:ClearMatches(a:window)
			let selected = 0
		else
			call win_execute(a:window, "call setline(1, getline(1)[:-2] . '" . char . " ')")
		endif
	endwhile
endfunction!

function! s:MatchedFiles(window, all_matches)
	let input = s:GetInput(a:window)
	if len(input)
		return matchfuzzy(a:all_matches, input)
	else
		return a:all_matches
	endif
endfunction!

function! s:DisplayMatches(window, matches, selected)
	let start = a:selected / g:poprompt_height * g:poprompt_height
	let end = start + g:poprompt_height - 1
	for i in range(len(a:matches[start:end]))
		let m = a:matches[start+i]
		let m .= repeat(' ', g:poprompt_width - len(m))
		call win_execute(a:window, "call setline(i + 3, m)")
	endfor
endfunction!

function! s:ClearMatches(window)
	call win_execute(a:window, "call setline(3, '')")
	call win_execute(a:window, "3,$d _")
endfunction!

function! s:ShowSelected(window, selected)
	call prop_add(a:selected + 3, 1, {'length' : g:poprompt_width, 'bufnr' : winbufnr(a:window), 'type' : 'PopSelected'})
endfunction!

function! s:HideSelected(window, selected)
	call prop_remove({'bufnr' : winbufnr(a:window), 'type' : 'PopSelected'})
endfunction!

function! s:Up(matches, selected)
	if a:selected == 0
		return len(a:matches) - 1
	else
		return a:selected - 1
	endif
endfunction!

function! s:Down(matches, selected)
	if a:selected+1 == len(a:matches)
		return 0
	else
		return a:selected + 1
	endif
endfunction!

function! poprompt#End()
	call popup_clear()
	if !has("gui_running")
		execute "set t_ve=" . g:poprompt_cursor_save
	else
		execute "set guicursor=" . g:poprompt_cursor_save
	endif
endfunction!
