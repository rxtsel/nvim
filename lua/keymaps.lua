-- Save and exit
vim.keymap.set({ 's', 'i', 'n', 'v' }, '<C-s>', '<ESC>:w<CR>', { desc = 'Save changes' })
vim.keymap.set('n', '<leader>q', '<CMD>q<CR>', { desc = 'Quit neovim', silent = true })

-- Picker
vim.keymap.set('n', ';f', '<CMD>Pick files<CR>', { desc = 'Find files', silent = true })
vim.keymap.set('n', ';r', '<CMD>Pick grep<CR>', { desc = 'Find grep', silent = true })
vim.keymap.set('n', ';b', '<CMD>Pick buffers<CR>', { desc = 'Find buffers', silent = true })
vim.keymap.set('n', ';h', '<CMD>Pick help<CR>', { desc = 'Find help', silent = true })

-- Wrapped line movement with jumplist
vim.keymap.set('n', 'j', [[(v:count > 1 ? 'm`' . v:count : 'g') . 'j']], { expr = true })
vim.keymap.set('n', 'k', [[(v:count > 1 ? 'm`' . v:count : 'g') . 'k']], { expr = true })

-- Tabs
vim.keymap.set('n', 'te', '<CMD>tabnew<CR>', { desc = 'New tab', silent = true })
vim.keymap.set('n', 'tc', '<CMD>tabclose<CR>', { desc = 'Close tab page' })
vim.keymap.set('n', 'tn', '<CMD>tab split<CR>', { desc = 'New tab page' })
vim.keymap.set('n', 'to', '<CMD>tabonly<CR>', { desc = 'Close other tab pages' })
vim.keymap.set('n', '<S-l>', '<CMD>tabnext<CR>', { desc = 'Next tab', silent = true })
vim.keymap.set('n', '<S-h>', '<CMD>tabprev<CR>', { desc = 'Previous tab', silent = true })

-- Split and move into splits
vim.keymap.set('n', 'ss', '<CMD>split<CR>', { desc = 'Split horizontal', silent = true })
vim.keymap.set('n', 'sv', '<CMD>vsplit<CR>', { desc = 'Split vertical', silent = true })

vim.keymap.set('n', 'sl', '<C-w>l', { desc = 'Move right', silent = true })
vim.keymap.set('n', 'sh', '<C-w>h', { desc = 'Move left', silent = true })
vim.keymap.set('n', 'sk', '<C-w>k', { desc = 'Move up', silent = true })
vim.keymap.set('n', 'sj', '<C-w>j', { desc = 'Move down', silent = true })

-- Better esc
vim.keymap.set({ 'i', 's', 'n' }, '<esc>', function()
    vim.cmd 'noh'
    return '<esc>'
end, { desc = 'Escape and clear hlsearch', expr = true })

-- Centered scrolling and search navigation
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll downwards' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll upwards' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next result' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Previous result' })

-- Better indent
vim.keymap.set('v', '<', '<gv', { desc = 'Indent left and reselect', silent = true })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent right and reselect', silent = true })

-- Buffer
vim.keymap.set('n', '<leader>bQ', 'mzgggqG`z<CMD>delmarks z<CR>zz', { desc = 'Format buffer' })

-- Move lines
vim.keymap.set('n', '<A-k>', '<CMD>m .-2<CR>==', { desc = 'Move line up', silent = true })
vim.keymap.set('n', '<A-j>', '<CMD>m .+1<CR>==', { desc = 'Move line down', silent = true })
vim.keymap.set('v', '<A-k>', "<CMD>m '<-2<CR>gv=gv", { desc = 'Move selection up', silent = true })
vim.keymap.set('v', '<A-j>', "<CMD>m '>+1<CR>gv=gv", { desc = 'Move selection down', silent = true })

-- Utils
vim.keymap.set({ 'i', 'c' }, '<C-l>', '<C-o>A', { desc = 'Go to the end of the line' })

vim.keymap.set('n', '<leader>bc', function()
    local path = vim.fn.expand '%:p'
    vim.fn.setreg('+', path)
    print('file:', path)
end, { desc = 'Copy full file path' })

vim.keymap.set(
    'n',
    '<leader>cp',
    vim.lsp.document_color.color_presentation,
    { desc = 'Change color presentation', silent = true }
)

vim.keymap.set('n', '<leader>ct', function()
    vim.lsp.document_color.enable(not vim.lsp.document_color.is_enabled())
end, { desc = 'Toggle color highlight', silent = true })
