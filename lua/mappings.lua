require("nvchad.mappings")
local builtin = require("telescope.builtin")
local theme = require("telescope.themes")

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<leader>fm", function()
	require("conform").format()
end, { desc = "File Format with conform" })

map("i", "jj", "<ESC>", { desc = "Escape insert mode" })
map("i", "<C-h>", "<BS>", {})
map("i", "<C-f>", "<Right>", {})
map("i", "<C-b>", "<Left>", {})

map("i", "<C-j>", 'copilot#Accept("\\<CR>")', {
	expr = true,
	replace_keycodes = false,
	desc = "Accept Copilot Suggestions",
})

map("n", "<C-h>", function()
	require("nvchad.tabufline").prev()
end, { desc = "Previous buffer" })
map("n", "<C-l>", function()
	require("nvchad.tabufline").next()
end, { desc = "Next buffer" })

-- TELESCOPE
map("n", "<leader>fl", ":Telescope flutter commands <cr>", {})

map("n", "<leader>fr", function()
	builtin.lsp_references(theme.get_ivy())
end, { desc = "Lists LSP references for word under the cursor" })

map("n", "<leader>dd", function()
	builtin.diagnostics(theme.get_ivy())
end, { desc = "Lists Diagnostics for all open buffers or a specific buffer" })

map("n", "gd", function()
	builtin.lsp_type_definitions(theme.get_ivy())
end, {
	desc = "Goto the definition of the type of the word under the cursor, if there's only one, otherwise show all options in Telescope",
})

map("n", "<leader>ff", builtin.resume, { desc = "Lists the results incl. multi-selections of the previous picker" })
map("n", "<leader>fo", builtin.lsp_document_symbols, { desc = "Lists LSP document symbols in the current buffer" })
map("n", "<C-p>", builtin.find_files, { desc = "Lists files in your current working directory, respects .gitignore" })

-- END

map("n", "<C-c>", ":Bdelete<CR>", { silent = true, desc = "Close buffer safely" })
map("n", "<leader>tp", require("base46").toggle_transparency, { desc = "Toggle toggle_transparency" })

map("n", "<leader>fc", function()
	vim.lsp.buf.code_action({
		context = {
			only = { "source.organizeImports" },
			diagnostics = {},
		},
		apply = true,
	})
end, { desc = "Organize imports & remove unused" })

map("n", "]d", vim.diagnostic.get_next, { desc = "Next Diagnostic" })
map("n", "[d", vim.diagnostic.get_prev, { desc = "Previous Diagnostic" })
map("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
map("n", "<leader>ca", function()
	vim.lsp.buf.code_action()
end, { desc = "Code actions using the default lsp UI" })

map("x", "<leader>ca", function()
	vim.lsp.buf.code_action()
end, { desc = "Open code actions for the selected visual range" })
