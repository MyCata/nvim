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
		local copper = "#c98452"
		local starlight = "#cfd8e3"
		local bg = "#0f1316" -- slightly deeper than editor bg
		local dim = "#5c6675"

		require("mini.statusline").setup({
			use_icons = true,
			set_vim_settings = true,
			content = {
				active = function()
					local mode = MiniStatusline.section_mode({ trunc_width = 120 })
					local git = MiniStatusline.section_git({ trunc_width = 75 })
					local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 60 })
					local filename = MiniStatusline.section_filename({ trunc_width = 140 })
					local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
					local location = MiniStatusline.section_location({ trunc_width = 75 })
					return MiniStatusline.combine_groups({
						-- LEFT (no leading pad)
						{ hl = 'MiniStatuslineModeCapsule', strings = { ' ' .. mode .. ' ' } },
						{ hl = 'MiniStatuslineBar', strings = { ' ' } },
						{ hl = 'MiniStatuslineDevinfo', strings = { git, diagnostics } },
						{ hl = 'MiniStatuslineFilename', strings = { filename } },
						-- SPACER
						'%=',
						-- RIGHT
						{ hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
						{ hl = 'MiniStatuslineRightCapsule', strings = { ' ' .. location .. ' ' } },
					})
				end,
				inactive = function()
					return MiniStatusline.combine_groups({
						{ hl = 'MiniStatuslineInactive', strings = { MiniStatusline.section_filename({ trunc_width = 140 }) } },
					})
				end,
			},
		})

		-- Highlight overrides for statusline
		vim.api.nvim_set_hl(0, 'MiniStatuslineBar', { fg = starlight, bg = bg })
		vim.api.nvim_set_hl(0, 'MiniStatuslineModeCapsule', { fg = '#0b0e12', bg = copper, bold = true })
		vim.api.nvim_set_hl(0, 'MiniStatuslineRightCapsule', { fg = '#0b0e12', bg = copper, bold = true })

		vim.api.nvim_set_hl(0, 'MiniStatuslineDevinfo', { fg = starlight, bg = bg })
		vim.api.nvim_set_hl(0, 'MiniStatuslineFilename', { fg = starlight, bg = bg })
		vim.api.nvim_set_hl(0, 'MiniStatuslineFileinfo', { fg = starlight, bg = bg })
		vim.api.nvim_set_hl(0, 'MiniStatuslineInactive', { fg = dim, bg = bg })
	end,
}
