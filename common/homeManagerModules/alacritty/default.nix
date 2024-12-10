{ inputs, system, pkgs, ... }:
let
  font = {
    package = inputs.nixprs.packages.${system}.monofoki-nerd-font;
    name = "Monofoki Nerd Font";
    # package = pkgs.nerdfonts.override { fonts = [ "UbuntuMono" ]; };
    # name = "UbuntuMono Nerd Font";
    size = 22;
  };
  colors = builtins.fromTOML (builtins.readFile ./colours.toml);
in {
  home.packages = [ font.package ];
  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = 0.98;
      font = {
        size = font.size;
        normal.family = font.name;
        bold.family = font.name;
        italic.family = font.name;
        bold_italic.family = font.name;
        offset.y = -1;
      };
    } // colors;
  };
}
