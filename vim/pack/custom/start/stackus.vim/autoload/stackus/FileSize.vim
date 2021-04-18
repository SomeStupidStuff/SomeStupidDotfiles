let s:FileSize = {}

function! s:FileSize.toString() abort dict
	let filename = expand("%:p")
	if len(filename) == 0
		return ''
	endif
	let bytes = getfsize(filename)
	if bytes == 0 || bytes == -1 || bytes == -2
		return ''
	endif
	if bytes < 1000
		return printf(self.format, bytes)
	elseif bytes < 1000 * 1000
		return printf(self.format, printf("%.1fk", bytes / 1000.0))
	else
		return printf(self.format, printf("%.1fm", bytes / 1000.0 / 1000.0))
	endif
endfunction!

function! stackus#FileSize#new(format) abort
	let obj = copy(s:FileSize)
	let obj.format = a:format
	return obj
endfunction!
