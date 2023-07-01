local function map(mode, lhs, rhs)
	vim.keymap.set(mode, lhs, rhs, { silent = true })
end

-- map <leader> = the space key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.whichwrap = "b,s,h,l,[,],<,>,~"

-- nop to space and enter
map("n", "<space>", "<nop>")
map("n", "<enter>", "<nop>")

map("n", "<ESC><ESC>", "<CMD>noh<CR><ESC>")
-- Save
map("n", "<leader>w", "<CMD>w<CR>")

map("n", "<leader>l", "$")
map("n", "<leader>h", "^")

-- Exit insert mode
map("i", "jk", "<ESC>")

map("n", ";;", ";")
map("n", ";", ":")

-- NeoTree
map("n", "<leader>e", "<CMD>Neotree toggle<CR>")
map("n", "<leader>o", "<CMD>Neotree focus<CR>")

-- Buffer
map("n", "<leader>n", "<CMD>bn<CR>")
map("n", "<leader>p", "<CMD>bp<CR>")
map("n", "<leader>bd", "<CMD>bd<CR>")

-- Alpha
map("n", "<leader>a", "<CMD>Alpha<CR>")
