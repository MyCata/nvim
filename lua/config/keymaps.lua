local map = vim.keymap.set

map({ "n", "v" }, "<leader>y", '"+y', { desc = "Copy to system clipboard" })

map("n", "<C-y>", function()
	vim.cmd("normal! ggVG")
	vim.cmd('normal! "+y')
end, { desc = "Copy entire file to system clipboard" })

map("i", "<C-Space>", function()
	vim.lsp.completion.get()
end)

map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

map("n", "x", '"_x', { desc = "Delete char (no yank)" })

map("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })
map("n", "n", "nzzzv", { desc = "Next search (centered)" })
map("n", "N", "Nzzzv", { desc = "Previous search (centered)" })

map("v", "p", '"_dP', { desc = "Paste (no yank)" })
