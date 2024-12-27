{ inputs, system, pkgs, ... }: {
  imports = with inputs.self.homeManagerModules; [
    alacritty
    cursor
    gpg
    ssh
    tmux
    eww
    shells.fish
    shells.zsh
    shells.starship
    shells.nu
    wm.niri
    wm.i3
  ];

  gtk = {
    enable = true;
    font.package = pkgs.miracode;
    font.name = "Miracode";
    font.size = 18;
  };

  home = {
    username = "mai";
    stateVersion = "23.05";
    homeDirectory = "/home/mai";
    sessionVariables.EDITOR = "nvim";

    packages = let patchy = inputs.patchy.packages.${system};
    in with pkgs; [ patchy.neovim weechat neomutt ];
  };

  programs.git = {
    enable = true;
    extraConfig = {
      init.defaultBranch = "main";
      push.default = "current";
    };
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
