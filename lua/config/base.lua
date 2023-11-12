vim.cmd("autocmd!")

-- Disable native file tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Set leader
vim.g.mapleader = " "

-- Sync nvim clipboard with sys clipboard
vim.opt.clipboard = "unnamedplus"

-- Highlight line you are on
vim.opt.cursorline = true

-- Enables search results as you type
vim.opt.incsearch = true

-- Enables smart indenting
vim.opt.smartindent = true

-- Time after the buffer is saved
vim.opt.updatetime = 300

-- Enables mouse
vim.opt.mouse = "nvc"

-- Disables swap files
vim.opt.swapfile = false

-- Enables undo files
vim.opt.undofile = true

-- Convert tab to 4 spaces
vim.opt.tabstop = 2

-- Correctly indent lines inside blocks
vim.opt.shiftwidth = 2

-- Enables tab to space conversion
vim.opt.expandtab = true

-- Prefer opening new buffers to the right
vim.opt.splitright = true

-- Prefer opening new buffers below
vim.opt.splitbelow = true

-- Enable nvim set colors
vim.opt.termguicolors = true

-- Enable changing buffers without saving
vim.opt.hidden = true

-- Ignore case when searching
vim.opt.ignorecase = true

-- Ignore case when searching
vim.opt.wildignorecase = true

-- Search with cases sensitive only if search query isn't the same case
vim.opt.smartcase = true

-- Show relative line numbers in the sidebar
vim.opt.relativenumber = false

-- Show sidebar
vim.opt.signcolumn = "yes"

-- Show current line number
vim.opt.number = true

-- Disables line wrapping
vim.opt.wrap = false

-- Use only one global statusline
vim.opt.laststatus = 3

-- Don't redraw screen when using macros (performance increase)
-- vim.opt.lazyredraw = true

-- Scroll offset
vim.opt.scrolloff = 15

-- Scroll amount
vim.opt.scroll = 15

-- Scroll amount
vim.opt.showmode = false
