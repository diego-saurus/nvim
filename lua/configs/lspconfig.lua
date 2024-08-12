local configs = require("nvchad.configs.lspconfig")

local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities

local lspconfig = require("lspconfig")
local servers = { "cssls", "tailwindcss", "eslint", "jdtls", "html" }

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_init = on_init,
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

lspconfig.volar.setup({
	filetypes = { "vue" },
})

lspconfig.tsserver.setup({
	init_options = {
		plugins = {
			{
				name = "@vue/typescript-plugin",
				location = "/home/diegosaurus/.nvm/versions/node/v20.13.1/lib/node_modules/@vue/typescript-plugin",
				languages = { "vue" },
			},
		},
	},
	filetypes = {
		"vue",
		"javascriptreact",
		"typescriptreact",
		"javascript",
		"typescript",
	},
	on_init = on_init,
	on_attach = on_attach,
	capabilities = capabilities,
})
