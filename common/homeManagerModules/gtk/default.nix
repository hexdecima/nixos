{ pkgs, inputs, system, ... }: {
  gtk = {
    enable = true;
    font = {
      package = inputs.nixprs.packages.${system}.monofoki-nerd-font;
      name = "Monofoki Nerd Font";
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
