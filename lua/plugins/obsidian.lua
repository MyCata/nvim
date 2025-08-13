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
	},
}
