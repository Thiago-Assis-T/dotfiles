#!/bin/bash

date_formatted=$(date "+%a %m-%d %H:%M")

# Check if we're running in tmux (looking for TMUX environment variable)
if [ -n "$TMUX" ]; then
  # Tmux format with hex color
  echo "#[fg=#ff79c6]󰃶 $date_formatted#[default]"
else
  # i3blocks format (original)
  echo "<span color='#ff79c6'>󰃶  $date_formatted</span>"
fi
