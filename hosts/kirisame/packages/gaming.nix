{ pkgs, unstable, ... }: {
  programs.gamemode.enable = true;
  programs.gamescope.enable = true;
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    extraCompatPackages = [ pkgs.proton-ge-bin ];
  };

  environment.systemPackages = let
    yourUsualWineDepsYeehaw = with pkgs; [
      libpng
      giflib
      ncurses
      gnutls
      mpg123
      openal
      v4l-utils
      alsa-lib
      libjpeg
      libpulseaudio
      alsa-plugins
      xorg.libXcomposite
      xorg.libXinerama
      libgcrypt
      ocl-icd
      libxslt
      libva
      gtk3
      gst_all_1.gst-plugins-base
      gst_all_1.gstreamer
      gst_all_1.gst-plugins-good
      gst_all_1.gst-plugins-bad
      gst_all_1.gst-plugins-ugly
      cups
      dosbox
      dxvk
    ];
  in yourUsualWineDepsYeehaw ++ (with pkgs; [ lutris prismlauncher dotnet-sdk ])
  ++ (with unstable; [
    wineWowPackages.stagingFull
    winetricks
    # osu 404ing for some reason
    # osu-lazer-bin
    dwarf-fortress
    nethack
    (retroarch.withCores (cores: with cores; [ mgba dolphin pcsx2 ]))
  ]);
}
