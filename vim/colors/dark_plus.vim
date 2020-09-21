hi clear
if exists("syntax")
	syntax reset
endif

let g:colors_name = "dark_plus"

let s:black         = '#1e1e1e'
let s:gray          = '#777777'
let s:white         = '#d4d4d4'
let s:light_blue    = '#9cdcfe'
let s:blue          = '#569cd6'
let s:blue_green    = '#4ec9b0'
let s:green         = '#608b4e'
let s:light_green   = '#b5cea8'
let s:yellow        = '#dcdcaa'
let s:yellow_orange = '#d7ba7d'
let s:orange        = '#ce9178'
let s:light_red     = '#d16969'
let s:red           = '#f44747'
let s:pink          = '#c586c0'
let s:violet        = '#646695'

function! s:h(name, ...)
	let l:cmd = "hi " . a:name . " "
	if a:0 == 0
		echom "No highlighting for group " . a:name
		return
	else
		let l:attrs = ["fg", "bg", ""]
		for i in range(a:0)
			if len(a:000[i])
				let l:cmd .= "gui" . l:attrs[i] . "=" . a:000[i] . " "
			endif
		endfor
		execute l:cmd
	endif
endfunction!

call s:h("Normal", s:white, s:black)
call s:h("EndOfBuffer", s:black, s:black)
call s:h("NonText", s:black, s:black)
call s:h("Error", s:red, s:black, "bold")
call s:h("ErrorMsg", s:red, s:black, "bold")
call s:h("Question", s:blue, s:black, "bold")
call s:h("LineNr", s:gray, s:black)
call s:h("CursorLineNr", s:white, s:black, "bold")

call s:h("Visual", "", "#323232")
call s:h("VertSplit", s:black, s:gray)
call s:h("CursorLine", "", "#282828")

call s:h("StatusLine", "#4a4a4a")
call s:h("StatusLineNC", "#3a3a3a")

call s:h("PreProc", s:pink)
call s:h("Identifier", s:light_blue)
call s:h("Type", s:blue, "", "NONE")
call s:h("Comment", s:green)
call s:h("Number", s:light_green)
call s:h("Function", s:yellow)
call s:h("Special", s:yellow_orange)
call s:h("String", s:orange)
call s:h("Statement", s:pink, "", "NONE")
call s:h("Constant", s:violet)
call s:h("Macro", s:blue)

call s:h("cCharacter", s:orange)
call s:h("cSpecialCharacter", s:yellow_orange)
call s:h("cDefine", s:pink)
call s:h("cTypeDecl", s:blue_green)
call s:h("cVariable", s:light_blue)
call s:h("cVariableDecl", s:light_blue)

call s:h("javaScriptBraces", s:white)
call s:h("javaScriptFunction", s:blue)
call s:h("javaScriptMember", s:light_blue)
call s:h("javaScriptKeyword", s:light_blue)
call s:h("javaScriptOperator", s:white)
call s:h("javaScriptIdentifier", s:blue)

call s:h("pythonBuiltin", s:yellow)
call s:h("pythonBuiltinTypes", s:blue_green)
call s:h("pythonMagicMethods", s:yellow)
call s:h("pythonFuncVar", s:light_blue)
call s:h("pythonExceptions", s:blue_green)
call s:h("pythonSelf", s:blue)
call s:h("pythonBoolean", s:blue)
call s:h("pythonClass", s:blue_green)
call s:h("pythonFunctionCall", s:yellow)

call s:h("htmlTitle", s:white, "", "NONE")
call s:h("htmlArg", s:light_blue)
call s:h("htmlEvent", s:light_blue)
call s:h("htmlEquals", s:white)
call s:h("htmlSpecialTagName", s:blue)
call s:h("htmlTagName", s:blue)
call s:h("htmlTag", s:gray)
call s:h("htmlEndTag", s:gray)
