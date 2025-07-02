{ inputs, system, ... }: {
  home.packages = [ inputs.tundra.packages.${system}.scientifica-nerd-font ];
  programs.eww = {
    enable = true;
    configDir = ./config;
  };
}
