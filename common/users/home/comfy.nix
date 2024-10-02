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
    font.package = inputs.nixprs.packages.${system}.zpix-nerd-font;
    font.name = "Zpix Nerd Font";
    font.size = 18;
  };

  home = {
    username = "comfy";
    stateVersion = "23.05";
    homeDirectory = "/home/comfy";
    sessionVariables = {
      GTK_USE_PORTAL = "1";
      EDITOR = "nvim";
    };

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
