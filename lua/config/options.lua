vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- UI
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.colorcolumn = "100"
vim.opt.signcolumn = "yes"
vim.opt.cmdheight = 1
vim.opt.showcmd = false
vim.opt.showmode = false
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10
vim.opt.smoothscroll = true

-- Tabs & indentation
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Files & persistence
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.autoread = true
vim.opt.autowrite = false
vim.opt.confirm = true
vim.opt.viewoptions = { "folds", "cursor" }

-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Behavior
vim.opt.mouse = "nvc"
vim.opt.virtualedit = "block"
vim.opt.selection = "inclusive"
vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.autochdir = false
vim.opt.exrc = true
vim.opt.modifiable = true
vim.opt.encoding = "utf-8"

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.splitkeep = "screen"

-- Performance / timing
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.ttimeoutlen = 50
vim.opt.lazyredraw = true
vim.opt.redrawtime = 10000
vim.opt.maxmempattern = 20000

-- Completion
vim.opt.completeopt = { "menuone", "noinsert", "noselect" }

-- Command preview
vim.opt.inccommand = "split"

-- Folds
vim.opt.foldcolumn = "0"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = false
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- Fillchars
vim.opt.fillchars = {
	eob = " ",
	fold = " ",
	foldopen = " ",
	foldsep = " ",
	foldclose = " ",
}

-- Matching
vim.opt.showmatch = true

-- Conceal
vim.opt.conceallevel = 0
vim.opt.concealcursor = ""

-- Syntax
vim.opt.synmaxcol = 300

-- Editing
vim.opt.backspace = { "indent", "eol", "start" }

-- Lists / append style
vim.opt.iskeyword:append("-")
vim.opt.path:append("**")
vim.opt.clipboard = { "unnamedplus" }
vim.opt.diffopt:append("linematch:60")
vim.opt.diffopt:append("algorithm:histogram")

-- Wildmenu
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"

-- Cursor
vim.opt.guicursor = {
	"n-v-c:block",
	"i-ci-ve:ver25",
	"r-cr:hor20",
	"o:hor50",
	"a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor",
	"sm:block-blinkwait175-blinkoff150-blinkon175",
}
