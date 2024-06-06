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
end)
map("n", "<C-l>", function()
	require("nvchad.tabufline").next()
end)

map("n", "<C-p>", ":Telescope find_files <cr>", {})
map("n", "<C-c>", function()
	vim.api.nvim_command("bd")
end, {})
map("n", "<leader>tp", require("base46").toggle_transparency)
map("n", "<leader>fc", function()
	vim.lsp.buf.code_action({
		apply = true,
		context = {
			only = { "source.removeUnused.ts" },
			diagnostics = {},
		},
	})
end)

map("n", "]d", vim.diagnostic.goto_next, {})
map("n", "[d", vim.diagnostic.goto_prev, {})
map("n", "K", vim.lsp.buf.hover, {})
map("n", "<leader>gr", require("telescope.builtin").lsp_references, {})
