{ pkgs, ... }:
let
  font = {
    package = pkgs.miracode;
    name = "Miracode";
    size = 24;
  };
  colours = builtins.fromTOML (builtins.readFile ./colours.toml);
in {
  home.packages = [ font.package ];
  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = 0.9;
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
