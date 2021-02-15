iabbrev <buffer><expr> mainf TabSnippet("mainf", "fn main() {<CR>}<C-o>Oprintln!(\"Hello, World!\");")
iabbrev <buffer><expr> print TabSnippet("print", "println!(\"{}\", );<C-o>h")
iabbrev <buffer><expr> todo TabSnippet("todo", "todo!()<Left>")
iabbrev <buffer><expr> veca TabSnippet("veca", "vec![]<Left>")

iabbrev <buffer><expr> loop TabSnippet("loop", "loop {<CR>}<C-o>O")
iabbrev <buffer><expr> for TabSnippet("for", "for  in _ {<CR>}<C-o>k<C-o>$<C-o>6h")
iabbrev <buffer><expr> while TabSnippet("while", "while  {<CR>}<C-o>k<C-o>$<C-o>h")
iabbrev <buffer><expr> mat TabSnippet("mat", "match  {<CR>}<C-o>k<C-o>$<C-o>h")
iabbrev <buffer><expr> if TabSnippet("if", "if  {<CR>}<C-o>k<C-o>$<C-o>h")
iabbrev <buffer><expr> elif TabSnippet("elif", "else if  {<CR>}<C-o>k<C-o>$<C-o>h")
iabbrev <buffer><expr> else TabSnippet("else", "else {<CR>}<C-o>O")

iabbrev <buffer><expr> str TabSnippet("str", "String")
iabbrev <buffer><expr> vec TabSnippet("vec", "Vec<><Left>")
iabbrev <buffer><expr> opt TabSnippet("opt", "Option<><Left>")
iabbrev <buffer><expr> res TabSnippet("res", "Result<><Left>")
iabbrev <buffer><expr> box TabSnippet("box", "Box<><Left>")

iabbrev <buffer><expr> der TabSnippet("der", "#[derive()]<C-o>h")

iabbrev <buffer><expr> mod TabSnippet("mod", "mod  {<CR>}<C-o>k<C-o>$<C-o>h")
iabbrev <buffer><expr> enum TabSnippet("enum", "enum  {<CR>}<C-o>k<C-o>$<C-o>h")
iabbrev <buffer><expr> struct TabSnippet("struct", "struct  {<CR>}<C-o>k<C-o>$<C-o>h")
iabbrev <buffer><expr> impl TabSnippet("impl", "impl  {<CR>}<C-o>k<C-o>$<C-o>h")

let &define = '\v(<(fn\s+|mod\s+|enum\s+|struct\s+|for\s+|use\s+(\w+::)+|let(\s+mut)?\s+)(\w+>(::)@!)@=)|(^\s*)(\w+:.*(,|\s*$))@='
