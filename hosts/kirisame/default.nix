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
    ./environment.nix
    ./nix-config.nix
    ../../common/users
  ];

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      intel-media-sdk
      libvdpau-va-gl
    ];
  };

  services = {
    dbus.enable = true;
    displayManager.defaultSession = "none+i3";
    xserver = {
      enable = true;
      windowManager.i3.enable = true;
      xkb.layout = "br";
      exportConfiguration = true;
      displayManager.lightdm.enable = false;
      videoDrivers = [ "modesetting" ];
    };
    ratbagd.enable = true;
    gvfs.enable = true;
    tumbler.enable = true;
  };

  # "fixes" nix-index erroring (for some reason it doesn't like this enabled?)
  programs.command-not-found.enable = false;

  console = {
    font = "Lat2-Terminus16";
    keyMap = "br-abnt2";
  };
  i18n.defaultLocale = "en_GB.UTF-8";
  time.timeZone = "America/Sao_Paulo";
  system.stateVersion = "23.11";
}
