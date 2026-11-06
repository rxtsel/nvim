vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.mouse = ""
vim.opt.clipboard = "unnamedplus"

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.iskeyword:append("-")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.cmdheight = 0
vim.opt.laststatus = 3
vim.opt.winborder = "rounded"

vim.opt.pumheight = 10
vim.opt.pumblend = 10
vim.opt.showmatch = true
vim.opt.matchtime = 2
vim.opt.title = true
vim.opt.fillchars:append({ diff = "╱" })

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.path:append("**")
vim.opt.wildmode = "longest:full,full"
vim.opt.wildignore:append({ "*/node_modules/*", "*.o", "*.obj", "*.pyc", "*.class", "*.jar" })

vim.opt.swapfile = false
vim.opt.writebackup = false

local undodir = vim.fn.expand("~/.cache/nvim/undodir")
vim.fn.mkdir(undodir, "p")
vim.opt.undodir = undodir
vim.opt.undofile = true

vim.opt.updatetime = 300
vim.opt.timeoutlen = 500
vim.opt.ttimeoutlen = 0
