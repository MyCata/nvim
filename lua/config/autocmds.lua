local autocmd = vim.api.nvim_create_autocmd

-- Highlights yanked
autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Makes help windows auto go to right instead of small window below
autocmd("BufWinEnter", {
	pattern = "*",
	callback = function()
		if vim.bo.filetype == "help" then
			vim.cmd("wincmd L") -- Move window to the far right
		end
	end,
})

vim.cmd([[
  " Fix accidental capitals on the command-line
  cnoreabbrev <expr> W    (getcmdtype() ==# ':' ? 'w'    : 'W')
  cnoreabbrev <expr> Q    (getcmdtype() ==# ':' ? 'q'    : 'Q')
  cnoreabbrev <expr> Wq   (getcmdtype() ==# ':' ? 'wq'   : 'Wq')
  cnoreabbrev <expr> Wqa  (getcmdtype() ==# ':' ? 'wqa'  : 'Wqa')
]])
