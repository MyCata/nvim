local map = vim.keymap.set

-- Yanking stuff
map({ "n", "v" }, "<leader>y", '"+y', { desc = "Copy to system clipboard" })
map("n", "<leader>Y", function()
	local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
	local content = table.concat(lines, "\n")
	vim.fn.setreg("+", content)
end, { desc = "Copy entire file to system clipboard" })

-- Completions stuff
map("i", "<C-Space>", function()
	vim.lsp.completion.get()
end)
