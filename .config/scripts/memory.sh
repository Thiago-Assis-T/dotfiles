#!/bin/bash

# Memory usage in base-10 (GB)
memory_total=$(free --si -g | awk 'NR==2{print $2}')
memory_used=$(free --si -g | awk 'NR==2{print $3}')
memory_percent=$(free | awk 'NR==2{printf "%.1f", $3/$2*100}')

# Check if we're running in tmux (looking for TMUX environment variable)
if [ -n "$TMUX" ]; then
  # Tmux format with hex colors
  # Color coding for memory usage
  if (($(echo "$memory_percent > 90" | bc -l))); then
    mem_color="#[fg=colour255,bg=#ff5555]" # White on red for critical
  elif (($(echo "$memory_percent > 75" | bc -l))); then
    mem_color="#[fg=colour232,bg=#ffb86c]" # Dark text on orange for high
  elif (($(echo "$memory_percent > 50" | bc -l))); then
    mem_color="#[fg=colour232,bg=#f1fa8c]" # Dark text on yellow for medium
  else
    mem_color="#[fg=#50fa7b]" # Green for low
  fi

  # Compact format for tmux
  echo "${mem_color} ${memory_used}G/${memory_total}G ($memory_percent%)#[default]"
else
  # i3blocks format (original)
  # Color coding for memory usage
  if (($(echo "$memory_percent > 90" | bc -l))); then
    mem_color="#ff5555" # Red for critical
  elif (($(echo "$memory_percent > 75" | bc -l))); then
    mem_color="#ffb86c" # Orange for high
  elif (($(echo "$memory_percent > 50" | bc -l))); then
    mem_color="#f1fa8c" # Yellow for medium
  else
    mem_color="#50fa7b" # Green for low
  fi

  echo "<span color='$mem_color'>  ${memory_used}G/${memory_total}G ($memory_percent%)</span>"
fi
