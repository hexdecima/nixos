{ unstable, ... }:
let inherit (unstable) nushell;
in {
  programs.nushell = {
    enable = true;
    package = nushell;
    configFile.source = ./config.nu;
  };
}
