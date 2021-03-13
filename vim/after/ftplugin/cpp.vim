iabbrev <buffer><expr> mainf TabSnippet("mainf", "#include <iostream>\<CR>\<CR>int main(int argc, char *argv[]) {\<CR>std::cout << \"Hello, World!\" << std::endl;\<CR>return 0;\<CR>}<C-o>2k<C-o>$")

iabbrev <buffer><expr> class TabSnippet("class", "class  {\<CR><C-u>};<C-o>k<C-o>$<C-o>h")
iabbrev <buffer><expr> struct TabSnippet("struct", "struct  {\<CR><C-u>};<C-o>k<C-o>$<C-o>h")

iabbrev <buffer><expr> tem TabSnippet("tem", "template <><C-o>h<C-o>l")
