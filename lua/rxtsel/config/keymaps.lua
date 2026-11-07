vim.keymap.set({ "n", "x" }, "x", '"_x', { desc = "Delete without copying" })
vim.keymap.set({ "n", "x" }, "<leader>d", '"_d', { desc = "Delete without copying" })
vim.keymap.set({ "n", "x" }, "<leader>c", '"_c', { desc = "Change without copying" })
vim.keymap.set({ "n", "x" }, "<leader>p", '"0p', { desc = "Paste last yank" })
vim.keymap.set("n", "dw", '"_db', { desc = "Delete word backwards without copying" })

vim.keymap.set("n", "+", "<C-a>", { desc = "Increment number" })
vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement number" })
vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Select all" })

vim.keymap.set("n", "te", "<Cmd>tabnew<CR>", { desc = "New tab" })
vim.keymap.set("n", "<Tab>", "<Cmd>tabnext<CR>", { desc = "Next tab" })
vim.keymap.set("n", "<S-Tab>", "<Cmd>tabprevious<CR>", { desc = "Previous tab" })

vim.keymap.set("n", "ss", "<Cmd>split<CR>", { desc = "Split below" })
vim.keymap.set("n", "sv", "<Cmd>vsplit<CR>", { desc = "Split right" })
vim.keymap.set("n", "sh", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "sj", "<C-w>j", { desc = "Go to lower window" })
vim.keymap.set("n", "sk", "<C-w>k", { desc = "Go to upper window" })
vim.keymap.set("n", "sl", "<C-w>l", { desc = "Go to right window" })

vim.keymap.set("n", "<C-m>", "<C-i>", { desc = "Jump forward" })
vim.keymap.set("n", "<C-j>", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Next diagnostic" })
vim.keymap.set("n", "<leader>q", "<Cmd>quit<CR>", { desc = "Quit window" })
vim.keymap.set({ "n", "i", "x" }, "<C-s>", "<Cmd>write<CR>", { desc = "Save buffer" })
vim.keymap.set("n", "<leader>o", "o<Esc>^Da", { desc = "Open line below without comment" })
vim.keymap.set("n", "<leader>O", "O<Esc>^Da", { desc = "Open line above without comment" })

vim.keymap.set("n", "<leader>bd", function()
	for _, buffer in ipairs(vim.fn.getbufinfo({ buflisted = 1 })) do
		if #buffer.windows == 0 and buffer.changed == 0 then
			vim.api.nvim_buf_delete(buffer.bufnr, {})
		end
	end
end, { desc = "Close unmodified hidden buffers" })
