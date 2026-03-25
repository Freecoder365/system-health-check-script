#!/bin/bash
# System Health Check Script
# Displays memory, disk, uptime, and top processes

echo "========== SYSTEM HEALTH REPORT =========="

#Checking free memory available
free_mem=$(free -m | awk '/^Mem:/ {print $4}')
echo "Free Memory: ${free_mem} MB"

#Checking disk usage
disk_usage=$(df -h | awk 'NR==2 {print $5}')
echo "Disk_usage: ${disk_usage}"

#Checking system uptime
uptime=$(uptime -p)
echo "System uptime: ${uptime}"

#Checking top 5 processes by memory usage
echo ""
echo "Top 5 processes by memory usage:"
ps -eo pid,cmd,%cpu --sort=-%cpu| head -6  

#low memory warning
echo ""
threshold=500
if [[ $free_mem -lt $threshold ]]
then
     echo "Warning: Free memory is below threshold!"
else
     echo "Memory status is healthy."
fi

echo "========================================"

