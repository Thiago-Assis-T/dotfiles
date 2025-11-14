#!/bin/bash

# Network information
network_info=$(ip route get 1.1.1.1 2>/dev/null | awk '{print $5}' | head -1)

# Check if we're running in tmux (looking for TMUX environment variable)
if [ -n "$TMUX" ]; then
  # Tmux format
  if [ -n "$network_info" ]; then
    case $network_info in
    wlan* | wlp*)
      network_icon="󰖩"
      ;;
    eth* | enp*)
      network_icon="󰈀"
      ;;
    *)
      network_icon="󰛳"
      ;;
    esac
    echo "#[fg=#bd93f9]$network_icon $network_info#[default]"
  else
    echo "#[fg=#ff5555]󰖪 Disconnected#[default]"
  fi
else
  # i3blocks format (original)
  if [ -n "$network_info" ]; then
    case $network_info in
    wlan* | wlp*)
      network_icon="󰖩 "
      ;;
    eth* | enp*)
      network_icon="󰈀 "
      ;;
    *)
      network_icon="󰛳 "
      ;;
    esac
    echo "<span color='#bd93f9'>$network_icon $network_info</span>"
  else
    echo "<span color='#ff5555'>󰖪 Disconnected</span>"
  fi
fi
