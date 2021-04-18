local dark = {}

local Color = require("color")

-- Colors from: https://github.com/novakne/kosmikoa.nvim
local colors = {
	black = Color.new(0x23222b):bright(10),
	line_nr = Color.new(0x59566d),
	status_fg = Color.new(0xbfbdcb),
	status_bg = Color.new(0x474557),
	comment = Color.new(0x6b6883):bright(7),
	white = Color.new(0xeae9ee):bright(-10),
	pink = Color.new(0xfc65b0),
	yellow = Color.new(0xe8ec77),
	blue = Color.new(0x57bbf4),
	statement = Color.new(0x9acaea),
	green = Color.new(0x62e89e),
	orange = Color.new(0xf08c89),
	magenta = Color.new(0xbe8fde),
	cyan = Color.new(0x00cfd0),
}

dark.colors = colors

dark.groups = {
	Normal = {fg = colors.white, bg = colors.black},
	EndOfBuffer = {fg = colors.black, bg = colors.black},

	MatchParen = {bg = colors.black:bright(16)},
	Visual = {bg = colors.black:bright(16)},

	IncSearch = {fg = colors.black, bg = colors.blue},
	Search = {fg = colors.black, bg = colors.blue},
	
	Cursor = {fg = colors.black, bg = colors.white},
	LineNr = {fg = colors.line_nr},
	CursorLineNr = {fg = colors.blue},
	CursorLine = {bg = colors.black:bright(7)},

	StatusLine = {fg = colors.status_fg, bg = colors.status_bg},
	StatusLineNC = {fg = colors.comment, bg = colors.status_bg:bright(-10)},
	VertSplit = {fg = colors.cyan, bg = colors.black},

	Comment = {fg = colors.comment},
	Function = {fg = colors.yellow, style = "italic"},
	Number = {fg = colors.orange},
	Statement = {fg = colors.blue},
	Label = {fg = colors.yellow:bright(-10)},
	Type = {fg = colors.pink},
	Constant = {fg = colors.pink},
	Operator = {fg = colors.magenta},
	PreProc = {fg = colors.magenta},
	Keyword = {fg = colors.green},
	String = {fg = colors.green},
	Question = {fg = colors.comment, style = "bold"},

	-- [ C ]
	cSymbolOp = {fg = colors.magenta},

	-- [ Lua ]
	luaFunc = {fg = colors.yellow, style = "italic"},
	luaTable = {fg = colors.white},
	luaFunction = {fg = colors.blue},
}

function dark.highlight(name, group)
	local fg = "NONE"
	if group.fg then
		fg = group.fg:color()
	end
	local bg = group.bg or colors.black
	local style = group.style or "NONE"
	local guisp = "NONE"
	if group.guisp then
		guisp = group.guisp:color()
	end
	vim.cmd(string.format("highlight %s guifg=%s guibg=%s gui=%s guisp=%s", name, fg, bg:color(), style, guisp))
end

function dark.setup()
	vim.cmd([[hi clear]])
	if vim.fn.exists("syntax on") then
		vim.cmd([[syntax reset]])
	end
	vim.g.colors_name = "dark"
	for name, group in pairs(dark.groups) do
		dark.highlight(name, group)
	end
end

return dark
