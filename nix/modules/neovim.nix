{
  perSystem = {pkgs, ...}: let
    inherit (pkgs) lib;
    # Only the Lua configuration and runtime files enter the store, never plan/,
    # .git/ or a locally generated vim.pack lockfile.
    config = lib.fileset.toSource {
      root = ../..;
      fileset = lib.fileset.unions (map lib.fileset.maybeMissing [
        ../../init.lua
        ../../lua
        ../../after
        ../../spell
      ]);
    };

    # Runtime tools.
    tools = with pkgs; [
      git
      tree-sitter
      stdenv.cc
      curl
      gnutar
      gzip
      nodejs
      ripgrep
      fd
      lazygit
      delta
      unzip
      # Language servers and formatters.
      lua-language-server
      vtsls
      vscode-langservers-extracted # CSS and ESLint language servers
      oxlint
      tailwindcss-language-server
      rust-analyzer
      copilot-language-server
      prettier
      prettierd
      oxfmt
      stylua
      shfmt
    ] ++ lib.optionals pkgs.stdenv.hostPlatform.isLinux [
      pkgs.wl-clipboard
      pkgs.xclip
    ];

    # Fall back to a clean session when init.lua is absent.
    initFile = if builtins.pathExists ../../init.lua then "${config}/init.lua" else "NONE";

    neovim = assert lib.assertMsg
      (lib.versionAtLeast pkgs.neovim-unwrapped.version "0.12")
      "This configuration requires Neovim >= 0.12.";
      pkgs.symlinkJoin {
        name = "rxtsel-neovim-${pkgs.neovim-unwrapped.version}";
        paths = [pkgs.neovim-unwrapped];
        nativeBuildInputs = [pkgs.makeWrapper];
        postBuild = ''
          wrapProgram "$out/bin/nvim" \
            --prefix PATH : ${lib.makeBinPath tools} \
            --set CC ${pkgs.stdenv.cc}/bin/cc \
            --set CXX ${pkgs.stdenv.cc}/bin/c++ \
            --set NVIM_APPNAME rxtsel-nvim \
            --set RXTSEL_NVIM_NIX 1 \
            --add-flags '--cmd "set runtimepath^=${config}"' \
            --add-flags '-u ${initFile}'
        '';
        meta = {
          description = "Neovim with rxtsel's Lua configuration and CLI dependencies";
          mainProgram = "nvim";
          inherit (pkgs.neovim-unwrapped.meta) license platforms;
        };
      };
  in {
    packages = {
      default = neovim;
      neovim = neovim;
    };

    apps.default = {
      type = "app";
      program = lib.getExe neovim;
      meta.description = "Run rxtsel's Neovim configuration";
    };

    # Tools are also directly available to a normal, non-wrapped Neovim.
    devShells.default = pkgs.mkShell {
      packages = [neovim] ++ tools;
      RXTSEL_NVIM_NIX = "1";
    };

    formatter = pkgs.alejandra;
  };
}
