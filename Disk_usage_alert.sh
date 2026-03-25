#!/bin/bash
# Disk Usage Alert Script
# Checks disk usage and sends an alert if it exceeds a specified threshold

#taking inputs
threshold=$1
email=$2

#validating inputs
if [[ ${#} -lt 2 ]]; then
    echo "Usage: $0 <threshold> <email>"
    exit 1
fi

#disk usage check
usage=$(df -h | awk 'NR==2 {print $5}' | tr -d %)

#logging setup
log_file=disk_usage_alert.log
echo "$(date):Disk usage is: ${usage}%" >> ${log_file}

#alert condition
if [[ ${usage} -gt ${threshold} ]]
then
     echo "Warning: Disk usage is:${usage}% which is above threshold: ${threshold}% " | mail -s "Disk Usage Alert" ${email}
     echo "Alert sent to ${email} at ${date}" >> ${log_file}
else
        echo "Disk usage is within limits: ${usage}%" >> ${log_file}
fi

