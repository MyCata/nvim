return {
	"obsidian-nvim/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	---@module 'obsidian'
	---@type obsidian.config
	opts = {
		workspaces = {
			{
				name = "notes",
				path = "~/Dropbox/personal/notes",
			},
		},
		completion = {
			-- Enables completion using nvim_cmp
			nvim_cmp = false,
			-- Enables completion using blink.cmp
			blink = true,
		},
		legacy_commands = false,
		ui = {
			enable = false,
		},
		note_id_func = function(title)
			local suffix = ""

			if title ~= nil then
				suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
			else
				for _ = 1, 4 do
					suffix = suffix .. string.char(math.random(65, 90))
				end
			end

			return suffix
		end,
	},
	-- keys = {
	-- 	{ "<leader>on", "<cmd>Obsidian new<cr>", desc = "Obsidian: new note" },
	-- },
}
