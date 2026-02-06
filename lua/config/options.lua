vim.g.mapleader = " "

-- Disable unused providers
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.wrap = false
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.clipboard = "unnamedplus"
vim.o.undofile = true
vim.o.swapfile = false
vim.o.backup = false
vim.o.cursorline = true
vim.o.termguicolors = true
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
vim.o.hlsearch = true
vim.o.showcmd = false
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.mouse = "nvc"
vim.o.colorcolumn = "100"
vim.o.smoothscroll = true
vim.o.splitkeep = "screen"
vim.o.jumpoptions = "view"
vim.o.inccommand = "split"
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.confirm = true
vim.o.virtualedit = "block"
vim.o.exrc = true
vim.o.cmdheight = 0

-- fold
vim.o.foldcolumn = "0"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = false
vim.o.fillchars = [[eob: ,fold: ,foldopen: ,foldsep: ,foldclose:]]
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
