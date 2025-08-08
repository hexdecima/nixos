{ pkgs, unstable, inputs, system, ... }:
let
  font = {
    # package = inputs.tundra.packages.${system}.scientifica-nerd-font;
    # name = "Scientifica Nerd Font";
    package = pkgs.nerd-fonts.shure-tech-mono;
    name = "ShureTechMono Nerd Font";
    size = 24;
  };
  colours = builtins.fromTOML (builtins.readFile ./colours.toml);
in {
  home.packages = [ font.package ];
  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = 0.95;
      font = with font; {
        inherit size;
        normal.family = name;
        bold.family = name;
        italic.family = name;
        bold_italic.family = name;
        offset.y = -1;
      };
    } // colours;
  };
}
