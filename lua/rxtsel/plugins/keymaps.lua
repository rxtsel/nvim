vim.keymap.set("n", "]]", function()
	Snacks.words.jump(vim.v.count1)
end, { desc = "Next reference" })

vim.keymap.set("n", "[[", function()
	Snacks.words.jump(-vim.v.count1)
end, { desc = "Previous reference" })

vim.keymap.set("n", ";f", function()
	Snacks.picker.files({ hidden = true })
end, { desc = "Find files (including hidden)" })

vim.keymap.set("n", ";r", function()
	Snacks.picker.grep({ hidden = true })
end, { desc = "Live grep (including hidden)" })

vim.keymap.set("n", ";;", function()
	Snacks.picker.resume()
end, { desc = "Resume last picker" })

vim.keymap.set("n", "\\\\", function()
	Snacks.picker.buffers({ jump = { reuse_win = true } })
end, { desc = "Find open buffers" })

vim.keymap.set("n", ";e", function()
	Snacks.picker.diagnostics()
end, { desc = "Find diagnostics" })

vim.keymap.set("n", ";n", function()
	Snacks.picker.notifications()
end, { desc = "Notification history" })

vim.keymap.set("n", ";h", function()
	Snacks.picker.git_diff({ group = false })
end, { desc = "Find Git hunks" })
