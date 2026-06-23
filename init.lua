vim.loader.enable()

require 'options'
require 'keymaps'
require 'commands'
require 'autocmds'
require 'lsp'

-- Interactive textual undotree:
vim.cmd.packadd 'nvim.undotree'

-- Enable the new experimental command-line features.
require('vim._core.ui2').enable {}
