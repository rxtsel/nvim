![1](https://user-images.githubusercontent.com/85462420/212437877-7e180493-8a4f-4f1d-9619-b84032b6a19a.png)

![2](https://user-images.githubusercontent.com/85462420/212437889-8604b142-dbef-41f1-be4c-3926b959eee7.png)

# Neovim setup

Requires [Neovim](https://neovim.io/) (>= 0.7)

- [wbthomason/packer.nvim](https://github.com/wbthomason/packer.nvim) - A plugin manager for Neovim
- [svrana/neosolarized.nvim](https://github.com/svrana/neosolarized.nvim) - A truecolor, solarized dark colorscheme
- [kyazdani42/nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons) - Lua `fork` of vim-web-devicons for neovim
- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) - A blazing fast and easy to configure Neovim statusline written in Lua
- [onsails/lspkind-nvim](https://github.com/onsails/lspkind-nvim) - VSCode-like pictograms
- [glepnir/lspsaga.nvim](https://github.com/glepnir/lspsaga.nvim) - A light-weight lsp plugin based on neovim's built-in lsp with a highly performant UI
- [folke/lsp-colors.nvim](https://github.com/folke/lsp-colors.nvim) - Plugin that creates missing LSP diagnostics highlight groups for color schemes
- [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip) - Snippet Engine for Neovim written in Lua
- [hrsh7th/cmp-path](https://github.com/hrsh7th/cmp-path) - Nvim-cmp source for filesystem paths
- [hrsh7th/cmp-buffer](https://github.com/hrsh7th/cmp-buffer) - nvim-cmp source for buffer words
- [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) - nvim-cmp source for neovim's built-in LSP
- [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - A completion engine plugin for neovim written in Lua
- [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - A collection of configurations for Neovim's built-in LSP
- [b0o/SchemaStore.nvim](https://github.com/b0o/schemastore.nvim) - JSON schemas for Neovim
- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - [Treesitter](https://github.com/tree-sitter/tree-sitter) configurations and abstraction layer
- [jose-elias-alvarez/null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim) - Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
- [MunifTanjim/prettier.nvim](https://github.com/MunifTanjim/prettier.nvim) - Prettier plugin for Neovim's built-in LSP client
- [nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) - A file explorer tree for neovim written in lua
- [numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim) - Smart and powerful comment plugin for neovim. Supports treesitter
- [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs) - Autopairs
- [windwp/nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag) - Use treesitter to auto close and auto rename html tag
- [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim) - All the lua functions I don't want to write twice
- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - A highly extendable fuzzy finder over lists
- [akinsho/nvim-bufferline.lua](https://github.com/akinsho/nvim-bufferline.lua) - A snazzy bufferline
- [norcalli/nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua) - A high-performance color highlighter
- [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim) - Portable package manager for Neovim that runs everywhere Neovim runs. Easily install and manage LSP servers, DAP servers, linters, and formatters
- [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) - Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim
- [iamcco/markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim) - Markdown live preview
- [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) - Git integration for buffers
- [dinhhuy258/git.nvim](https://github.com/dinhhuy258/git.nvim) - A simple clone of the plugin vim-fugitive
- [phaazon/hop.nvim](https://github.com/phaazon/hop.nvim) - Alternative to ease motion
- [github/copilot.vim](https://github.com/github/copilot.vim) - Neovim plugin for GitHub Copilot

## Neovim Setup:

1. Install Scoop(windows):

```powershell
  iwr -useb get.scoop.sh | iex
```

2. Neovim and Gcc:

```powershell
scoop install neovim gcc
```

3. Install Packer:

- Install Packer (windows):

```powershell
git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
```

- Install Packer (Linux):

```shell
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

4. Install lua-language-server:

```shell
sudo pacman -S lua-language-server
```

### Requiriments:

(Linux):

```shell
sudo npm i -g ripgrep gcc xsel tree-sitter typescript typescript-language-server @fsouza/prettierd @tailwindcss/language-server eslint_d
```

(windows):

```shell
sudo npm i -g gcc typescript typescript-language-server @fsouza/prettierd @tailwindcss/language-server eslint_d
choco install ripgrep tree-sitter
```

. Clone **this** repository in **"C:User\your_user\AppData\local"** (windows).

. Clone **this** repository in **"~/.config"** (Linux).

#### Open nvim and execute the command:

```vim
:PackerInstall
```
