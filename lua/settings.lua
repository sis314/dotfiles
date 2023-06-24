local o = vim.o

vim.cmd("autocmd ColorScheme * highlight LineNr ctermbg=1 guibg=#1f1f28")
vim.cmd("autocmd ColorScheme * highlight SignColumn guibg=#1f1f28")
vim.cmd("autocmd ColorScheme * highlight GitSignsAdd guifg=#76946a guibg=#1f1f28")
vim.cmd("autocmd ColorScheme * highlight GitSignsChange guifg=#dca561 guibg=#1f1f28")
vim.cmd("autocmd ColorScheme * highlight GitSignsDelete guifg=#c34043 guibg=#1f1f28")

vim.cmd("autocmd ColorScheme * highlight DiagnosticSignError guifg=#e82424 guibg=#1f1f28")
vim.cmd("autocmd ColorScheme * highlight DiagnosticSignWarn guifg=#ff9e3b guibg=#1f1f28")
vim.cmd("autocmd ColorScheme * highlight DiagnosticSignInfo guifg=#658594 guibg=#1f1f28")
vim.cmd("autocmd ColorScheme * highlight DiagnosticSignHing guifg=#6a9589 guibg=#1f1f28")

vim.opt.pumblend = 20
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
o.pumheight = 8
o.termguicolors = true

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
