require "term"

local keymap = vim.keymap

keymap.set('n', 'x', '"_x')

-- save and exit
keymap.set('n', '<Space>q', ':q<CR>')
keymap.set('n', '<Space>w', ':w<CR>')
keymap.set('n', '<A-q>', ':bd!<CR>')

-- comma to end
keymap.set("n", "<Space>;", "$a;<Esc>")
keymap.set("n", "<Space>,", "$a,<Esc>")

-- move lines
keymap.set("n", "<A-j>", ":m .+1<CR>==")
keymap.set("n", "<A-k>", ":m .-2<CR>==")
keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- nvim-tree
keymap.set("n", "<Space>e", ":NvimTreeToggle<CR>")

-- open term
keymap.set('t', 'jj', '<C-\\><C-n>', { silent = true })
keymap.set('t', '<Esc>', '<C-\\><C-n>', { silent = true })
keymap.set({ 'n', 't' }, '<Space>ñ', ToggleTerminal)

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- New tab
keymap.set('n', 'te', ':tabedit<Return>', { silent = true })
-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w', { silent = true })
keymap.set('n', 'sv', ':vsplit<Return><C-w>w', { silent = true })
-- Move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

-- hop
keymap.set('n', '<Space>s', ':HopChar2<CR>')

-- search and replace
keymap.set('n', '<Space>r', ':%s//g<Left><Left>', { silent = true })
keymap.set("n", "<F2>", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- greatest remap ever
keymap.set('x', '<Space>p', "\"_dP")
