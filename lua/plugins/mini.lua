return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		require("mini.ai").setup()
		-- require("mini.pairs").setup()
		require("mini.surround").setup()
		require("mini.move").setup({
			mappings = {
				left = "<M-Left>",
				right = "<M-Right>",
				down = "<M-Down>",
				up = "<M-Up>",

				line_left = "<M-Left>",
				line_right = "<M-Right>",
				line_down = "<M-Down>",
				line_up = "<M-Up>",
			},
		})
		require("mini.statusline").setup()
	end,
}
