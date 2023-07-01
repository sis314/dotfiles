vim.opt.title = false
vim.api.nvim_exec("language en_US", true)

vim.g.mapleader = " "
if vim.g.neovide then
  vim.g.neovide_cursor_animation_length = 0
  vim.o.guifont = "IosevkaCustom Nerd Font Mono:h15"
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
local plugins = require("plugins")
require("lazy").setup(plugins)

require("settings")
require("maps")
require("scripts.script")
vim.cmd("colorscheme onenord")
