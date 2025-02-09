{ pkgs, ... }: {
  gtk = {
    enable = true;
    font = {
      package = pkgs.nerdfonts.override { fonts = [ "UbuntuMono" ]; };
      name = "UbuntuMono Nerd Font";
      size = 18;
    };
    theme = {
      package = pkgs.rose-pine-gtk-theme;
      name = "rose-pine-moon";
    };
    iconTheme = {
      package = pkgs.rose-pine-icon-theme;
      name = "rose-pine-moon";
    };
  };
}
