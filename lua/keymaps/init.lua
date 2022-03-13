require "variables"

g.mapleader = " "
cmd("imap jj <Esc>")
cmd("imap JJ <Esc>")

--SAVE AND EXIT
map("n", "<Leader>q", ":q<CR>")
map("n", "<Leader>w", ":w<CR>")
map("n", "<Leader>Q", ":q!<CR>")

--NVIM-TREE
map("n", "<Leader>n", ":NvimTreeToggle<CR>")

--NVIM-COMMENTS
map("n", "<Leader>cc", ":CommentToggle<CR>")
map("x", "<Leader>cc", ":'<,'>CommentToggle<CR>")
map("n", "<Leader>;", "$a;<Esc>")

--SELECT All
map("n", "<C-a>", 'ggVG')

--DELETE DOESN'T COPY PORTAPAPELES
map("v", "<BS>", '"_d')

--HOP-NVIM
map("n", "<Leader>s", ":HopChar2<CR>")

--TELESCOPE
map("n", "<Leader>ff", ":lua require('telescope.builtin').find_files()<CR>")
map("n", "<Leader>fb", ":lua require('telescope.builtin').buffers()<CR>")
map("n", "<Leader>fg", ":lua require('telescope.builtin').live_grep()<CR>")
map("n", "<Leader>fo", ":lua require('telescope.builtin').oldfiles()<CR>")

--WINDOW NAVIGATION
map("n", "<Leader><C-h>", "<C-w>h")
map("n", "<Leader><C-l>", "<C-w>l")
map("n", "<Leader><C-j>", "<C-w>j")
map("n", "<Leader><C-k>", "<C-w>k")

--DESPLAZAR LINEAS
map("n", "<A-j>", ":m .+1<CR>==")
map("n", "<A-k>", ":m .-2<CR>==")
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
map("v", "<A-j>", ":m '>+1<CR>gv=gv")
map("v", "<A-k>", ":m '<-2<CR>gv=gv")

--CAMBIAR TAMAÑO DE VENTANAS
map("n", "<A-Down>", ":exe 'resize ' . (winheight(0) * 3/2)<CR>")
map("n", "<A-Up>", ":exe 'resize ' . (winheight(0) * 2/3)<CR>")
map("n", "<A-Left>", ":vertical resize -2<CR>")
map("n", "<A-Right>", ":vertical resize +2<CR>")

--FAST-SCROLLING
map("n", "<C-j>", "10<C-e>")
map("n", "<C-k>", "10<C-y>")
map("n", "<C-l>", "20l")
map("n", "<C-h>", "20h")

--TERM
map("t", "jj", "<C-\\><C-n>")

--IDENT
map("n", "<A-i>", "gg=G")   --ident all document

--MOVE BETWEEN TABS
map("n", "<Tab>", ":bn<CR>")
map("n", "<A-q>", ":bd!<CR>") --cerrar pestaña

--FOLDS
map("v", "f", "zf")
map("n", "ff", "za")
--commmands folds
-- zf : Crear
-- zd : Eliminar
-- zE: Eliminar todos
-- za: Toggle
-- zR: Mostrar todos
-- zM: Cerrar todos
