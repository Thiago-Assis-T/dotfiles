#!/bin/bash

# CPU usage (1-second average)
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{printf "%.1f%%", $2}')

# CPU temperature from k10temp (Ryzen) or fallback
cpu_temp=$(sensors k10temp-pci-00c3 -u 2>/dev/null | awk '/temp1_input/ {printf "%.0f", $2}')
if [ -z "$cpu_temp" ]; then
  if [ -f /sys/class/thermal/thermal_zone2/temp ]; then
    cpu_temp=$(($(cat /sys/class/thermal/thermal_zone2/temp) / 1000))
  else
    cpu_temp="N/A"
  fi
fi

# Check if we're running in tmux (looking for TMUX environment variable)
if [ -n "$TMUX" ]; then
  # Tmux format with hex colors (foreground only)
  # Color coding for temperature
  if [ "$cpu_temp" != "N/A" ]; then
    if [ "$cpu_temp" -ge 80 ]; then
      temp_color="#[fg=#ff5555]" # Red for high temp
    elif [ "$cpu_temp" -ge 70 ]; then
      temp_color="#[fg=#ffb86c]" # Orange for warm
    else
      temp_color="#[fg=#8be9fd]" # Cyan for normal
    fi
    temp_display="${temp_color} ${cpu_temp}°C#[default]"
  else
    temp_display=" N/A"
  fi

  # Color coding for CPU usage
  if (($(echo "$cpu_usage > 80" | bc -l))); then
    cpu_color="#[fg=#ff5555]" # Red for high usage
  elif (($(echo "$cpu_usage > 60" | bc -l))); then
    cpu_color="#[fg=#ffb86c]" # Orange for medium usage
  else
    cpu_color="#[fg=#8be9fd]" # Cyan for normal usage
  fi

  echo "${cpu_color} $cpu_usage#[default] $temp_display"
else
  # i3blocks format (original)
  # Color coding for temperature
  if [ "$cpu_temp" != "N/A" ]; then
    if [ "$cpu_temp" -ge 80 ]; then
      temp_color="#ff5555" # Red for high temp
    elif [ "$cpu_temp" -ge 70 ]; then
      temp_color="#ffb86c" # Orange for warm
    else
      temp_color="#8be9fd" # Cyan for normal
    fi
    temp_display="<span color='$temp_color'>  ${cpu_temp}°C</span>"
  else
    temp_display=" N/A"
  fi

  # Color coding for CPU usage
  if (($(echo "$cpu_usage > 80" | bc -l))); then
    cpu_color="#ff5555" # Red for high usage
  elif (($(echo "$cpu_usage > 60" | bc -l))); then
    cpu_color="#ffb86c" # Orange for medium usage
  else
    cpu_color="#8be9fd" # Cyan for normal usage
  fi

  echo "<span color='$cpu_color'>   $cpu_usage</span>  $temp_display"
fi
