if !exists("g:stackus_components")
	finish
endif

set statusline=%!stackus#Active()

augroup Stackus
	au!
	au ColorScheme * setlocal statusline=%!stackus#Active()
	au FileType * setlocal statusline=%!stackus#Active()
	au BufWinEnter * setlocal statusline=%!stackus#Active()
	au BufReadPost * setlocal statusline=%!stackus#Active()
	au BufWritePost * setlocal statusline=%!stackus#Active()
	au BufEnter * setlocal statusline=%!stackus#Active()
	au WinEnter * setlocal statusline=%!stackus#Active()
	au FileChangedShellPost * setlocal statusline=%!stackus#Active()
	au VimResized * setlocal statusline=%!stackus#Active()
	au WinLeave * setlocal statusline=%!stackus#Inactive()
augroup END
