local keymap = vim.keymap

keymap.set('n', 'x', '"_x')

-- Save and exit
keymap.set('n', '<Space>q', ':q<CR>')
keymap.set('n', '<Space>Q', ':q!<CR>')
keymap.set('n', '<Space>w', ':w<CR>')
keymap.set('n', '<A-q>', ':bd!<CR>')

-- Comma to end
keymap.set("n", "<Space>;", "$a;<Esc>")
keymap.set("n", "<Space>,", "$a,<Esc>")

-- Move lines
keymap.set("n", "<A-j>", ":m .+1<CR>==")
keymap.set("n", "<A-k>", ":m .-2<CR>==")
keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- Nvim-tree
keymap.set("n", "<Space>e", ":NvimTreeToggle<CR>")

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<Space>aa', 'gg<S-v>G$')

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

-- Hop
keymap.set('n', '<Space>s', ':HopChar2<CR>')

-- Greatest remap ever
keymap.set('x', '<Space>p', "\"_dP")

-- Indentations
keymap.set("v", ">", ">gv", { silent = true })
keymap.set("v", "<", "<gv", { silent = true })

-- Clear search highlight
keymap.set("n", "<esc>", ":noh<return><esc>", { noremap = true, silent = true })
