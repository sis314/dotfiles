local o = vim.o

vim.opt.pumblend = 20
vim.opt.laststatus = 3
-- editor options
-- Environment options
o.T_Co = 256
o.ambiwidth = 'single'
o.encoding = "UTF-8"
o.history = 5000
o.swapfile = false
o.backup = false
o.clipboard = "unnamedplus"
o.virtualedit = 'onemore'
o.updatetime = 300
o.hidden = true
o.signcolumn = "yes"

-- UI
o.syntax = on
o.number = true
o.numberwidth = 4
o.relativenumber = true
o.ruler = true
o.cursorline = true
o.showmatch = true
o.matchtime = 1
o.showmode = false
o.pumheight = 8
o.pumblend = 20
o.winblend = 0
o.termguicolors = true

o.inccommand = "split"
o.splitbelow = "splitright"

-- Indent
o.autoindent = true
o.smartindent = true
o.expandtab = true
o.softtabstop = 2
o.shiftwidth = 2
o.tabstop = 2

-- Command
o.wildmenu = true
o.showcmd = true
o.showmatch = true

-- Searching
o.incsearch = true
o.hlsearch = true
o.ignorecase = true
o.smartcase = true

