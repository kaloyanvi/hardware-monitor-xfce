#!/usr/bin/env bash

# Portable directory
readonly DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Size used for the icons is 24x24 (16x16 is also ok for a smaller panel)
readonly ICON="${DIR}/icons/cpu.png"

# Available CPUs - threads are looked at as cores
declare -r CPU_ARRAY=($(awk '/MHz/{print $4}' /proc/cpuinfo | cut -f1 -d"."))
# Number of logical CPU
readonly NUM_OF_CPUS="${#CPU_ARRAY[@]}"

# Tooltip
MORE_INFO="<tool>"
MORE_INFO+="┌ $(grep "model name" /proc/cpuinfo | cut -f2 -d ":" | sed -n 1p | sed -e 's/^[ \t]*//')\n" # CPU vendor, model, clock
STEP=0 # to generate CPU numbers (eg. CPU0, CPU1 ...)
for CPU in "${CPU_ARRAY[@]}"; do
  STDOUT=$(( STDOUT + CPU ))
  MORE_INFO+="├─ CPU ${STEP}: ${CPU} MHz\n"
  let STEP+=1
done
MORE_INFO+="└─ Temperature: $(sensors | grep -A 0 SMBUSMASTER | cut -c26-30)"
MORE_INFO+="</tool>"
STDOUT=$(( STDOUT / NUM_OF_CPUS )) # calculate average clock speed
STDOUT=$(awk '{$1 = $1 / 1024; printf "%.2f%s", $1, "GHz"}' <<< "${STDOUT}")
TEMP="$(sensors | grep -A 0 SMBUSMASTER | cut -c26-30)"

# Panel
if [[ $(file -b "${ICON}") =~ PNG|SVG ]]; then
  INFO="<img>${ICON}</img>"
  if hash xfce4-taskmanager &> /dev/null; then
    INFO+="<click>xfce4-taskmanager</click>"
  fi
  INFO+="<txt>"
else
  INFO="<txt>"
fi
INFO+=" ${STDOUT}"
INFO+=" - $TEMP"C"  "
INFO+="</txt>"

# Output panel
echo -e "${INFO}"

# Output hover menu
echo -e "${MORE_INFO}"