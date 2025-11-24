#!/bin/bash

echo " Server Stats ng PC mong Malupet"

echo ""
echo ">>> CPU Usage:"
top -bn1 | grep "Cpu(s)" | awk '{print "User: " $2 "%, System: " $4 "%, Idle: " $8 "%"}'

echo ""
echo ">>> Memory Usage:"
free -h | awk 'NR==2{printf "Used: %s / Total: %s (%.2f%%)\n", $3, $2, $3*100/$2 }'

echo ""
echo ">>> Disk Usage:"
df -h --total | grep "total" | awk '{printf "Used: %s / Total: %s (%s)\n", $3, $2, $5}'

echo ""
echo ">>> Top 5 Processes by CPU:"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6

echo ""
echo ">>> Top 5 Processes by Memory:"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6

echo "==================================================="
#Server-Performance-Stats

