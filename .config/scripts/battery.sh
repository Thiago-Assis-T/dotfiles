#!/bin/bash

# Check if battery exists
if [ -d /sys/class/power_supply/BAT0 ] || [ -d /sys/class/power_supply/BAT1 ]; then
  # Get battery capacity
  capacity=$(cat /sys/class/power_supply/BAT*/capacity 2>/dev/null | head -1)

  # Get battery status (Charging/Discharging/Full)
  status=$(cat /sys/class/power_supply/BAT*/status 2>/dev/null | head -1)

  # Choose icon based on status and capacity using Nerd Fonts
  if [ "$status" = "Charging" ]; then
    icon="󰂄"        # Battery charging icon
    color="#8be9fd" # Charging color
  elif [ "$status" = "Full" ]; then
    icon="󰁹"        # Battery full icon
    color="#50fa7b" # Normal color
  else
    # Discharging or Unknown status - show level-based icons
    if [ "$capacity" -ge 95 ]; then
      icon="󰁹" # 100%
    elif [ "$capacity" -ge 90 ]; then
      icon="󰂂" # 90%
    elif [ "$capacity" -ge 80 ]; then
      icon="󰂁" # 80%
    elif [ "$capacity" -ge 70 ]; then
      icon="󰂀" # 70%
    elif [ "$capacity" -ge 60 ]; then
      icon="󰁿" # 60%
    elif [ "$capacity" -ge 50 ]; then
      icon="󰁾" # 50%
    elif [ "$capacity" -ge 40 ]; then
      icon="󰁽" # 40%
    elif [ "$capacity" -ge 30 ]; then
      icon="󰁼" # 30%
    elif [ "$capacity" -ge 20 ]; then
      icon="󰁻" # 20%
    elif [ "$capacity" -ge 10 ]; then
      icon="󰁺" # 10%
    else
      icon="󰂎" # 0% or critical
    fi

    # Set color based on battery level for discharging state
    if [ "$capacity" -lt 20 ]; then
      color="#ff5555" # Below 20%
    elif [ "$capacity" -lt 30 ]; then
      color="#ffb86c" # Below 30%
    elif [ "$capacity" -lt 50 ]; then
      color="#f1fa8c" # Below 50%
    else
      color="#50fa7b" # Normal color (50% and above)
    fi
  fi

  # Output for i3blocks
  echo "$icon $capacity%"
  echo "$icon $capacity%"
  echo "$color"
fi
