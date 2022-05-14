vim.cmd('filetype plugin indent on')
vim.o.completeopt = "menu,menuone,noselect"
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.hidden = true -- requerido para mantener múltiples búferes y abrir múltiples búferes
vim.o.whichwrap = 'b,s,<,>,[,],h,l'
vim.o.pumheight = 10 -- altura del menú emergente
vim.o.fileencoding = "utf-8" -- la codificación escrita en un archivo
vim.o.cmdheight = 1 -- más espacio en la línea de comandos de neovim para mostrar mensajes
vim.o.splitbelow = true -- obliga a todas las divisiones horizontales a ir debajo de la ventana actual
vim.o.termguicolors = true -- establece los colores de la interfaz gráfica de usuario (la mayoría de los terminales lo admiten)
vim.o.conceallevel = 0 -- para que `` sea visible en los archivos de rebajas
vim.o.showtabline = 2 -- mostrar siempre pestañas
vim.o.showmode = false -- ya no necesitamos ver cosas como -- INSERT --
vim.o.backup = false -- Crea un archivo de respaldo
vim.o.writebackup = false -- si otro programa está editando un archivo (o se escribió en el archivo mientras se editaba con otro programa), no se permite editarlo
vim.o.updatetime = 300 -- finalización más rápida (4000 ms por defecto)
vim.o.timeoutlen = 250 -- tiempo de espera para que se complete una secuencia mapeada (en milisegundos)
vim.o.clipboard = "unnamedplus" -- permite que Neovim acceda al portapapeles del sistema
vim.o.hlsearch = true -- resalta todas las coincidencias en el patrón de búsqueda anterior
vim.o.ignorecase = true -- ignore case in search patterns
vim.o.scrolloff = 3 -- deja un paddinf arriba y abajo de 8 lineas al hacer scroll
vim.o.sidescrolloff = 5 -- deja un padding en los lados de 8 lineas al hacer scroll
vim.o.mouse = "a" -- permite usar el mouse en neovim


vim.wo.wrap = false -- muestra las líneas como una sola línea larga
vim.wo.number = true -- establecer líneas numeradas
vim.wo.relativenumber = false -- establecer líneas numeradas relativas
vim.wo.cursorline = true -- resaltar la línea actual
vim.wo.signcolumn = "yes"

vim.o.tabstop = 2 -- inserta 2 espacios para una pestaña
vim.bo.tabstop = 2 -- inserta 2 espacios para una pestaña
vim.o.softtabstop = 4
vim.bo.softtabstop = 4
vim.o.shiftwidth = 2 -- el número de espacios insertados para cada sangría
vim.bo.shiftwidth = 2 -- el número de espacios insertados para cada sangría
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.expandtab = true -- convertir tabulaciones en espacios
vim.bo.expandtab = true -- convertir tabulaciones en espacios

vim.opt.swapfile = false -- crea un archivo de intercambio
vim.opt.undofile = true -- habilitar deshacer persistente

-- Disable various builtin plugins in Vim that bog down speed
vim.g.loaded_matchparen = 1
vim.g.loaded_matchit = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_gzip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_shada_plugin = 1
vim.g.loaded_spellfile_plugin = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_remote_plugins = 1

-- DISABLE AUTOCOMMENTS
vim.cmd [[autocmd BufWinEnter * :set formatoptions-=c formatoptions-=r formatoptions-=o]]

-- HIDDEN LINE STATE WHEN NVIM-TREE IS OPEN
vim.cmd [[autocmd BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname('%') == "NvimTree" | set laststatus=0 | else | set laststatus=2 | endif]]

-- SNIPPETS
vim.g.vsnip_snippet_dir = "~/.config/nvim/snippets"

-- COLORIZER
local colorizer = require('colorizer')
colorizer.setup({ '*' }, { RGB = true, RRGGBB = true, names = true, RRGGBBAA = true, rgb_fn = true, hsl_fn = true, css = true, css_fn = true })
