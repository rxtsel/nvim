local opts = { noremap = true, silent = true }

-- Builds a keymap options table with the given description
local function with_desc(desc)
	return vim.tbl_extend("force", {}, opts, { desc = desc })
end

-- Save and exit
vim.keymap.set("n", "<C-s>", "<CMD>w<CR>", with_desc("Save file"))
vim.keymap.set("n", "<leader>q", "<CMD>q<CR>", with_desc("Quit neovim"))

-- File explorer
vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", with_desc("Toggle file explorer"))
vim.keymap.set("n", ";f", "<CMD>Pick files<CR>", with_desc("Find files"))
vim.keymap.set("n", ";r", "<CMD>Pick grep<CR>", with_desc("Find grep"))
vim.keymap.set("n", ";b", "<CMD>Pick buffers<CR>", with_desc("Find buffers"))
vim.keymap.set("n", ";h", "<CMD>Pick help<CR>", with_desc("Find help"))

-- Format
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, with_desc("Format with lsp"))

-- Tabs
vim.keymap.set("n", "te", "<CMD>tabnew<CR>", with_desc("New tab"))
vim.keymap.set("n", "<S-l>", "<CMD>tabnext<CR>", with_desc("Next tab"))
vim.keymap.set("n", "<S-h>", "<CMD>tabprev<CR>", with_desc("Previous tab"))

-- Split window
vim.keymap.set("n", "ss", "<CMD>split<CR>", with_desc("Split horizontal"))
vim.keymap.set("n", "sv", "<CMD>vsplit<CR>", with_desc("Split vertical"))

-- Move into windows
vim.keymap.set("n", "sl", "<C-w>l", { desc = "Move to right" })
vim.keymap.set("n", "sh", "<C-w>h", { desc = "Move to left" })
vim.keymap.set("n", "sk", "<C-w>k", { desc = "Move to top" })
vim.keymap.set("n", "sj", "<C-w>j", { desc = "Move to bottom" })

-- Clear highlighting
vim.keymap.set("n", "<Esc>", "<CMD>nohlsearch<CR>", { desc = "Move to bottom" })

-- Better indentation in visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Lazygit
vim.keymap.set("n", "<leader>gg", "<CMD>LazyGit<CR>", { desc = "Toggle LazyGit" })
