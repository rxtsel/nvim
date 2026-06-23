vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.colorcolumn = '110'
vim.opt.signcolumn = 'yes'
vim.opt.cmdheight = 1
vim.opt.showcmd = false
vim.opt.showmode = false
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10
vim.opt.smoothscroll = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.autoread = true
vim.opt.autowrite = false
vim.opt.confirm = true
vim.opt.viewoptions = { 'folds', 'cursor' }

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.mouse = 'nvc'
vim.opt.virtualedit = 'block'
vim.opt.selection = 'inclusive'
vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.autochdir = false
vim.opt.exrc = true
vim.opt.modifiable = true
vim.opt.encoding = 'utf-8'
vim.opt.spelllang = { 'en', 'es' }

vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.splitkeep = 'screen'

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.ttimeoutlen = 50
vim.opt.lazyredraw = true
vim.opt.redrawtime = 10000
vim.opt.maxmempattern = 20000

vim.opt.completeopt = { 'menuone', 'noinsert', 'noselect' }

vim.opt.inccommand = 'split'

vim.opt.foldcolumn = '1'
vim.opt.foldlevelstart = 99
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.wo.foldtext = ''

vim.opt.fillchars = {
    eob = ' ',
    fold = ' ',
    foldclose = '',
    foldopen = '',
    foldsep = ' ',
    foldinner = ' ',
    msgsep = '─',
}

vim.opt.showmatch = true

vim.opt.conceallevel = 0
vim.opt.concealcursor = ''

vim.opt.synmaxcol = 300

vim.opt.backspace = { 'indent', 'eol', 'start' }

vim.opt.iskeyword:append '-'
vim.opt.path:append '**'
vim.opt.diffopt:append 'linematch:60'
vim.opt.diffopt:append 'algorithm:histogram'

vim.opt.wildmenu = true
vim.opt.wildmode = 'longest:full,full'

vim.opt.clipboard = 'unnamedplus'

-- Configure clipboard support for WSL using win32yank.
if vim.fn.has 'wsl' == 1 and vim.fn.executable 'win32yank.exe' == 1 then
    vim.g.clipboard = {
        name = 'win32yank',
        copy = {
            ['+'] = 'win32yank.exe -i --crlf',
            ['*'] = 'win32yank.exe -i --crlf',
        },
        paste = {
            ['+'] = 'win32yank.exe -o --lf',
            ['*'] = 'win32yank.exe -o --lf',
        },
        cache_enabled = false,
    }

-- Silence `wl-paste` stderr when the Wayland clipboard is empty.
elseif vim.fn.has 'linux' == 1 and vim.env.WAYLAND_DISPLAY then
    vim.g.clipboard = {
        name = 'wl-clipboard',
        copy = {
            ['+'] = 'wl-copy --type text/plain',
            ['*'] = 'wl-copy --primary --type text/plain',
        },
        paste = {
            ['+'] = { 'sh', '-c', 'wl-paste --no-newline 2>/dev/null || true' },
            ['*'] = { 'sh', '-c', 'wl-paste --primary --no-newline 2>/dev/null || true' },
        },
        cache_enabled = true,
    }
end
