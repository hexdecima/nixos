{ pkgs, inputs, system, unstable, ... }: 
let 
  inherit (pkgs) lib;
in
{
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
      transmission_3
      transmission_3-gtk
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
      vulkan-tools

      zip
      unzip
      unrar
      git
      imv
      mpv
      cachix
      wmctrl
      p7zip
      nix-tree
      ffmpeg
      (wrapOBS { plugins = with obs-studio-plugins; [ wlrobs ]; })
      xorg.xinit
      charm-freeze
      # override `coreutils`'s binaries.
      (lib.hiPrio uutils-coreutils-noprefix)

      nodejs_22
      cargo
      cargo-info
    ];
}
