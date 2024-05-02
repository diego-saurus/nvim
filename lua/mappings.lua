require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set
local base46 = require("base46")
local telescope = require("telescope.builtin")
local bufline = require("nvchad.tabufline")

map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<leader>fm", function()
	require("conform").format()
end, { desc = "File Format with conform" })

map("i", "jj", "<ESC>", { desc = "Escape insert mode" })
map("i", "<C-h>", "<BS>", {})
map("i", "<C-f>", "<Right>", {})
map("i", "<C-b>", "<Left>", {})

map("n", "<C-h>", function()
	bufline.prev()
end)
map("n", "<C-l>", function()
	bufline.next()
end)

map("n", "<C-p>", telescope.find_files, {})
map("n", "<C-c>", function()
	vim.api.nvim_command("bd")
end, {})
map("n", "<leader>tp", base46.toggle_transparency)
map("n", "<leader>fc", function()
	vim.lsp.buf.code_action({
		apply = true,
		context = {
			only = { "source.removeUnused.ts" },
			diagnostics = {},
		},
	})
end)
