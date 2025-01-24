{
  programs.tmux = {
    enable = true;
    extraConfig = ''
      set -g prefix C-s
      unbind C-b
      set -g base-index 1
      set -g pane-base-index 1
      set -g default-terminal "screen-256color"
      set -ga terminal-overrides ",*256col*:Tc"

      set-window-option -g mode-keys vi
      bind-key -T copy-mode-vi 'v' send -X begin-selection
      bind-key -T copy-mode-vi 'y' send -X copy-selection-and-cancel

      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R
      bind c new-window -c "#{pane_current_path}"
      bind  %  split-window -h -c "#{pane_current_path}"
      bind '"' split-window -v -c "#{pane_current_path}"
      bind v set -g status

      set -g mode-style "fg=#E0DEF4,bg=#111111"

      set -g message-style "fg=#E0DEF4,bg=#111111"
      set -g message-command-style "fg=#E0DEF4,bg=#111111"

      set -g pane-border-style "fg=#111111"
      set -g pane-active-border-style "fg=#E0DEF4"

      set -g status "on"
      set -g status-justify "left"
      set -g status-style "fg=#000000,bg=#000000"

      set -g status-left "#[fg=#888888,bg=#000000] #S "

      setw -g window-status-activity-style "underscore,fg=#828bb8,bg=#000000"
      setw -g window-status-separator ""
      setw -g window-status-style "NONE,fg=#828bb8,bg=#111111"
      setw -g window-status-format "#[fg=#888888,bg=#111111]  #W #I #F "
      setw -g window-status-current-format "#[fg=#E0DEF4,bg=#000000,bold]  #W #F "
    '';
  };
}
