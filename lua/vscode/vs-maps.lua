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
map("v", "<space>", "<nop>")
map("v", "<enter>", "<nop>")

map("n", "<ESC><ESC>", "<CMD>noh<CR><ESC>")
map("n", "<C-l>", ":<C-u>noh<CR><C-l>")
-- Save
map("n", "<leader>w", "<CMD>call VSCodeNotify('workbench.action.files.save')<CR>")

map("n", "<leader>l", "$")
map("n", "<leader>h", "^")
map("v", "<leader>l", "$")
map("v", "<leader>h", "^")

map("n", "<leader>n", "<cmd>call VSCodeNotify('workbench.action.nextEditor')<CR>")
map("n", "<leader>p", "<cmd>call VSCodeNotify('workbench.action.previousEditor')<CR>")
map("n", "<leader>bd", "<cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>")

map("n", "<leader>e", "<cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>")

--LSP
map("n", "K", "<cmd>call VSCodeNotify('editor.action.showHover')<CR>")
map("n", "gd", "<cmd>call VSCodeNotify('editor.action.revealDefinition')<CR>")

map("n", "<leader>ff", "<cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>")
map("n", "<leader>fg", "<cmd>call VSCodeNotify('workbench.action.findInFiles')<CR>")
map("n", "<leader>rn", "<cmd>call VSCodeNotify('editor.action.rename')<CR>")
map("n", "<leader>fm", "<cmd>call VSCodeNotify('editor.action.formatDocument')<CR>")
