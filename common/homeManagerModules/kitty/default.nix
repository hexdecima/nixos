{ unstable, ... }: {
  home.packages = [ unstable.kitty ];
  home.file.".config/kitty/kitty.conf".source = ./kitty.conf;
}
