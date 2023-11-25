local function map(mode, lhs, rhs)
  vim.keymap.set(mode, lhs, rhs, { silent = true })
end
-- map <leader> = the space key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.whichwrap = "b,s,h,l,[,],<,>,~"

map("i", "jk", "<ESC>")

-- nop to space and enter
map("n", "<space>", "<nop>")
map("n", "<enter>", "<nop>")
map("v", "<space>", "<nop>")
map("v", "<enter>", "<nop>")

map("n", "<ESC><ESC>", "<CMD>noh<CR><ESC>")
map("n", "<C-l>", ":<C-u>noh<CR><C-l>")
-- Save
map("n", "<leader>w", "<CMD>w<CR>")

map("n", "<leader>l", "$")
map("n", "<leader>h", "^")
map("v", "<leader>l", "$")
map("v", "<leader>h", "^")

map("n", "<leader>n", "<CMD>bn<CR>")
map("n", "<leader>p", "<CMD>bp<CR>")
map("n", "<leader>bd", "<CMD>BufDel<CR>")

--LSP
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
map("n", "fm", "<cmd>lua vim.lsp.buf.formatting()<CR>")
map("n", "rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
map("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>")
map("n", "D", "<cmd>lua vim.diagnostic.open_float()<CR>")
