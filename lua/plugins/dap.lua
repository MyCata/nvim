return {
	-- NOTE: Yes, you can install new plugins here!
	"mfussenegger/nvim-dap",
	-- NOTE: And you can specify dependencies as well
	dependencies = {
		-- Creates a beautiful debugger UI
		"rcarriga/nvim-dap-ui",

		-- Required dependency for nvim-dap-ui
		"nvim-neotest/nvim-nio",

		-- Installs the debug adapters for you
		"mason-org/mason.nvim",
		"jay-babu/mason-nvim-dap.nvim",

		-- Add your own debuggers here
		"leoluz/nvim-dap-go",
		"theHamsta/nvim-dap-virtual-text",
	},
	keys = {
		-- Basic debugging keymaps, feel free to change to your liking!
		{
			"<F5>",
			function()
				require("dap").continue()
			end,
			desc = "Debug: Start/Continue",
		},
		{
			"<F1>",
			function()
				require("dap").step_into()
			end,
			desc = "Debug: Step Into",
		},
		{
			"<F2>",
			function()
				require("dap").step_over()
			end,
			desc = "Debug: Step Over",
		},
		{
			"<F3>",
			function()
				require("dap").step_out()
			end,
			desc = "Debug: Step Out",
		},
		{
			"<leader>b",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "Debug: Toggle Breakpoint",
		},
		{
			"<leader>B",
			function()
				require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end,
			desc = "Debug: Set Breakpoint",
		},
		-- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
		{
			"<F7>",
			function()
				require("dapui").toggle()
			end,
			desc = "Debug: See last session result.",
		},
		{
			"<F10>",
			function()
				require("dap").run_last()
			end,
			desc = "Run Last",
			nowait = true,
			remap = false,
		},
		{
			"<F12>",
			function()
				require("dap").terminate()
			end,
			desc = "Debug: Terminate",
		},
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		-- Strong, visible DAP highlights and signs
		vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#ff2c2c", bg = "NONE", bold = true })
		vim.api.nvim_set_hl(0, "DapBreakpointCondition", { fg = "#ff9f1a", bg = "NONE", bold = true })
		vim.api.nvim_set_hl(0, "DapBreakpointRejected", { fg = "#ff2c2c", bg = "NONE", bold = true, underline = true })
		vim.api.nvim_set_hl(0, "DapLogPoint", { fg = "#00b3ff", bg = "NONE", bold = true })
		vim.api.nvim_set_hl(0, "DapStopped", { fg = "#00ff6a", bg = "NONE", bold = true })
		vim.api.nvim_set_hl(0, "DapStoppedLine", { bg = "#1e2f1e" })
		vim.api.nvim_set_hl(0, "DapBreakpointNumber", { fg = "#ff2c2c", bold = true })
		vim.api.nvim_set_hl(0, "DapStoppedNumber", { fg = "#00ff6a", bold = true })

		vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint", numhl = "DapBreakpointNumber" })
		vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "DapBreakpointCondition", numhl = "DapBreakpointNumber" })
		vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DapBreakpointRejected", numhl = "DapBreakpointNumber" })
		vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped", linehl = "DapStoppedLine", numhl = "DapStoppedNumber" })
		vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DapLogPoint", numhl = "DapBreakpointNumber" })

		require("nvim-dap-virtual-text").setup({})

		require("mason-nvim-dap").setup({
			automatic_installation = false,

			handlers = {},

			ensure_installed = {
				"delve",
			},
		})

		dapui.setup({
			icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
			controls = {
				icons = {
					pause = "⏸",
					play = "▶",
					step_into = "⏎",
					step_over = "⏭",
					step_out = "⏮",
					step_back = "b",
					run_last = "▶▶",
					terminate = "⏹",
					disconnect = "⏏",
				},
			},
		})

		dap.listeners.after.event_initialized["dapui_config"] = dapui.open
		dap.listeners.before.event_terminated["dapui_config"] = dapui.close
		dap.listeners.before.event_exited["dapui_config"] = dapui.close

		require("dap-go").setup({
			delve = {
				detached = vim.fn.has("win32") == 0,
			},
		})

		dap.configurations.cpp = {
			{
				name = "Launch file",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
		}

		dap.configurations.c = dap.configurations.cpp
		dap.configurations.rust = dap.configurations.cpp
	end,
}
