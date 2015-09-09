#!/bin/bash
cat ~/.hammerspoon/logs/app_event*.log | sort -nk3 | awk '$2 == 5 {s[pn]+=$3-pt; c[pn]++; pt=$3; pn=$1; } END {printf("%10s%12s%10s  %-30s\n", "Total Time", "Total Count", "Avg Time", "App Name");for (i in s) {printf("%10s%12s%10s  %-30s\n", s[i], c[i], s[i]/c[i], i)}}' | awk 'NR == 1; NR > 2 {print $0 | "sort -rn"}'
