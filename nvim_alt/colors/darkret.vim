highlight clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "darkret"

let s:bg       = "#282c34"
let s:fg       = "#f0eded"

let s:bg_plus  = "#414d55"
let s:fg_plus  = "#b5cfcf"

let s:status_bg = "#294663"

let s:dark_gray = "#6d788d"

let s:red      = "#e33761"
let s:orange   = "#ff6000"
let s:yellow   = "#fff71a"

let s:blue        = "#60a7ff"
let s:bright_blue = "#00e5ff"

let s:cyan     = "#25cbd1"
let s:purple   = "#c678dd"

let s:green        = "#61d251"
let s:bright_green = "#c5df58"

function! s:hi(group, color)
	let l:attr_to_hi = {"fg"  : "guifg",
				     \  "bg"  : "guibg",
				     \  "gui" : "gui"}
	let l:highlight = "highlight " . a:group . " "
	for attr in ["fg", "bg", "gui"]
		if has_key(a:color, attr)
			let l:highlight .= l:attr_to_hi[attr]
			let l:highlight .= "="
			let l:highlight .= a:color[attr]
			let l:highlight .= " "
		endif
	endfor
	exe l:highlight
endfunction!

call s:hi("Normal", {"fg" : s:fg, "bg" : s:bg})
call s:hi("EndOfBuffer", {"fg" : s:bg, "bg" : s:bg})
call s:hi("Comment", {"fg" : s:dark_gray})
call s:hi("Type", {"fg" : s:purple})
call s:hi("String", {"fg" : s:bright_green})
call s:hi("Function", {"fg" : s:blue})
call s:hi("Identifier", {"fg" : s:cyan})
call s:hi("Keyword", {"fg" : s:orange})
call s:hi("Constant", {"fg" : s:orange})
call s:hi("Number", {"fg" : s:green})
call s:hi("Statement", {"fg" : s:purple})

call s:hi("Error", {"fg" : s:red, "bg" : s:bg, "gui" : "bold"})
call s:hi("ErrorMsg", {"fg" : s:red, "bg" : s:bg, "gui" : "bold"})

call s:hi("StatusLine", {"fg" : s:status_bg, "bg" : s:fg_plus })
call s:hi("StatusLineNC", {"fg" : s:status_bg, "bg" : s:fg_plus })
call s:hi("User1", {"fg" : s:fg_plus, "bg" : s:bg_plus})
call s:hi("User2", {"fg" : s:bg, "bg" : s:blue, "gui" : "bold"})
call s:hi("User3", {"fg" : s:blue, "bg" : s:bg_plus, "gui" : "bold"})
call s:hi("User4", {"fg" : s:bg_plus, "bg" : s:status_bg, "gui" : "bold"})

call s:hi("LineNr", {"fg" : s:dark_gray})
call s:hi("CursorLineNr", {"fg" : s:fg})
call s:hi("CursorLine", {"bg" : s:bg_plus})

call s:hi("cStructureParent", {"fg" : s:red, "gui" : "bold"})
call s:hi("cStructureChild", {"fg" : s:blue, "gui" : "bold"})

set background=dark
