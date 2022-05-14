local map = function(mode, key, result)
	vim.api.nvim_set_keymap(mode, key, result, { noremap = true, silent = true })
end

-- RESET ESC TO JJ
vim.g.mapleader = " "
vim.cmd("imap jj <Esc>")

-- SAVE AND EXIT
map("n", "<Leader>q", ":q<CR>")
map("n", "<Leader>w", ":w<CR>")
map("n", "<A-q>", ":bd!<CR>")

-- NVIM-TREE
map("n", "<Leader>e", ":NvimTreeToggle<CR>")

-- TELESCOPE
map("n", "<Leader>f", ":lua require('telescope.builtin').find_files()<CR>")
map("n", "<Leader>fb", ":lua require('telescope.builtin').buffers()<CR>")
map("n", "<Leader>fg", ":lua require('telescope.builtin').live_grep()<CR>")
map("n", "<Leader>fo", ":lua require('telescope.builtin').oldfiles()<CR>")
map("n", "<leader>fm", ":Telescope media_files<CR>")

-- NVIM-COMMENTS
map("n", "<Leader>cc", ":CommentToggle<CR>")
map("x", "<Leader>cc", ":'<,'>CommentToggle<CR>")

-- COMMA TO END
map("n", "<Leader>;", "$a;<Esc>")
map("n", "<Leader>,", "$a,<Esc>")

-- SELECT All
map("n", "<C-a>", "ggVG")

-- DELETE DOESN'T COPY PORTAPAPELES
map("v", "<BS>", '"_d')

-- DESPLAZAR LINEAS
map("n", "<A-j>", ":m .+1<CR>==")
map("n", "<A-k>", ":m .-2<CR>==")
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
map("v", "<A-j>", ":m '>+1<CR>gv=gv")
map("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- COPIAR LINEA ABAJO O ARRIBA
map("n", "<C-A-j>", "yyp")
map("n", "<C-A-k>", "yyP")
map("i", "<C-A-j>", "<Esc>:copy . <CR>a")
map("v", "<C-A-j>", "yo<Esc>:put<CR>")

-- FAST-SCROLLING
map("n", "<C-j>", "10<C-e>")
map("n", "<C-k>", "10<C-y>")
map("n", "<C-l>", "20l")
map("n", "<C-h>", "20h")

-- MOVE BETWEEN TABS
map("n", "gt", ":bn<CR>")

-- FOLDS
map("v", "f", "zf")
map("n", "ff", "za")

--CAMBIAR TAMAÑO DE VENTANAS
map("n", "<A-Down>", ":exe 'resize ' . (winheight(0) * 3/2)<CR>")
map("n", "<A-Up>", ":exe 'resize ' . (winheight(0) * 2/3)<CR>")
map("n", "<A-Left>", ":vertical resize -2<CR>")
map("n", "<A-Right>", ":vertical resize +2<CR>")
