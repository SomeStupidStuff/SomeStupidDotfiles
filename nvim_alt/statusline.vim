let g:mode_map = {
		\ 'n'  : 'Normal ',
		\ 'v'  : 'Visual ',
		\ 'V'  : 'V·Line ',
		\ '�' : 'V·Block ',
		\ 'i'  : 'Insert ',
		\ 'R'  : 'Replace ',
		\ 'Rv' : 'V·Replace ',
		\ 'c'  : 'Command ',
		\ 's'  : 'Select ',
		\ 't'  : 'Terminal '
		\}

set statusline=
set statusline+=%2*
set statusline+=\ %{toupper(g:mode_map[mode()])}
set statusline+=%3*
set statusline+=
set statusline+=%1*
set statusline+=\ %f
set statusline+=%{&modified?'\ [+]\ ':'\ '}
set statusline+=%4*
set statusline+=
set statusline+=\ %*
set statusline+=%=
set statusline+=\[%{&fileformat}\]\ 
set statusline+=%4*
set statusline+=
set statusline+=%1*
set statusline+=\ ≡\ %l/%L\ ⊂\ %c\ 
