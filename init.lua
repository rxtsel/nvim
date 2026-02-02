-- Neovim options
vim.g.mapleader = " "

vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn =  "yes"
vim.o.wrap = false
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.clipboard = "unnamedplus"
vim.o.undofile = true
vim.o.swapfile = false
vim.o.backup = false

-- Plugins
vim.pack.add({
	{ src = "https://github.com/craftzdog/solarized-osaka.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/nvim-mini/mini.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/saghen/blink.cmp" }
})

-- Colorscheme
vim.cmd.colorscheme("solarized-osaka")

-- LSP
vim.lsp.enable({ "lua_ls", "astro", "svelte", "vtsls", "nixd" })

-- Plugins setup
require("oil").setup({
	columns = { "icon" },
	view_options = { show_hidden = true }
})

require("mini.pick").setup()
require("mini.pairs").setup()
require("mini.surround").setup()
require("mini.statusline").setup()

require("blink.cmp").setup({
	-- fuzzy = { implementation = "prefer_rust" }
	fuzzy = { implementation = "lua" }
})

-- Keymaps
vim.keymap.set("n", "<C-s>", "<CMD>w<CR>", { noremap = true, silent = true, desc = "Save file" })
vim.keymap.set("n", "<leader>q", "<CMD>q<CR>", { noremap = true, silent = true, desc = "Quit" })
vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { noremap = true, silent = true, desc = "Toggle file explorer" })
vim.keymap.set("n", ";f", "<CMD>Pick files<CR>", { noremap = true, silent = true, desc = "Find files" })
vim.keymap.set("n", ";g", "<CMD>Pick grep<CR>", { noremap = true, silent = true, desc = "Find by grep" })
vim.keymap.set("n", ";b", "<CMD>Pick buffers<CR>", { noremap = true, silent = true, desc = "Find buffers" })
vim.keymap.set("n", ";h", "<CMD>Pick help<CR>", { noremap = true, silent = true, desc = "Find help" })
vim.keymap.set("n", "<leader>caf", vim.lsp.buf.format, { noremap = true, silent = true, desc = "Format file" })
