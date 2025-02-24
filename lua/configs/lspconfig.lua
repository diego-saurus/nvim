local configs = require("nvchad.configs.lspconfig")
local lspconfig = require("lspconfig")

local servers = {
	cssls = {},
	eslint = {},
	html = {},
	volar = {},
	ts_ls = {
		init_options = {
			plugins = {
				{
					name = "@vue/typescript-plugin",
					location = require("mason-registry").get_package("vue-language-server"):get_install_path()
						.. "/node_modules/@vue/language-server",
					languages = { "vue" },
				},
			},
		},
		filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
	},
	tailwindcss = {
		settings = {
			tailwindCSS = {
				experimental = {
					classRegex = {
						{ "clsx\\(([^)]*)\\)" }, -- Recognizes `clsx('bg-blue-500 text-white')`
						{ "cn\\(([^)]*)\\)" }, -- Recognizes `cn('bg-blue-500 text-white')`
					},
				},
			},
		},
	},
}

for name, opts in pairs(servers) do
	opts.on_init = configs.on_init
	opts.on_attach = configs.on_attach
	opts.capabilities = configs.capabilities

	lspconfig[name].setup(opts)
end
