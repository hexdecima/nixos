{ inputs, system, ... }: {
  home.packages = [ inputs.nixprs.packages.${system}.scientifica-nerd-font ];
  programs.eww = {
    enable = true;
    configDir = ./config;
  };
}
