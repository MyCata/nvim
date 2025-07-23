local map = vim.keymap.set

map({"n", "v"}, "<leader>y", '"+y', { desc = "Copy to system clipboard" })
map("n", "<leader>Y", '"+Y', { desc = "Copy line to system clipboard" })
map("n", "<C-y>", function()
	-- Get all lines in the current buffer
	local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
	-- Join them with newlines
	local content = table.concat(lines, "\n")
	-- Copy to system clipboard
	vim.fn.setreg("+", content)
	print("Copied entire file to system clipboard")
end, { desc = "Copy entire file to system clipboard" })

map("i", "<C-Space>", function() 
	vim.lsp.completion.get() 
end)
