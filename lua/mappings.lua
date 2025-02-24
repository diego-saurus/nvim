require("nvchad.mappings")

-- add yours here
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<leader>fm", function()
	require("conform").format()
end, { desc = "File Format with conform" })

map("i", "jj", "<ESC>", { desc = "Escape insert mode" })
map("i", "<C-h>", "<BS>", {})
map("i", "<C-f>", "<Right>", {})
map("i", "<C-b>", "<Left>", {})

map("n", "<C-h>", function()
	require("nvchad.tabufline").prev()
end, { desc = "Previous buffer" })
map("n", "<C-l>", function()
	require("nvchad.tabufline").next()
end, { desc = "Next buffer" })

map("n", "<C-p>", ":Telescope find_files <cr>", {})
map("n", "<C-c>", function()
	vim.api.nvim_command("bd")
end, { desc = "Close Buffer" })
map("n", "<leader>tp", require("base46").toggle_transparency, { desc = "Toggle toggle_transparency" })
map("n", "<leader>fc", function()
	vim.lsp.buf.code_action({
		apply = true,
		context = {
			only = { "source.removeUnused.ts" },
			diagnostics = {},
		},
	})
end, { desc = "Code actions with remove unused" })

map("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
map("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
map("n", "<leader>gr", vim.lsp.buf.hover, { desc = "List References" })
