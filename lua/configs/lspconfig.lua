local configs = require("nvchad.configs.lspconfig")

local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities

local lspconfig = require("lspconfig")
local servers = { "cssls", "tailwindcss", "eslint", "jdtls", "html", "volar" }

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_init = on_init,
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

local util = require("lspconfig.util")
local function get_typescript_server_path(root_dir)
	local global_ts = "/Users/diegosaurus/.nvm/versions/node/v20.18.1/lib/node_modules/typescript/lib"
	local found_ts = ""
	local function check_dir(path)
		found_ts = util.path.join(path, "node_modules", "typescript", "lib")
		if util.path.exists(found_ts) then
			return path
		end
	end
	if util.search_ancestors(root_dir, check_dir) then
		return found_ts
	else
		return global_ts
	end
end

require("lspconfig").volar.setup({
	on_new_config = function(new_config, new_root_dir)
		new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
	end,
})

lspconfig.ts_ls.setup({

	init_options = {
		plugins = {
			{
				name = "@vue/typescript-plugin",
				location = "/Users/diegosaurus/.nvm/versions/node/v20.18.1/lib/node_modules/@vue/typescript-plugin",
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
