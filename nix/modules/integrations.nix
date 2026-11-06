{self, ...}: let
  optionsFor = {lib, pkgs, ...}: {
    options.programs.rxtsel-neovim = {
      enable = lib.mkEnableOption "rxtsel's Neovim configuration and tools";
      package = lib.mkOption {
        type = lib.types.package;
        default = self.packages.${pkgs.stdenv.hostPlatform.system}.default;
        description = "The wrapped Neovim package to install.";
      };
    };
  };

  nixosModule = {config, lib, ...}: {
    imports = [optionsFor];
    config = lib.mkIf config.programs.rxtsel-neovim.enable {
      environment.systemPackages = [config.programs.rxtsel-neovim.package];
    };
  };

  homeModule = {config, lib, ...}: {
    imports = [optionsFor];
    config = lib.mkIf config.programs.rxtsel-neovim.enable {
      home.packages = [config.programs.rxtsel-neovim.package];
    };
  };
in {
  flake = {
    nixosModules = {
      default = nixosModule;
      neovim = nixosModule;
    };
    homeModules = {
      default = homeModule;
      neovim = homeModule;
    };
  };
}
