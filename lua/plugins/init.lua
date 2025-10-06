return {
	{
		"stevearc/conform.nvim",
		config = function()
			require("configs.conform")
		end,
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			require("nvchad.configs.lspconfig").defaults()
			require("configs.lspconfig")
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		opts = {
			git = { enable = true },
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				-- defaults
				"vim",
				"lua",
				"vimdoc",
				"printf",

				-- web dev
				"css",
				"javascript",
				"typescript",
				"tsx",

				-- mobile dev
				"dart",
			},
		},
	},

	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"lua-language-server",
				"prettier",
				"stylua",
				"css-lsp",
				"eslint-lsp",
				"typescript-language-server",
			},
		},
	},
	-- {
	-- 	"Exafunction/codeium.nvim",
	-- 	lazy = false,
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"hrsh7th/nvim-cmp",
	-- 	},
	-- 	config = function()
	-- 		require("codeium").setup({})
	-- 	end,
	-- },
	{
		"numToStr/Comment.nvim",
		lazy = false,
		config = function()
			require("Comment").setup()
		end,
	},

	-- {
	-- 	"github/copilot.vim",
	-- 	event = "InsertEnter",
	-- 	config = function()
	-- 		vim.g.copilot_no_tab_map = true
	-- 	end,
	-- },

	{
		"nvim-flutter/flutter-tools.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim", -- optional for vim.ui.select
		},
		ft = "dart",
		config = function()
			require("configs.flutter-tools")
		end,
	},
	{
		"famiu/bufdelete.nvim",
		lazy = false,
	},
}
