-- Save and exit
vim.keymap.set("n", "<C-s>", "<CMD>w<CR>", { noremap = true, silent = true, desc = "Save file" })
vim.keymap.set("n", "<leader>q", "<CMD>q<CR>", { noremap = true, silent = true, desc = "Quit neovim" })

-- File explorer
vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { noremap = true, silent = true, desc = "Toggle file explorer" })
vim.keymap.set("n", ";f", "<CMD>Pick files<CR>", { noremap = true, silent = true, desc = "Find files" })
vim.keymap.set("n", ";g", "<CMD>Pick grep<CR>", { noremap = true, silent = true, desc = "Find by grep" })
vim.keymap.set("n", ";b", "<CMD>Pick buffers<CR>", { noremap = true, silent = true, desc = "Find buffers" })
vim.keymap.set("n", ";h", "<CMD>Pick help<CR>", { noremap = true, silent = true, desc = "Find help" })

-- Format
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { noremap = true, silent = true, desc = "Format file" })

-- Tabs
vim.keymap.set("n", "te", "<CMD>tabnew<CR>", { noremap = true, silent = true, desc = "New tab" })
vim.keymap.set("n", "<S-h>", "<CMD>tabprev<CR>", { noremap = true, silent = true, desc = "Previous tab" })
vim.keymap.set("n", "<S-l>", "<CMD>tabnext<CR>", { noremap = true, silent = true, desc = "Next tab" })

-- Split window
vim.keymap.set("n", "ss", "<cmd>split<Return>", { noremap = true, silent = true, desc = "Split horizontal" })
vim.keymap.set("n", "sv", "<cmd>vsplit<Return>", { noremap = true, silent = true, desc = "Split vertical" })

-- Move window
vim.keymap.set("n", "sl", "<C-w>l", { desc = "Move to left" })
vim.keymap.set("n", "sh", "<C-w>h", { desc = "Move to right" })
vim.keymap.set("n", "sk", "<C-w>k", { desc = "Move to top" })
vim.keymap.set("n", "sj", "<C-w>j", { desc = "Move to bottom" })

-- Resize window
vim.keymap.set("n", "<C-w><left>", "<C-w><", { desc = "Resize to left" })
vim.keymap.set("n", "<C-w><right>", "<C-w>>", { desc = "Resize to right" })
vim.keymap.set("n", "<C-w><up>", "<C-w>+", { desc = "Resize to top" })
vim.keymap.set("n", "<C-w><down>", "<C-w>-", { desc = "Resize to bottom" })

-- Clear highlighting
vim.keymap.set("n", "<Esc>", "<CMD>nohlsearch<CR><Esc>")
