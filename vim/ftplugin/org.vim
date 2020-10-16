set nonumber

inoremap <buffer><silent> <C-j> <CR><C-r>=substitute(getline(line(".")-1),'\v(^\s*\*+\s*)@<=[^* ].*$','','g')<CR>
inoremap <buffer><silent> <C-h> <C-o>:call setline(line("."), substitute(getline("."), '\v(^\s*)@<=\*\s*', '', ''))<CR>
inoremap <buffer><expr> * (getline(".")[:col(".")-1] =~ '\v^\s*\*+\s+') ? '<C-o>mz<C-o>F**<C-o>`z<C-o>$' : '*'
