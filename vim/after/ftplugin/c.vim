nnoremap <silent><buffer> <Leader>a :call c#EditOther()<CR>

let &l:define = '\v((struct|union|enum)\s+)|(^(\w+\s+)*\w+[ *&]+(\w+\s+)*)(\w+\s*[=(])@=|#\s*define\s*'
