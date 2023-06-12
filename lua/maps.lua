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

-- NeoTree
map("n", "<leader>e", "<CMD>Neotree toggle<CR>")
map("n", "<leader>o", "<CMD>Neotree focus<CR>")

-- Buffer
map("n", "<leader>bn", "<CMD>TablineBufferNext<CR>")
map("n", "<leader>bp", "<CMD>TablineBufferPrevious<CR>")

-- Terminal
map("n", "<leader>tt","<CMD>ToggleTerm<CR>")

-- Alpha
map("n", "<leader>a","<CMD>Alpha<CR>")
