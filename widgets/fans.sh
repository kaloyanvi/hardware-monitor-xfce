#!/usr/bin/env bash

# Portable directory
readonly DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Size used for the icons is 24x24 (16x16 is also ok for a smaller panel)
readonly ICON="${DIR}/icons/fan.png"

# RPM values
readonly CPU_COOLER="$(sensors | grep -A 0 fan2 | cut -c24-32)"
readonly CASE_FAN1="$(sensors | grep -A 0 fan3 | cut -c24-32)"
readonly CASE_FAN2="$(sensors | grep -A 0 fan5 | cut -c24-32)"

# Panel
if [[ $(file -b "${ICON}") =~ PNG|SVG ]]; then
  INFO="<img>${ICON}</img>"
else
  INFO="<txt>"
fi
INFO+="</txt>"

# Tooltip
MORE_INFO="<tool>"
MORE_INFO+="┌ Fans\n"
MORE_INFO+="├─ CPU Cooler\t\t${CPU_COOLER}\n"
MORE_INFO+="├─ Case Fan 1\t\t${CASE_FAN1}\n"
MORE_INFO+="└─ Case Fan 2\t\t${CASE_FAN2}\n"
MORE_INFO+="</tool>"

# Output panel
echo -e "${INFO}"

# Output hover menu
echo -e "${MORE_INFO}"