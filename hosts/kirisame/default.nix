{ pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./fonts.nix
    ./audio
    ./packages
    ./security
    ./networking
    ./boot
    ./desktop
    ./input.nix
    ./virtualisation.nix
    ../../common/users
  ];

  nix = {
    package = pkgs.nixFlakes;
    settings = rec {
      experimental-features = [ "nix-command" "flakes" ];
      trusted-users = [ "@wheel" ];
      log-lines = 20;
      connect-timeout = 20;
      download-attempts = 10;
      substituters = [
        "https://cache.nixos.org"
        "https://nixpkgs-wayland.cachix.org"
        "https://nix-community.cachix.org"
        "https://cache.lix.systems"
      ];
      trusted-substituters = substituters;
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nixpkgs-wayland.cachix.org-1:3lwxaILxMRkVhehr5StQprHdEo4IrE8sRho9R9HOLYA="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "cache.lix.systems:aBnZUw8zA7H35Cz2RyKFVs3H4PlGTLawyY5KRbvJR8o="
      ];
    };
  };
  nixpkgs.config.allowUnfree = true;

  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
    driSupport = true;
    extraPackages = with pkgs; [ intel-media-driver vaapiVdpau libvdpau-va-gl ];
  };

  environment.shells = with pkgs; [ zsh fish ];
  services = {
    dbus.enable = true;
    displayManager.defaultSession = "none+i3";
    xserver = {
      enable = true;
      windowManager.i3.enable = true;
      xkb.layout = "br";
      exportConfiguration = true;
      displayManager.lightdm.enable = false;
      videoDrivers = [ "video-intel" "mesa" "vulkan-intel" ];
    };
    ratbagd.enable = true;
    gvfs.enable = true;
    tumbler.enable = true;
  };

  environment.sessionVariables = rec {
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";
    XDG_BIN_HOME = "$HOME/.local/bin";

    PATH = [ "${XDG_BIN_HOME}" ];
    NIXOS_OZONE_WL = "1";
  };

  programs.command-not-found.enable = false;

  console = {
    font = "Lat2-Terminus16";
    keyMap = "br-abnt2";
  };
  i18n.defaultLocale = "en_GB.UTF-8";
  time.timeZone = "America/Sao_Paulo";
  system.stateVersion = "23.11";
}
