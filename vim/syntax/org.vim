syntax match orgPreProc /\v^\s*#\+.*/
hi def link orgPreProc Comment

syntax match orgWhiteSpace /\v(^\**)@<=\*(\**\*\s)@=/ conceal cchar= 

" Requires a nerd font
if get(g:, "org_bullet_icons")
	syntax match orgBullet1 /\v(^\s*(\*{4})*)@<=\*\s@=/ conceal cchar= nextgroup=orgContent1
	syntax match orgBullet2 /\v(^\s*(\*{4})*\*{1})@<=\*\s@=/ conceal cchar= nextgroup=orgContent2
	syntax match orgBullet3 /\v(^\s*(\*{4})*\*{2})@<=\*\s@=/ conceal cchar=﯂ nextgroup=orgContent3
	syntax match orgBullet4 /\v(^\s*(\*{4})*\*{3})@<=\*\s@=/ conceal cchar=ﰉ nextgroup=orgContent4
else
	syntax match orgBullet1 /\v(^\s*(\*{4})*)@<=\*\s@=/ conceal cchar=◉ nextgroup=orgContent1
	syntax match orgBullet2 /\v(^\s*(\*{4})*\*{1})@<=\*\s@=/ conceal cchar=○ nextgroup=orgContent2
	syntax match orgBullet3 /\v(^\s*(\*{4})*\*{2})@<=\*\s@=/ conceal cchar=✸ nextgroup=orgContent3
	syntax match orgBullet4 /\v(^\s*(\*{4})*\*{3})@<=\*\s@=/ conceal cchar=◆ nextgroup=orgContent4
endif

syntax match orgContent1 /.*/ contained contains=orgTodo,orgDone,orgCounter
syntax match orgContent2 /.*/ contained contains=orgTodo,orgDone,orgCounter
syntax match orgContent3 /.*/ contained contains=orgTodo,orgDone,orgCounter
syntax match orgContent4 /.*/ contained contains=orgTodo,orgDone,orgCounter

hi def link orgContent1 Function
hi def link orgContent2 Type
hi def link orgContent3 Identifier
hi def link orgContent4 String

syntax keyword orgTodo Todo TODO
syntax keyword orgDone Done DONE

hi def link orgTodo Error
hi def link orgDone Question

syntax match orgCheckboxEmpty /\v(-\s*)@<=\[\s*]/
syntax match orgCheckboxFilled /\v(-\s*)@<=\[\s*\S\s*]/ contains=orgCheckmark
hi def link orgCheckboxEmpty orgCheckbox
hi def link orgCheckboxFilled orgCheckbox
syntax match orgCheckmark /\v(-\s*\[\s*)@<=\S(\s*\])@=/

syntax keyword orgClosed CLOSED Closed nextgroup=orgClosedColon
syntax match orgClosedColon /\v(\cclosed)@<=:/ nextgroup=orgClosedDate

hi def link orgClosed Question

syntax match orgDate /\v[[<]\d+-\d+-\d+\s+\w+(\s+\d+:\d+(\s*-\s*\d+:\d+)?)?(\s+\+\d+\w+)?[\]>]/
hi def link orgDate Function

syntax match orgCounter /\v\[\d+\/\d+\]/ contained
hi def link orgCounter Function

syntax match orgLink /\v\[\[.+\](\[.+\])?\]/
syntax match orgLinkSource /\v(\[\[)@<=[^[\]]+\]@=/ containedin=orgLink contained
syntax match orgLinkSource /\vhttp(s)?:\/\/([^ [\]]+)?/
syntax match orgLinkDescription /\v(\[@<!\[)@<=[^[\]]+(\]\])@=/ containedin=orgLink contained

syntax region orgBold start="\*\S" end="\*\S"    matchgroup=orgBoldEnds concealends oneline contains=orgBullet4,orgBullet3,orgBullet2,orgBullet1,orgWhiteSpace
syntax region orgItalic start="\/\S" end="\/\S"  matchgroup=orgItalicEnds concealends oneline contains=orgLink
syntax region orgUnderline start="_\S" end="_\S" matchgroup=orgUnderlineEnds concealends oneline
syntax region orgVerbatim start="=\S" end="=\S"  matchgroup=orgVerbatimEnds oneline
syntax region orgStrike start="+\S" end="+\S"    matchgroup=orgStrikeEnds oneline
syntax region orgCode start="\~\S" end="\~\S"    matchgroup=orgCodeEnds oneline
