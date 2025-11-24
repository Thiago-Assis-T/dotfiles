#!/bin/bash

# Get the uptime and extract the duration part
uptime_formatted=$(uptime | awk -F'up' '{print $2}' | awk -F',' '{print $1 $2}' | sed 's/^[ ]*//; s/[ ]*$//' | sed 's/,[^,]*$//')

# Alternative method that's more reliable
# uptime_formatted=$(uptime | sed -E 's/.*up[[:space:]]*([^,]*(\.[^,]*)?).*/\1/')

# Another alternative using the -p flag if available
if uptime -p &>/dev/null; then
  uptime_formatted=$(uptime -p | sed 's/^up //')
else
  # Fallback to parsing the regular uptime output
  uptime_formatted=$(uptime | awk -F'up' '{print $2}' | awk -F',' '{print $1}' | sed 's/^[ ]*//; s/[ ]*$//')
fi

echo "<span color='#f1fa8c'>󰔟 $uptime_formatted</span>"
