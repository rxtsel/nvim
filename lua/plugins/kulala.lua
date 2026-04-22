require("kulala").setup({
	global_keymaps = false,
	global_keymaps_prefix = "<leader>R",
	kulala_keymaps_prefix = "",
})

vim.keymap.set("n", "<leader>s", function()
	require("kulala").run()
end, { desc = "Send request" })
