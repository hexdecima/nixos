{ inputs, system, ... }: {
  home.packages = [ inputs.nixprs.packages.${system}.bedstead-nerd-font ];
  programs.eww = {
    enable = true;
    configDir = ./config;
  };
}
