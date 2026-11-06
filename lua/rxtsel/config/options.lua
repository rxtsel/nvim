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

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99

require("vim._core.ui2").enable({
	msg = {
		target = "msg",
		targets = {
			typed_cmd = "cmd",
			emsg = "pager",
			echoerr = "pager",
			lua_error = "pager",
			rpc_error = "pager",
			list_cmd = "pager",
			verbose = "pager",
			shell_cmd = "pager",
			shell_out = "pager",
			shell_err = "pager",
			shell_ret = "pager",
			progress = "pager",
			search_count = "cmd",
			search_cmd = "cmd",
			completion = "cmd",
			wildlist = "cmd",
			confirm = "cmd",
		},
		cmd = { height = 0.5 },
		msg = { height = 0.3, timeout = 5000 },
		pager = { height = 0.5 },
	},
})
