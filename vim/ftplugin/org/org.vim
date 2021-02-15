setlocal nonumber nocursorline expandtab shiftwidth=2 softtabstop=2 textwidth=80

function! s:OrgOpenLink()
	let file = expand("<cfile>")
	if file =~ '\v^\w+:\/\/.+\..+$'
		call system("xdg-open " . file . " &")
	elseif file =~ '\v^www\..+\..+$'
		call system("xdg-open https://" . file . " &")
	else
		execute "e " . file
	endif
endfunction!

nnoremap <silent> <C-c><C-o> :call <SID>OrgOpenLink()<CR>

function! s:OrgToggleCheckbox()
	# TODO: Implement this function
endfunction!

nnoremap <silent> <C-c><C-c> :call <SID>OrgToggleCheckbox()<CR>

inoremap <buffer><silent> <C-j> <CR><C-u><C-r>=substitute(getline(line(".")-1),'\v(^\s*\*+\s*)@<=[^* ].*$','','g')<CR>
inoremap <buffer><silent> <C-l> <C-o>:call setline(line("."), substitute(getline("."), '\v(^\s*)@<=\*\s*', '', ''))<CR>
inoremap <buffer><expr> * (getline(".")[:col(".")-1] =~ '\v^\s*\*+\s+') ? '<C-o>mz<C-o>F**<C-o>`z<C-o>$' : (getline(".") =~ '\v^\s*$') ? '<C-u>*' : '*'
