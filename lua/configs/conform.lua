local options = {
	lsp_fallback = true,

	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		typescriptreact = { "prettier" },
		javascriptreact = { "prettier" },
		scss = { "prettier" },
		css = { "prettier" },
	},
}

require("conform").setup(options)
