local o = vim.o
vim.opt.termguicolors = true
vim.opt.pumblend = 0
vim.opt.laststatus = 3
-- editor options
-- Environment options
o.T_Co = 256
o.ambiwidth = "single"
o.encoding = "UTF-8"
o.history = 5000
o.swapfile = false
o.backup = false
o.clipboard = "unnamedplus"
o.virtualedit = "onemore"
o.updatetime = 300
o.hidden = true
o.signcolumn = "yes"

-- UI
o.number = true
o.numberwidth = 4
o.relativenumber = true
o.ruler = true
o.cursorline = true
o.showmatch = true
o.matchtime = 1
o.showmode = false
o.pumheight = 10
vim.cmd([[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
augroup END
]])

o.inccommand = "split"
o.splitbelow = "splitright"

-- Indent
o.autoindent = true
o.smartindent = true
o.expandtab = true
o.softtabstop = 4
o.shiftwidth = 4
o.tabstop = 4

-- Command
o.wildmenu = true
o.showcmd = true
o.showmatch = true

-- Searching
o.incsearch = true
o.hlsearch = true
o.ignorecase = true
o.smartcase = true

-- Diagnostic
vim.diagnostic.config({
  virtual_text = false,
})

-- Folding
o.foldmethod = "indent"
o.foldlevelstart = 100
