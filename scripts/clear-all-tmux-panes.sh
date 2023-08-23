#!/usr/bin/bash
# Clear all tmux panes
tmux list-windows -a -F '#{window_id}' | \
  xargs -I{} tmux list-panes -t {} -F '#{pane_id}' | \
  xargs -I{} tmux send-keys -t {} 'C-l'

