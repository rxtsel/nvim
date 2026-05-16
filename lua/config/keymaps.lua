-- Save / quit
vim.keymap.set("n", "<C-s>", "<CMD>w<CR>", { desc = "Save file", silent = true })
vim.keymap.set("n", "<leader>q", "<CMD>q<CR>", { desc = "Quit neovim", silent = true })

-- File explorer
vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Toggle file explorer", silent = true })
vim.keymap.set("n", ";f", "<CMD>Pick files<CR>", { desc = "Find files", silent = true })
vim.keymap.set("n", ";r", "<CMD>Pick grep<CR>", { desc = "Find grep", silent = true })
vim.keymap.set("n", ";b", "<CMD>Pick buffers<CR>", { desc = "Find buffers", silent = true })
vim.keymap.set("n", ";h", "<CMD>Pick help<CR>", { desc = "Find help", silent = true })

-- Format
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "Format with LSP", silent = true })

-- Tabs
vim.keymap.set("n", "te", "<CMD>tabnew<CR>", { desc = "New tab", silent = true })
vim.keymap.set("n", "<S-l>", "<CMD>tabnext<CR>", { desc = "Next tab", silent = true })
vim.keymap.set("n", "<S-h>", "<CMD>tabprev<CR>", { desc = "Previous tab", silent = true })

-- Splits
vim.keymap.set("n", "ss", "<CMD>split<CR>", { desc = "Split horizontal", silent = true })
vim.keymap.set("n", "sv", "<CMD>vsplit<CR>", { desc = "Split vertical", silent = true })

-- Window navigation
vim.keymap.set("n", "sl", "<C-w>l", { desc = "Move right", silent = true })
vim.keymap.set("n", "sh", "<C-w>h", { desc = "Move left", silent = true })
vim.keymap.set("n", "sk", "<C-w>k", { desc = "Move up", silent = true })
vim.keymap.set("n", "sj", "<C-w>j", { desc = "Move down", silent = true })

-- Clear highlight
vim.keymap.set("n", "<Esc>", "<CMD>nohlsearch<CR>", { desc = "Clear search highlight", silent = true })

-- Visual indent
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect", silent = true })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect", silent = true })

-- Lazygit
vim.keymap.set("n", "<leader>gg", "<CMD>LazyGit<CR>", { desc = "Toggle LazyGit", silent = true })

-- Move lines
vim.keymap.set("n", "<A-k>", "<CMD>m .-2<CR>==", { desc = "Move line up", silent = true })
vim.keymap.set("n", "<A-j>", "<CMD>m .+1<CR>==", { desc = "Move line down", silent = true })
vim.keymap.set("v", "<A-k>", "<CMD>m '<-2<CR>gv=gv", { desc = "Move selection up", silent = true })
vim.keymap.set("v", "<A-j>", "<CMD>m '>+1<CR>gv=gv", { desc = "Move selection down", silent = true })

-- Utils
vim.keymap.set("n", "<leader>pa", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	print("file:", path)
end, { desc = "Copy full file path" })

vim.keymap.set(
	"n",
	"<leader>cp",
	vim.lsp.document_color.color_presentation,
	{ desc = "Change color presentation", silent = true }
)

vim.keymap.set("n", "<leader>ct", function()
	vim.lsp.document_color.enable(not vim.lsp.document_color.is_enabled())
end, {
	desc = "Toggle color highlight",
	silent = true,
})

-- Search and replace with grug-far
vim.keymap.set({ "n", "x" }, "<leader>sr", function()
	local grug = require("grug-far")

	local ext = nil

	if vim.bo.buftype == "" then
		ext = vim.fn.expand("%:e")
	end

	grug.open({
		transient = true,
		prefills = {
			filesFilter = ext and ext ~= "" and "*." .. ext or nil,
		},
	})
end, {
	desc = "Search and Replace",
})
