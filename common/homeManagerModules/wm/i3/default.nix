{ pkgs, unstable, config, ... }:
let
  joinLines = lines: builtins.concatStringsSep "\n" lines;
  screenshot = import ./screenshot.nix pkgs;
in {
  home.packages = with pkgs; [ nitrogen picom maim xclip dmenu mako ];
  home.file.".xinitrc".text = ''
    unset QT_QPA_PLATFORM
    unset SDL_VIDEODRIVER
    unset WAYLAND_DISPLAY
    export XDG_CURRENT_DESKTOP="xfce"

    start-pulseaudio-x11
    exec i3
  '';
  xsession.windowManager.i3 = {
    enable = true;
    extraConfig = let
      keys = {
        mod = config.xsession.windowManager.i3.config.modifier;
        left = "h";
        right = "l";
        up = "k";
        down = "j";
      };
      apps = {
        launcher = "${pkgs.dmenu}/bin/dmenu_run";
        terminal = "${pkgs.alacritty}/bin/alacritty";
        screenshot = {
          area = "${screenshot} area";
          screen = "${screenshot} screen";
        };
        fileBrowser = "${unstable.nemo-with-extensions}/bin/nemo";
      };
      binds = {
        sym = joinLines (builtins.map (line: "bindsym ${line}") [
          "XF86AudioRaiseVolume exec pactl set-sink-volume @DEFAULT_SINK@ +5%"
          "XF86AudioLowerVolume exec pactl set-sink-volume @DEFAULT_SINK@ -5%"
          "XF86AudioMute exec pactl set-sink-mute @DEFAULT_SINK@ toggle"
          "${keys.mod}+q kill"
          "${keys.mod}+Shift+c reload"
          "${keys.mod}+shift+q exit"
          "${keys.mod}+f fullscreen"
          "${keys.mod}+Space floating toggle"
          "${keys.mod}+Shift+Space focus mode_toggle"
          "${keys.mod}+1 workspace 1"
          "${keys.mod}+2 workspace 2"
          "${keys.mod}+3 workspace 3"
          "${keys.mod}+4 workspace 4"
          "${keys.mod}+5 workspace 5"
          "${keys.mod}+6 workspace 6"
          "${keys.mod}+7 workspace 7"
          "${keys.mod}+8 workspace 8"
          "${keys.mod}+9 workspace 9"
          "${keys.mod}+0 workspace 10"
          "${keys.mod}+Shift+1 move container to workspace 1"
          "${keys.mod}+Shift+2 move container to workspace 2"
          "${keys.mod}+Shift+3 move container to workspace 3"
          "${keys.mod}+Shift+4 move container to workspace 4"
          "${keys.mod}+Shift+5 move container to workspace 5"
          "${keys.mod}+Shift+6 move container to workspace 6"
          "${keys.mod}+Shift+7 move container to workspace 7"
          "${keys.mod}+Shift+8 move container to workspace 8"
          "${keys.mod}+Shift+9 move container to workspace 9"
          "${keys.mod}+Shift+0 move container to workspace 10"
          "${keys.mod}+${keys.up} focus up"
          "${keys.mod}+${keys.right} focus right"
          "${keys.mod}+${keys.down} focus down"
          "${keys.mod}+${keys.left} focus left"
          "${keys.mod}+Shift+${keys.up} move up"
          "${keys.mod}+Shift+${keys.right} move right"
          "${keys.mod}+Shift+${keys.down} move down"
          "${keys.mod}+Shift+${keys.left} move left"

          "Print exec ${apps.screenshot.screen}"
          "Shift+Print exec ${apps.screenshot.area}"
          "${keys.mod}+d exec ${apps.launcher}"
          "${keys.mod}+Return exec ${apps.terminal}"
          "${keys.mod}+n exec ${apps.fileBrowser}"
        ]);
      };
    in joinLines [
      ''
        exec --no-startup-id ${pkgs.nitrogen}/bin/nitrogen --restore
        exec --no-startup-id ${pkgs.picom}/bin/picom -CGb
        exec --no-startup-id ${pkgs.mako}/bin/mako
        exec --no-startup-id fcitx5 -r

        default_border pixel 0
        default_floating_border pixel 0
      ''
      binds.sym
    ];
  };
  xsession.windowManager.i3.config = {
    modifier = "Mod4";
    keybindings = { }; # no defaults.
    bars = [ ]; # no bars.
  };
}
