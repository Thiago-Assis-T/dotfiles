#!/bin/bash
uptime_formatted=$(uptime | cut -d ',' -f1 | cut -d ' ' -f4,5 | tr -d ',')
echo "<span color='#f1fa8c'>󰔟 $uptime_formatted</span>"
