local o = vim.o
vim.opt.pumblend = 0
vim.opt.laststatus = 3
o.T_Co = 256
o.encoding = "UTF-8"
o.history = 5000
o.swapfile = false
o.backup = false
o.clipboard = "unnamedplus"
o.virtualedit = "onemore"
o.updatetime = 300
o.hidden = true

o.cursorline = true
o.showmatch = true
o.matchtime = 1
o.showmode = false

o.inccommand = "split"
o.splitbelow = "splitright"

o.autoindent = true
o.smartindent = true
o.expandtab = true
o.softtabstop = 4
o.shiftwidth = 4
o.tabstop = 4

o.wildmenu = true
o.showcmd = true
o.showmatch = true

o.incsearch = true
o.hlsearch = true
o.ignorecase = true
o.smartcase = true

o.foldmethod = "indent"
o.foldlevelstart = 100
