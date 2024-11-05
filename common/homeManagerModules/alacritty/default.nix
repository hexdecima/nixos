{ inputs, system, pkgs, ... }:
let
  font = {
    package = inputs.nixprs.packages.${system}.scientifica-nerd-font;
    name = "Scientifica Nerd Font";
    # package = pkgs.miracode;
    # name = "Miracode";
    size = 16;
  };
in {
  home.packages = [ font.package ];
  programs.alacritty = {
    enable = true;
    settings = {
      window = { opacity = 0.9; };
      colors.draw_bold_text_with_bright_colors = true;
      font = {
        size = font.size;
        normal.family = font.name;
        bold.family = font.name;
        italic.family = font.name;
        bold_italic.family = font.name;
        offset.y = -1;
      };
      colors = {
        primary = {
          background = "0x000000";
          foreground = "#E1D4D4";
        };
        cursor = {
          cursor = "#E7DDDD";
          text = "#1A1825";
        };
        normal = {
          black = "#1A1825";
          blue = "#9CCFD8";
          cyan = "#9CCFD8";
          green = "#317490";
          magenta = "#C4A7E7";
          red = "#EB7193";
          white = "#E1D4D4";
          yellow = "#F6C074";
        };
        bright = {
          black = "#3A3651";
          red = "#F289A4";
          green = "#358DAF";
          yellow = "#F9CA8E";
          blue = "#94DAE6";
          magenta = "#CEB3EF";
          cyan = "#94DAE6";
          white = "#BF9B99";
        };
        selection = {
          background = "0x2d4f67";
          foreground = "0xc8c093";
        };
      };
    };
  };
}
