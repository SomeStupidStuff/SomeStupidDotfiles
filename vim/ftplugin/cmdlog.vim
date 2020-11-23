setlocal nonumber autoread
nnoremap <silent><buffer> q :bd!<CR>
nnoremap <silent><buffer> <Esc> :bd!<CR>
nnoremap <silent><buffer> <CR> :let @z = expand('<cfile>')<CR><C-w>p:e <C-r>z<CR>
nnoremap <silent><buffer> Q :copen<CR>:pclose<CR>
nnoremap <silent><buffer> C :cexpr getline(2, "$")<CR>:b /tmp/output.txt<CR>
nnoremap <silent><buffer> R :w<CR>:Shell <C-r>=getline(1)[9:]<CR><CR>
nnoremap <buffer> S :Shell <C-r>=matchlist(getline(1), '\v^(Command:\s*)(\S*)(\s+\|$)')[2]<CR> 
