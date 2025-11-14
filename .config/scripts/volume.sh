#!/bin/bash

# Volume level using pactl
if command -v pactl &>/dev/null; then
  volume_info=$(pactl get-sink-mute @DEFAULT_SINK@ 2>/dev/null)
  if echo "$volume_info" | grep -q "no"; then
    volume_level=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | head -1 | tr -d '%')

    # Different volume icons based on level
    if [ "$volume_level" -eq 0 ]; then
      volume_icon="󰖁"
    elif [ "$volume_level" -le 30 ]; then
      volume_icon="󰕿"
    elif [ "$volume_level" -le 70 ]; then
      volume_icon="󰖀"
    else
      volume_icon="󰕾"
    fi

    # Color coding for volume level
    if [ "$volume_level" -ge 100 ]; then
      vol_color="#ff5555" # Red for max volume
    elif [ "$volume_level" -ge 80 ]; then
      vol_color="#ffb86c" # Orange for high volume
    else
      vol_color="#f1fa8c" # Yellow for normal volume
    fi

    echo "<span color='$vol_color'>$volume_icon $volume_level%</span>"
  else
    echo "<span color='#ff5555'>󰖁 Muted</span>"
  fi
else
  echo "<span color='#6272a4'>󰕾 N/A</span>"
fi
