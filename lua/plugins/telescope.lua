return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim", "folke/todo-comments.nvim" },
	keys = {
		{
			"<leader>ff",
			function()
				require("telescope.builtin").find_files()
			end,
			desc = "Telescope: Find files",
		},
		{
			"<leader>ft",
			"<CMD>TodoTelescope<CR>",
			desc = "Telescope: Find todo",
		},
		{
			"<leader>fw",
			function()
				require("telescope.builtin").grep_string()
			end,
			desc = "Telescope: Find word",
		},

		{
			"<leader>fg",
			function()
				require("telescope.builtin").live_grep()
			end,
			desc = "Telescope: Live grep",
		},
		{
			"<leader>fb",
			function()
				require("telescope.builtin").buffers()
			end,
			desc = "Telescope: Find buffers",
		},
		{
			"<leader>fr",
			function()
				require("telescope.builtin").oldfiles()
			end,
			desc = "Telescope: Find recent files",
		},
		{
			"<leader>fk",
			function()
				require("telescope.builtin").keymaps()
			end,
			desc = "Telescope: Find keymaps",
		},
		{
			"<leader>fh",
			function()
				require("telescope.builtin").help_tags()
			end,
			desc = "Telescope: Find help",
		},

		-- For finding directories and opening with oil
		{
			"<leader>fd",
			function()
				local function find_directories()
					require("telescope.builtin").find_files({
						prompt_title = "Directories",
						find_command = { "fd", "--type", "d", "--hidden", "--exclude", ".git", "--max-depth", "5" },
						previewer = false,
						attach_mappings = function(prompt_bufnr, map)
							local actions = require("telescope.actions")

							actions.select_default:replace(function()
								actions.close(prompt_bufnr)
								local selection = require("telescope.actions.state").get_selected_entry()
								if selection and selection.value then
									require("oil").open(selection.value)
								end
							end)

							local function open_in_vsplit()
								actions.close(prompt_bufnr)
								local selection = require("telescope.actions.state").get_selected_entry()
								if selection and selection.value then
									vim.cmd("vsplit")
									require("oil").open(selection.value)
								end
							end
							map("i", "<C-v>", open_in_vsplit)
							map("n", "<C-v>", open_in_vsplit)

							local function open_in_split()
								actions.close(prompt_bufnr)
								local selection = require("telescope.actions.state").get_selected_entry()
								if selection and selection.value then
									vim.cmd("split")
									require("oil").open(selection.value)
								end
							end
							map("i", "<C-x>", open_in_split)
							map("n", "<C-x>", open_in_split)

							return true
						end,
					})
				end

				vim.keymap.set("n", "<leader>fd", find_directories, { desc = "Find directories" })
			end,
			desc = "Telescope: Find directories",
		},
	},
}
