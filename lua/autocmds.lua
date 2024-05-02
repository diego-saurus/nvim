local auto = vim.api.nvim_create_autocmd
local conform = require("conform")

auto("BufWritePre", {
	pattern = "*",
	callback = function(args)
		conform.format({ bufnr = args.buf })
	end,
})
