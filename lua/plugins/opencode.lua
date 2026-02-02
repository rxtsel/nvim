vim.g.opencode_opts = {
	providers = {
		terminal = {
			cmd = "ghostty",
		},
	},
}

vim.o.autoread = true

local opencode = require("opencode")

vim.keymap.set({ "n", "x" }, "<C-a>", function()
	opencode.ask("@this: ", { submit = true })
end, { desc = "Ask opencode…" })

vim.keymap.set({ "n", "x" }, "<C-x>", function()
	opencode.select()
end, { desc = "Execute opencode action…" })

vim.keymap.set({ "n", "t" }, "<leader>aa", function()
	opencode.toggle()
end, { desc = "Toggle opencode" })

vim.keymap.set({ "n", "x" }, "go", function()
	return opencode.operator("@this ")
end, { desc = "Add range to opencode", expr = true })

vim.keymap.set("n", "goo", function()
	return opencode.operator("@this ") .. "_"
end, { desc = "Add line to opencode", expr = true })

vim.keymap.set("n", "<S-C-u>", function()
	opencode.command("session.half.page.up")
end, { desc = "Scroll opencode up" })

vim.keymap.set("n", "<S-C-d>", function()
	opencode.command("session.half.page.down")
end, { desc = "Scroll opencode down" })
