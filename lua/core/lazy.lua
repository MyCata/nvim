local path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(path) then
	local repo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=block:none", "--branch=stable", repo, path })

	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to install lazyvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit" },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end

vim.opt.rtp:prepend(path)

vim.g.mapleader = " "

require("lazy").setup({
	spec = { import = "plugins" },
	change_detection = {
		enabled = true,
		notify = false,
	},
})
