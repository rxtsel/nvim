# My Neovim setup

A minimal, keyboard-first setup for coding and reviewing changes.

[Keymap cheatsheet](docs/01-keymaps.md) · [Read my blog](https://rxtsel.dev/blog/basic-commands-for-neovim/?ref=github_nvim_repo)

### Nix

With [Nix](https://nixos.org/download/) and flakes enabled, Neovim and its CLI tools are provided for you.

Try without installing:

```sh
nix run github:rxtsel/nvim
```

Or install in your user profile:

```sh
nix profile add github:rxtsel/nvim
nvim
```

The Nix package keeps its configuration and plugin data separate from your regular Neovim setup.

### Requirements

For installation **without Nix**:

- [Neovim](https://neovim.io/) **0.12+** and a [Nerd Font](https://www.nerdfonts.com/).
- [Git](https://git-scm.com/).
- [Tree-sitter CLI](https://tree-sitter.github.io/tree-sitter/cli/installation.html) **0.26.1+** and a C compiler: [GCC](https://gcc.gnu.org/) or [Clang](https://clang.llvm.org/). Install the CLI through your package manager, not npm.
- [Node.js](https://nodejs.org/) **22+**, including npm.
- [curl](https://curl.se/), [tar](https://www.gnu.org/software/tar/), [gzip](https://www.gnu.org/software/gzip/), and [unzip](https://infozip.sourceforge.net/UnZip.html).
- [ripgrep](https://github.com/BurntSushi/ripgrep) and [fd](https://github.com/sharkdp/fd).
- [Lazygit](https://github.com/jesseduffield/lazygit), [delta](https://github.com/dandavison/delta), and [fish](https://fishshell.com/) (also provides `fish_indent`).
- [rustfmt](https://github.com/rust-lang/rustfmt) for Rust and [Alejandra](https://github.com/kamadorueda/alejandra) for Nix formatting.
- A clipboard provider: [wl-clipboard](https://github.com/bugaevc/wl-clipboard) for Wayland or [xclip](https://github.com/astrand/xclip) for X11. macOS uses its built-in clipboard tools.

[Mason](https://github.com/mason-org/mason.nvim) installs the configured language servers and remaining formatters on startup. With Nix, those tools are supplied by the flake instead.

Lazygit's optional `git cz` action needs [Commitizen](https://github.com/commitizen/cz-cli) or a compatible command such as [czg](https://github.com/Zhengqbbb/cz-git/tree/main/packages/cli). Its editor and commit bindings use a separate `~/.config/lazygit/config.yml`.

### Install without Nix

Back up any existing `~/.config/nvim` configuration, then:

```sh
git clone https://github.com/rxtsel/nvim ~/.config/nvim
nvim
```

On first launch, confirm the plugin installation prompt and let parsers and language tools finish installing. Internet access is required.

For Copilot suggestions, run `:Copilot auth` once with a GitHub account that has Copilot access.
