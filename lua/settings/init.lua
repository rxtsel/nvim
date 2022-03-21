require "variables"

g.mapleader = ' '
cmd('imap jj <Esc>')

--SETTINGS
local options = {
  backup = false,                          -- Crea un archivo de respaldo
  clipboard = "unnamedplus",               -- permite que Neovim acceda al portapapeles del sistema
  cmdheight = 1,                           -- más espacio en la línea de comandos de neovim para mostrar mensajes
  completeopt = { "menuone", "noselect" }, -- principalmente solo para cmp
  conceallevel = 0,                        -- para que `` sea visible en los archivos de rebajas
  fileencoding = "utf-8",                  -- la codificación escrita en un archivo
  hlsearch = true,                         -- resalta todas las coincidencias en el patrón de búsqueda anterior
  ignorecase = true,                       -- ignore case in search patterns
  mouse = "a",                             -- permite usar el mouse en neovim
  pumheight = 10,                          -- altura del menú emergente
  showmode = false,                        -- ya no necesitamos ver cosas como -- INSERT --
  title = true,
  hidden = true,
  showtabline = 2,                         -- mostrar siempre pestañas
  smartcase = true,                        -- caso inteligente
  smartindent = true,                      -- vuelve a hacer que la sangría sea más inteligente
  splitbelow = true,                       -- obliga a todas las divisiones horizontales a ir debajo de la ventana actual
  splitright = true,                       -- obliga a todas las divisiones verticales a ir a la derecha de la ventana actual
  swapfile = false,                        -- crea un archivo de intercambio
  termguicolors = true,                   -- establece los colores de la interfaz gráfica de usuario (la mayoría de los terminales lo admiten)
  timeoutlen = 1000,                       -- tiempo de espera para que se complete una secuencia mapeada (en milisegundos)
  undofile = true,                         -- habilitar deshacer persistente
  updatetime = 300,                        -- finalización más rápida (4000 ms por defecto)
  writebackup = false,                     -- si otro programa está editando un archivo (o se escribió en el archivo mientras se editaba con otro programa), no se permite editarlo
  expandtab = true,                        -- convertir tabulaciones en espacios
  shiftwidth = 4,                          -- el número de espacios insertados para cada sangría
  tabstop = 4,                             -- inserta 2 espacios para una pestaña
  cursorline = true,                       -- resaltar la línea actual
  -- cursorcolumn = true,                     -- resaltar la columna actual
  number = true,                           -- establecer líneas numeradas
  relativenumber = true,                  -- establecer líneas numeradas relativas
  numberwidth = 1,                         -- establece el ancho de la columna del número en 2 {predeterminado 4}
  signcolumn = "yes",                      -- siempre muestra la columna de signo, de lo contrario cambiaría el texto cada vez
  wrap = false,                            -- muestra las líneas como una sola línea larga
  scrolloff = 8,                           -- deja un paddinf arriba y abajo de 8 lineas al hacer scroll
  sidescrolloff = 15,                       -- deja un padding en los lados de 8 lineas al hacer scroll
  listchars = { tab = " ", trail = "·" }, -- establece estos caracteres cuando hay espacios o tabs
  -- guifont = "Dank Mono:h17",               -- la fuente utilizada en las aplicaciones gráficas de neovim
  softtabstop = 4,
  autoindent = true,
}

opt.shortmess:append "c"

for k, v in pairs(options) do
  opt[k] = v
end

--DISABLE AUTOCOMMENTS
cmd [[autocmd BufWinEnter * :set formatoptions-=c formatoptions-=r formatoptions-=o]]

--AUTO RELOAD BUFFERS
cmd [[
set autoread
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
autocmd FileChangedShellPost *
\ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
]]

-- Ocultar la linea de estado en el nvim tree
cmd(
	[[au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname('%') == "NvimTree" | set laststatus=0 | else | set laststatus=2 | endif]]
)

-- Cancelar los saltos con el cmp
cmd([[g:vsnip_deactivate_on = g:vsnip#DeactivateOn.OutsideOfCurrentTabstop]])

--FOLDS
cmd [[:set foldmethod=manual 
:delm! | delm A-Z0-9]]

-- Definir las notificaciones en vim
vim.notify = require("notify")

--COLORIZER
require("colorizer").setup()

--DEFINIR TABS SEGUN EL ARCHIVO
cmd([[
autocmd FileType lua setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType json setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype html setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype css setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype javascript setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
]])
