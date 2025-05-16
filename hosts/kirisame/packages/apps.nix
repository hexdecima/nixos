{ pkgs, inputs, system, unstable, ... }:
let
  wayland = inputs.wayland.packages.${system};
  zen-browser = inputs.zen-flake.packages.${system};
in {
  programs.wireshark = {
    enable = true;
    package = pkgs.wireshark;
  };
  environment.systemPackages = [ zen-browser.default ] ++ (with pkgs; [
    libsForQt5.okular
    libsForQt5.kdenlive
    vlc
    xfce.tumbler
    tenacity
    krita
    libreoffice-fresh
    obsidian
    emote

    (vivaldi.override { proprietaryCodecs = true; })
    tor-browser
    librewolf
    lynx
    bombadillo
    newsboat

    hyprpicker
    localsend
    wayland.wf-recorder
  ]) ++ (with unstable; [
    floorp
    vesktop
    cosmic-files
    cosmic-term
    cosmic-screenshot
    cosmic-notifications
  ]);
}
