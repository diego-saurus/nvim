local ft = require("flutter-tools")

local map = vim.keymap.set

map("n", "<leader>fl", ":Telescope flutter commands <cr>", {})

ft.setup({
	ui = {
		border = "rounded",
	},
	dev_log = {
		enabled = true,
		open_cmd = "tabnew",
	},
})
