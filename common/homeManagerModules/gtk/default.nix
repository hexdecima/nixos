{ pkgs, ... }: {
  gtk = {
    enable = true;
    font = {
      package = pkgs.miracode;
      name = "Miracode";
      size = 18;
    };
    theme = {
      package = pkgs.tokyonight-gtk-theme;
      name = "Tokyonight-Storm-B";
    };
    iconTheme = {
      package = pkgs.tokyonight-gtk-theme;
      name = "Tokyonight-Dark-Cyan";
    };
  };
}
