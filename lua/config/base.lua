---@diagnostic disable: undefined-global
vim.cmd('autocmd!')

local opt = vim.opt

vim.scriptencoding = 'utf-8'
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

vim.wo.number = true

opt.title = true
opt.autoindent = true
opt.smartindent = true
opt.hlsearch = true
opt.backup = false
opt.showcmd = true
opt.showmode = false -- don't show mode. Show it in statusline
opt.cmdheight = 1
opt.laststatus = 2
opt.expandtab = true
opt.scrolloff = 2
opt.inccommand = 'split'
opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
opt.smarttab = true
opt.breakindent = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.wrap = false -- No Wrap lines
opt.backspace = { 'start', 'eol', 'indent' }
opt.expandtab = true
opt.path:append { '**' } -- Finding files - Search down into subfolders
opt.wildignore:append { '*/node_modules/*' }
opt.mouse = "nvc"
opt.shell = 'zsh'
opt.clipboard = 'unnamedplus'
opt.completeopt = { 'menu', 'menuone', 'noselect' }
opt.formatoptions = 'jcroqlnt'
opt.grepformat = '%f:%l:%c:%m'
opt.grepprg = 'rg --vimgrep'
opt.relativenumber = true
opt.shiftround = true

-- Highlight on yank
opt.cursorline = true
opt.termguicolors = true
opt.winblend = 0
opt.wildoptions = 'pum'
opt.pumblend = 5
opt.background = 'dark'

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

-- Add asterisks in block comments
opt.formatoptions:append { 'r' }

-- Disable autocomments
vim.cmd [[autocmd BufWinEnter * :set formatoptions-=c formatoptions-=r formatoptions-=o]]

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
