#!/bin/bash

THRESHOLD=80% # Define the disk usage threshold (in percentage)

# Use the df command to get disk usage
disk_usage=$(df -h --output=pcent | tail -n +2 | sort -nr | head -n 1 | sed 's/%//g')

# Check if disk_usage is a valid number
if ! [[ "$disk_usage" =~ ^[0-9]+$ ]]; then
  echo "Error: Could not retrieve disk usage information."
  exit 1
fi

echo "Current disk usage: $disk_usage%"

# If the disk usage exceeds the threshold, display an alert message
if (( disk_usage >= THRESHOLD )); then
  echo "ALERT: Disk usage ($disk_usage%) exceeds or equals the threshold of $THRESHOLD%!"
else
  echo "Disk usage is within acceptable limits."
fi
