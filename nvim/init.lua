-- Leader key
vim.g.mapleader = ' '

-- Filetype syntax and indent
vim.cmd([[syntax on]])
vim.cmd([[filetype indent plugin on]])

-- Global options
vim.o.runtimepath = vim.o.runtimepath .. ",~/.vim/syntax/,~/.vim/after/"
vim.o.scrolloff = 5
vim.o.incsearch = true
vim.o.inccommand = "nosplit"
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true
vim.o.showmode = false
vim.o.ruler = false
vim.o.fillchars = "fold: ,vert:│"
vim.o.completeopt = "menuone,noinsert,preview"
vim.o.mouse = "a"
vim.o.background = "dark"
vim.o.termguicolors = true

-- Window-local options
vim.wo.cursorline = true
vim.wo.number = true
vim.wo.foldlevel = 99
vim.wo.signcolumn = "no"
vim.wo.conceallevel = 2
vim.wo.concealcursor = "nvci"

-- Buffer-local options
vim.bo.autoindent = true
vim.bo.expandtab = false
vim.bo.shiftwidth = 4
vim.bo.tabstop = 4

-- Mappings
-- Normal Mode
vim.api.nvim_set_keymap('n', '<BS>', "<Cmd>nohl<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'Y', "y$", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '\\', "za", { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>i', [[<Cmd>echo synIDattr(synID(line("."), col("."), 1), "name")<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>j', "<C-w>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>k', "<C-w>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>h', "<C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>l', "<C-w>l", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>w', "<Cmd>w", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>q', "<Cmd>qa!", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>o', "o<Esc>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>O', "O<Esc>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>c', "<Cmd>botr term<CR><C-\\><C-n>10<C-w>-i", { noremap = true, silent = true })

-- Insert Mode
vim.api.nvim_set_keymap('i', 'fd', "<Esc>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-h>', "<C-w>", { noremap = true, silent = true })

vim.api.nvim_set_keymap('i', '<Enter>', [[pumvisible() ? "<C-y>" : "<Enter>"]], { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-n>', [[pumvisible() ? "<Down>" : "<C-n><C-p><C-n>"]], { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-p>', [[pumvisible() ? "<Up>" : "<C-p><C-n><C-p>"]], { noremap = true, expr = true, silent = true })

-- Visual Mode
vim.api.nvim_set_keymap('v', 'fd', "<Esc>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'J', "j", { noremap = true, silent = true })

-- Command Mode
vim.api.nvim_set_keymap('c', '<C-h>', "<C-w>", { noremap = true })
vim.api.nvim_set_keymap('c', '<C-n>', "<Down>", { noremap = true })
vim.api.nvim_set_keymap('c', '<C-p>', "<Up>", { noremap = true })

-- Terminal Mode
vim.api.nvim_set_keymap('t', '<Esc><Esc>', "<C-\\><C-n>", { noremap = true, silent = true })

-- Local Plugins
local utils = {}

utils.plugins_dir = "~/.vim/pack/custom/opt/"

function utils.load_plugin(name)
	vim.o.runtimepath = vim.o.runtimepath .. "," .. utils.plugins_dir .. name
end

utils.load_plugin("duozen.vim")
utils.load_plugin("dark.nvim")
