{inputs, ...}: {
  systems = [
    "x86_64-linux"
    "aarch64-linux"
    "x86_64-darwin"
    "aarch64-darwin"
  ];

  perSystem = {system, ...}: {
    _module.args.pkgs = import inputs.nixpkgs {
      inherit system;
      # Allow only Copilot's unfree package.
      config.allowUnfreePredicate = pkg:
        inputs.nixpkgs.lib.getName pkg == "copilot-language-server";
    };
  };
}
