{ pkgs, inputs, system, ... }: {
  gtk = {
    enable = true;
    font = {
      package = inputs.tundra.packages.${system}.departure-mono-nerd-font;
      name = "DepartureMono Nerd Font";
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
