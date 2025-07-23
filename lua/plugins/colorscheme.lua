-- return {
-- 	"rebelot/kanagawa.nvim",
-- 	config = function()
-- 		require("kanagawa").setup({
-- 			transparent = true,
-- 			colors = {
-- 				theme = {
-- 					all = {
-- 						ui = {
-- 							bg_gutter = "none",
-- 						},
-- 					},
-- 				},
-- 			},
-- 		})
-- 		vim.cmd("colorscheme kanagawa-wave")
-- 	end,
-- }

return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({

			transparent_background = true,
		})
		vim.cmd("colorscheme catppuccin-mocha")
	end,
}
