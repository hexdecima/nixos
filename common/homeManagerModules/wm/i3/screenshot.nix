{ writeShellScript, maim, xclip, coreutils, libnotify, ... }:
writeShellScript "screenshot" ''
  get_screenshot_dir() {
    echo "$HOME/imgs/screenshots"
  }

  get_file_name() {
    echo "$(get_screenshot_dir)/$(date +capture_%d_%m_%Y-%H:%M:%S).png"
  }

  capture_area() {
    ${maim}/bin/maim -s | \
      ${coreutils}/bin/tee $(get_file_name) | \
      ${xclip}/bin/xclip -selection clipboard -t image/png
    ${libnotify}/bin/notify-send "area capture saved and copied to clipboard."\ 
      echo "area capture saved and copied to clipboard."
  }

  capture_screen() {
    ${maim}/bin/maim | \
      ${coreutils}/bin/tee $(get_file_name) | \
      ${xclip}/bin/xclip -selection clipboard -t image/png
    ${libnotify}/bin/notify-send "screen capture saved and copied to clipboard." || \
      echo "screen capture saved and copied to clipboard."
  }

  if [[ $1 == "area" ]]; then
    capture_area
  elif [[ $1 == "screen" ]]; then
    capture_screen
  else 
    echo -e "'\$1' must be 'area' or 'screen'."
    exit 1
  fi
''
