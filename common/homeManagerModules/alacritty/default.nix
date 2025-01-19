{ inputs, system, ... }:
let
  font = {
    package = inputs.nixprs.packages.${system}.scientifica-nerd-font;
    name = "Scientifica Nerd Font";
    size = 24;
  };
  colors = builtins.fromTOML (builtins.readFile ./colours.toml);
in {
  home.packages = [ font.package ];
  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = 0.9;
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
