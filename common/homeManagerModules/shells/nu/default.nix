{ unstable, ... }:
let
  inherit (unstable) nushell nushellPlugins;
  plugins = import ./plugins.nix unstable;
in {
  home.packages = [ plugins.file ] ++ (with nushellPlugins; [ query ]);
  programs.nushell = {
    enable = true;
    package = nushell;
    configFile.source = ./config.nu;
  };
}
