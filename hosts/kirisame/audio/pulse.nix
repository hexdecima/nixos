{ pkgs, ... }: {
  services.pipewire.enable = false;
  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;
    support32Bit = true;
  };
}
