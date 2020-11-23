hi clear
if exists("syntax")
	syntax reset
endif

let s:white        = "#f8f8f2"
let s:black        = "#282a36"
let s:status_gray  = "#383a46"
let s:cursor_gray  = "#2e303e"
let s:visual_gray  = "#3c3f52"
let s:search_gray  = "#394b5f"
let s:comment_gray = "#6474a6"
let s:menu_bg      = "#404356"
let s:menu_fg      = "#7282b4"
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
call s:h("StatusLineTerm", s:visual_gray, s:black, "bold,reverse")
call s:h("StatusLineTermNC", s:status_gray, s:black, "reverse")
call s:h("LineNr", s:comment_gray)
call s:h("CursorLineNr", s:white, "", "bold")
call s:h("CursorLine", "", s:cursor_gray, "NONE")
call s:h("Cursor", "NONE", "NONE", "reverse")
call s:h("Visual", "", s:visual_gray)
call s:h("Search", "NONE", s:search_gray, "NONE")
call s:h("VertSplit", s:comment_gray, s:black, "bold")

call s:h("Pmenu", s:menu_fg, s:status_gray)
call s:h("PmenuSel", s:purple, s:menu_bg)
call s:h("PmenuSbar", "", s:visual_gray)
call s:h("PmenuThumb", "", s:comment_gray)

call s:h("Conceal", s:purple, s:black, "NONE")
call s:h("Folded", s:comment_gray, "NONE", "NONE")

call s:h("Comment", s:comment_gray)
call s:h("Directory", s:purple)
call s:h("Identifier", s:purple, "", "NONE")
call s:h("PreProc", s:pink)
call s:h("Statement", s:pink, "", "NONE")
call s:h("Delimiter", s:purple)
call s:h("MatchParen", "", s:visual_gray, "bold")
call s:h("Type", s:pink, "", "NONE")
call s:h("Todo", s:purple, s:black)
call s:h("Special", s:orange)
call s:h("SpecialKey", s:menu_fg)
call s:h("String", s:green)
call s:h("Character", s:green)
call s:h("Number", s:purple)
call s:h("Function", s:green)

call s:h("cTypeDecl", s:cyan)
call s:h("cMacro", s:purple)
call s:h("cSymbolOp", s:pink)
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
call s:h("pythonVariadicType", s:green)
call s:h("pythonRegularType", s:cyan)
call s:h("pythonFuncVar", s:orange)
call s:h("pythonSymbolOperator", s:pink)

call s:h("pythonRegexEscapeLetter", s:cyan)
call s:h("pythonRegexEscapeSymbol", s:pink)
call s:h("pythonRegexNumberQuantifier", s:pink)
call s:h("pythonRegexLookAround", s:pink)
call s:h("pythonRegexParens", s:cyan)
call s:h("pythonRegexSymbols", s:pink)
call s:h("pythonRegexSet", s:purple)

call s:h("htmlTitle", s:white)
call s:h("htmlTag", s:white)
call s:h("htmlTagNumber", s:yellow)
call s:h("htmlEndTag", s:white)
call s:h("htmlArg", s:green)
call s:h("htmlEvent", s:green)
call s:h("htmlEquals", s:pink)

call s:h("javaScriptBraces", s:white)
call s:h("javaScriptIdentifier", s:pink)
call s:h("javaScriptMember", s:cyan)
call s:h("javaScriptMath", s:cyan)
call s:h("javaScriptFunction", s:pink)
call s:h("javaScriptOperatorVar", s:white)
call s:h("javaScriptVar", s:white)
call s:h("javaScriptConstVar", s:white)

call s:h("vimFuncSID", s:cyan)
call s:h("vimFunction", s:cyan)
call s:h("vimUserFunc", s:cyan)
call s:h("vimMapModKey", s:purple)
call s:h("vimNotation", s:purple)
call s:h("vimEnvVar", s:cyan)

call s:h("i3NonSpecialKey", s:yellow)

call s:h("netrwClassify", s:cyan)

call s:h("orgContent1", s:pink)
call s:h("orgContent2", s:purple)
call s:h("orgContent3", s:cyan)
call s:h("orgContent4", s:orange)
call s:h("orgCheckBox", s:orange, "", "bold")
call s:h("orgCheckMark", s:orange, "", "bold")
call s:h("orgClosed", s:yellow)
call s:h("orgClosedColon", s:yellow)
call s:h("orgDate", s:cyan)
call s:h("orgCounter", s:green, s:visual_gray)
call s:h("orgDone", s:green, s:visual_gray, "bold")
call s:h("orgTodo", s:red, s:visual_gray, "bold")
call s:h("orgLink", s:comment_gray)
call s:h("orgLinkSource", s:green, "", "underline")
call s:h("orgLinkDescription", s:purple, "", "bold")
call s:h("orgBold", "", "", "bold")
call s:h("orgItalic", "", "", "italic")
call s:h("orgUnderline", "", "", "underline")
call s:h("orgVerbatim", s:green, "", "italic")
call s:h("orgVerbatimEnds", s:green, "", "italic")
call s:h("orgStrike", s:red, "", "italic")
call s:h("orgStrikeEnds", s:red, "", "italic")
call s:h("orgCode", s:green, "", "italic")
call s:h("orgCodeEnds", s:green, "", "italic")

call s:h("swkHeader", s:cyan, "", "bold")
call s:h("swkMathVariable", s:orange)
call s:h("swkMathOperator", s:cyan)
call s:h("swkBulletPoint", s:cyan)
call s:h("swkBulletSubject", s:purple, "", "bold")
call s:h("swkBulletSubjectSep", s:purple)
call s:h("swkBulletContent", s:orange)

call s:h("popromptMatchCount", s:green)
call s:h("popromptNoMatches", s:red)
