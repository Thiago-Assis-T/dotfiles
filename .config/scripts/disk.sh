#!/bin/bash

# Disk usage (root partition) in base-10
disk_usage=$(df -h / | awk 'NR==2{print $5}' | tr -d '%')
disk_used=$(df -h / | awk 'NR==2{print $3}')
disk_total=$(df -h / | awk 'NR==2{print $2}')

# Check if we're running in tmux (looking for TMUX environment variable)
if [ -n "$TMUX" ]; then
  # Tmux format with hex colors (foreground only)
  # Color coding for disk usage
  if [ "$disk_usage" -ge 90 ]; then
    disk_color="#[fg=#ff5555]" # Red for critical
  elif [ "$disk_usage" -ge 80 ]; then
    disk_color="#[fg=#ffb86c]" # Orange for high
  elif [ "$disk_usage" -ge 60 ]; then
    disk_color="#[fg=#f1fa8c]" # Yellow for medium
  else
    disk_color="#[fg=#ffb86c]" # Orange (theme color) for low
  fi

  echo "${disk_color}󰋊 ${disk_used}/${disk_total} ($disk_usage%)#[default]"
else
  # i3blocks format (original)
  # Color coding for disk usage
  if [ "$disk_usage" -ge 90 ]; then
    disk_color="#ff5555" # Red for critical
  elif [ "$disk_usage" -ge 80 ]; then
    disk_color="#ffb86c" # Orange for high
  elif [ "$disk_usage" -ge 60 ]; then
    disk_color="#f1fa8c" # Yellow for medium
  else
    disk_color="#ffb86c" # Orange (theme color) for low
  fi

  echo "<span color='$disk_color'>󰋊  ${disk_used}/${disk_total} ($disk_usage%)</span>"
fi
