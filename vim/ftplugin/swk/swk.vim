setlocal wrap linebreak nonumber nocursorline expandtab softtabstop=4
nnoremap <buffer> j gj
nnoremap <buffer> k gk

" Subjects
ia <buffer><expr> mat TabSnippet("mat", "- Math: ")
ia <buffer><expr> phe TabSnippet("phe", "- Phys Ed: ")
ia <buffer><expr> orc TabSnippet("orc", "- Orchestra: ")
ia <buffer><expr> uac TabSnippet("uac", "- UA: ")
ia <buffer><expr> eng TabSnippet("eng", "- English: ")
ia <buffer><expr> gol TabSnippet("gol", "- Goal: ")
ia <buffer><expr> soc TabSnippet("soc", "- Social Studies: ")
ia <buffer><expr> sci TabSnippet("sci", "- Science: ")
ia <buffer><expr> spa TabSnippet("spa", "- Spanish: ")

" Days of the week
ia <buffer><expr> sun TabSnippet("sun", "Sunday")
ia <buffer><expr> mon TabSnippet("mon", "Monday")
ia <buffer><expr> tue TabSnippet("tue", "Tuesday")
ia <buffer><expr> wed TabSnippet("wed", "Wednesday")
ia <buffer><expr> thu TabSnippet("thu", "Thursday")
ia <buffer><expr> fri TabSnippet("fri", "Friday")
ia <buffer><expr> sat TabSnippet("sat", "Saturday")

" Website/Assignment Names
ia <buffer><expr> ednu TabSnippet("ednu", "Edgenuity")
ia <buffer><expr> edpu TabSnippet("edpu", "Edpuzzle")
ia <buffer><expr> ss TabSnippet("ss", "Study Sync")

" Common Words
ia <buffer><expr> asm TabSnippet("asm", "assignment")
ia <buffer><expr> com TabSnippet("com", "Complete")
ia <buffer><expr> wks TabSnippet("wks", "worksheet")
