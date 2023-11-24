vim.cmd.sign("define cursorsign text=▋")

vim.api.nvim_create_augroup("CursorSign", {})

vim.api.nvim_create_autocmd({ "CursorMoved", "CUrsorMovedI" }, {
  group = "CursorSign",
  pattern = { "*" },
  callback = function()
    local file = vim.fn.expand("%:p")
    vim.w.cursor_row_now = vim.fn.getcurpos(vim.fn.win_getid())[2]
    if vim.w.cursor_row_prev == nil then
      vim.w.cursor_row_prev = vim.w.cursor_row_now
      vim.cmd.sign(string.format("place 31415 line=%d name=cursorsign file=%s", vim.w.cursor_row_now, file))
    end

    if vim.w.cursor_row_now ~= vim.w.cursor_row_prev then
      vim.cmd.sign(string.format("unplace 31415 file=%s", file))
      vim.cmd.sign(string.format("place 31415 line=%d name=cursorsign file=%s", vim.w.cursor_row_now, file))
    end
    vim.w.cursor_row_prev = vim.w.cursor_row_now
  end,
})
