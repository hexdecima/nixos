{ pkgs, inputs, system, unstable, ... }:
let wayland = inputs.wayland.packages.${system};
in {
  programs.wireshark = {
    enable = true;
    package = pkgs.wireshark;
  };
  environment.systemPackages = with pkgs;
    [
      libsForQt5.okular
      libsForQt5.kdenlive
      vlc
      xfce.tumbler
      tenacity
      krita
      (vivaldi.override { proprietaryCodecs = true; })
      libreoffice-fresh
      obsidian
      emote

      # browsers
      firefox-devedition
      floorp
      tor-browser
      librewolf
      lynx
      bombadillo
      newsboat

      hyprpicker
      localsend
      wayland.wf-recorder

    ] ++ (with unstable; [
      poezio # TUI xmpp client
      cosmic-files
      cosmic-term
      cosmic-screenshot
      cosmic-notifications
    ]);
}
