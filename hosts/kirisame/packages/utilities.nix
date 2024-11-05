{ pkgs, inputs, system, unstable, ... }: {
  programs.fish.enable = true;
  programs.zsh.enable = true;
  programs.dconf.enable = true;
  programs.gnupg.agent.enable = true;
  services.gnome.gnome-keyring.enable = true;
  environment.systemPackages = with pkgs;
    let nix-alien = inputs.nix-alien.packages.${system}.nix-alien;
    in [
      swww
      wl-clipboard
      xdg-utils
      glib
      grim
      slurp
      libnotify
      imagemagick
      num-utils
      luajit
      xorg.xhost
      inetutils
      nmap
      ripgrep
      jq
      fzf
      fd
      gnupg
      pinentry
      pulsemixer
      eza
      httpie
      wget
      htop
      btop
      dig
      du-dust
      bat
      transmission
      transmission-gtk
      piper
      pulseaudio
      pavucontrol
      toybox
      keepassxc
      bitwarden-cli
      yazi
      mlt
      unstable.xwayland-satellite
      parted
      nix-alien

      nix-prefetch-git
      zip
      unzip
      unrar
      git
      imv
      mpv
      keychain
      cachix
      wmctrl
      p7zip
      nix-tree
      ffmpeg
      (wrapOBS { plugins = with obs-studio-plugins; [ wlrobs ]; })
      xorg.xinit
      charm-freeze

      # should be devshells
      nodejs_18
      cargo
      cargo-info
    ];
}
