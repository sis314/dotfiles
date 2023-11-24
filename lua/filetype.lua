vim.api.nvim_create_autocmd("FileType", {
  pattern = "haskell",
  command = "setlocal shiftwidth=4 tabstop=4",
})
