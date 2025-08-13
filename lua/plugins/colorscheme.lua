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
	"folke/tokyonight.nvim",
	name = "tokyonight",
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			style = "night",
			transparent = true,
			-- styles = {
			-- 	comments = { italic = true },
			-- 	keywords = { italic = false },
			-- 	functions = {},
			-- 	variables = {},
			-- },
			-- on_colors = function(colors)
			-- 	-- Event Horizon accents
			-- 	colors.bg = "#161A1D"
			-- 	colors.bg_dark = "#0f1316"
			-- 	colors.bg_sidebar = colors.bg_dark
			-- 	colors.bg_float = colors.bg
			-- 	colors.fg = "#cfd8e3" -- starlight
			-- 	colors.fg_gutter = "#5c6675"
			-- 	colors.hint = "#4a6b8a" -- nebula blue
			-- 	colors.info = "#5a7ea6"
			-- 	colors.warning = "#c98452" -- copper
			-- 	colors.error = "#d07a5a"
			-- 	colors.border = "#2a2f38"
			-- 	colors.comment = "#6b7280"
			-- end,
			-- on_highlights = function(hl, c)
			-- 	hl.Normal = { fg = c.fg, bg = "NONE" }
			-- 	hl.NormalFloat = { fg = c.fg, bg = "NONE" }
			-- 	hl.FloatBorder = { fg = c.border, bg = "NONE" }
			-- 	hl.WinSeparator = { fg = c.border }
			-- 	hl.LineNr = { fg = c.fg_gutter }
			-- 	hl.CursorLine = { bg = "NONE" }
			-- 	hl.CursorLineNr = { fg = c.warning, bold = true }
			-- 	hl.Visual = { bg = "#1a1f26" }
			-- 	hl.Search = { bg = "#2a1d14", fg = c.warning }
			-- 	hl.IncSearch = { bg = "#3a281c", fg = c.warning, bold = true }
			-- 	-- Telescope
			-- 	hl.TelescopeNormal = { bg = "NONE", fg = c.fg }
			-- 	hl.TelescopeBorder = { fg = c.border, bg = "NONE" }
			-- 	hl.TelescopeSelection = { bg = "#12151b" }
			-- 	-- Diagnostics
			-- 	hl.DiagnosticHint = { fg = c.hint }
			-- 	hl.DiagnosticInfo = { fg = c.info }
			-- 	hl.DiagnosticWarn = { fg = c.warning }
			-- 	hl.DiagnosticError = { fg = c.error }
			-- end,
			on_highlights = function(hl)
				hl.CursorLine = { bg = "NONE" }
			end,
		})
		vim.cmd("colorscheme tokyonight")
	end,
}
