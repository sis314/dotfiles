local status, telescope = pcall(require, "telescope.builtin")
if status then
	-- telescope
	vim.keymap.set("n", "<leader>ff", telescope.find_files, {silent = true})
	vim.keymap.set("n", "<leader>fg", telescope.live_grep, {silent = true})
	vim.keymap.set("n", "<leader>fb", telescope.buffers, {silent = true})
	vim.keymap.set("n", "<leader>fh", telescope.help_tags, {silent = true})
	vim.keymap.set("n", "<leader>fs", telescope.git_status, {silent = true})
	vim.keymap.set("n", "<leader>fc", telescope.git_commits, {silent = true})
else
	print("Telescope not found")
end

