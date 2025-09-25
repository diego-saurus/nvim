local prettier = { "prettier" }

local options = {
	lsp_fallback = true,

	formatters = {
		dart_format = {
			command = "dart",
			args = { "format", "$FILENAME" },
		},
	},

	formatters_by_ft = {
		lua = { "stylua" },
		dart = { "dart_format" },
		javascript = prettier,
		typescript = prettier,
		typescriptreact = prettier,
		javascriptreact = prettier,
		scss = prettier,
		css = prettier,
		html = prettier,
		vue = prettier,
		yaml = prettier,
	},
}

require("conform").setup(options)
