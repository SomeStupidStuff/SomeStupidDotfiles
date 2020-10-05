hi clear
if exists("syntax")
	syntax reset
endif

let s:white        = "#f8f8f2"
let s:black        = "#282a36"
let s:status_gray  = "#383a46"
let s:cursor_gray  = "#2e303e"
let s:visual_gray  = "#3c3f52"
let s:comment_gray = "#6272a4"
let s:cyan         = "#8be9fd"
let s:green        = "#50fa7b"
let s:orange       = "#ffb86c"
let s:pink         = "#ff79c6"
let s:purple       = "#bd93f9"
let s:red          = "#ff5555"
let s:yellow       = "#f1fa8c"

let g:colors_name = "dracula"

function! s:h(name, ...)
	let l:cmd = "hi " . a:name . " "
	if a:0 == 0
		echom "No highlighting for group " . a:name
	else
		let l:attrs = ["fg", "bg", ""]
		for i in range(a:0)
			if len(a:000[i]) > 0
				if i == 2
					let l:cmd .= " cterm=" . a:000[i] . " "
					let l:cmd .= " gui=" . a:000[i] . " "
				else
					let l:cmd .= "gui" . l:attrs[i] . "=" . a:000[i] . " "
				endif
			endif
		endfor
		execute l:cmd
	endif
endfunction!

call s:h("Normal", s:white, s:black)
call s:h("EndOfBuffer", s:black, s:black)
call s:h("NonText", s:purple, s:black, "bold")

call s:h("Error", s:pink, s:black, "bold")
call s:h("ErrorMsg", s:pink, s:black, "bold")
call s:h("WarningMsg", s:pink, s:black, "bold")
call s:h("Question", s:purple, s:black, "bold")

call s:h("StatusLine", s:visual_gray, s:black, "bold,reverse")
call s:h("StatusLineNC", s:status_gray, s:black)
call s:h("LineNr", s:comment_gray)
call s:h("CursorLineNr", s:white, "", "bold")
call s:h("CursorLine", "", s:cursor_gray, "NONE")
call s:h("Visual", "", s:visual_gray)
call s:h("VertSplit", s:comment_gray, s:black, "bold")

call s:h("Comment", s:comment_gray)
call s:h("PreProc", s:pink)
call s:h("Statement", s:pink)
call s:h("Delimiter", s:purple)
call s:h("MatchParen", "", s:visual_gray, "bold")
call s:h("Type", s:pink)
call s:h("Special", s:orange)
call s:h("String", s:green)
call s:h("Character", s:green)
call s:h("Number", s:purple)
call s:h("Function", s:green)

call s:h("cTypeDecl", s:cyan)
call s:h("cMacro", s:purple)
call s:h("cFunction", s:green)

call s:h("pythonBuiltinType", s:cyan)
call s:h("pythonBuiltinFunction", s:cyan)
call s:h("pythonDecorator", s:green)
call s:h("pythonDecoratorName", s:green)
call s:h("pythonClass", s:cyan)
call s:h("pythonConstant", s:purple)
call s:h("pythonNone", s:purple)
call s:h("pythonBoolean", s:purple)
call s:h("pythonSelf", s:purple)
call s:h("pythonMagicMethods", s:purple)
call s:h("pythonDefineFunction", s:cyan)
call s:h("pythonFunctionCall", s:green)
call s:h("pythonFuncVar", s:orange)
call s:h("pythonSymbolOperator", s:pink)

call s:h("pythonRegexEscapeLetter", s:cyan)
call s:h("pythonRegexEscapeSymbol", s:pink)
call s:h("pythonRegexNumberQuantifier", s:pink)
call s:h("pythonRegexLookAround", s:pink)
call s:h("pythonRegexParens", s:cyan)
call s:h("pythonRegexSymbols", s:pink)
call s:h("pythonRegexSet", s:purple)
