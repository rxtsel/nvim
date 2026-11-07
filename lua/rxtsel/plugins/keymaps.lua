vim.keymap.set("n", "]]", function()
	Snacks.words.jump(vim.v.count1)
end, { desc = "Next reference" })

vim.keymap.set("n", "[[", function()
	Snacks.words.jump(-vim.v.count1)
end, { desc = "Previous reference" })

vim.keymap.set("n", "gd", function()
	Snacks.picker.lsp_definitions()
end, { desc = "Go to definition" })

vim.keymap.set("n", "gD", function()
	Snacks.picker.lsp_declarations()
end, { desc = "Go to declaration" })

vim.keymap.set("n", "gy", function()
	Snacks.picker.lsp_type_definitions()
end, { desc = "Go to type definition" })

vim.keymap.set("n", "gr", function()
	Snacks.picker.lsp_references()
end, { desc = "Find references" })

vim.keymap.set("n", "gI", Rxtsel.lsp.source_definition, { desc = "Go to source definition or implementation" })

vim.keymap.set("n", ";c", function()
	Snacks.picker.lsp_incoming_calls()
end, { desc = "Find incoming calls" })

vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
vim.keymap.set("n", "gK", vim.lsp.buf.signature_help, { desc = "Signature help" })
vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature help" })

vim.keymap.set({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename symbol" })
vim.keymap.set("n", "<leader>cR", function()
	Snacks.rename.rename_file()
end, { desc = "Rename file with import updates" })

vim.keymap.set("n", "<leader>f", function()
	require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "Format buffer" })

vim.keymap.set("n", "<leader>cl", "<Cmd>checkhealth vim.lsp<CR>", { desc = "LSP information" })

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

vim.keymap.set("n", "<leader>gb", function()
	require("gitsigns").blame_line()
end, { desc = "Blame line" })

vim.keymap.set("n", "<leader>gB", function()
	require("gitsigns").blame()
end, { desc = "Blame buffer" })

vim.keymap.set("n", "<leader>go", Rxtsel.git.open_line_revision, { desc = "Open line's file revision in a new tab" })
vim.keymap.set("n", "<leader>gs", Rxtsel.git.toggle_stage_buffer, { desc = "Stage or unstage buffer" })
vim.keymap.set("n", "<leader>gh", function()
	require("gitsigns").stage_hunk()
end, { desc = "Stage or unstage hunk" })

local function open_oil_float()
	require("oil").open_float(nil, { preview = {} })
end

vim.keymap.set("n", "<leader>e", open_oil_float, { desc = "Open Oil with preview" })

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("RxtselOilKeymaps", { clear = true }),
	pattern = "oil",
	callback = function(event)
		vim.keymap.set(
			"n",
			"h",
			require("oil.actions").parent.callback,
			{ buffer = event.buf, desc = "Parent directory" }
		)
		vim.keymap.set("n", "q", function()
			require("oil").close()
		end, { buffer = event.buf, desc = "Close Oil" })
	end,
})
