#!/bin/bash

THRESHOLD=80
DISK_INFO=$(df -BG / | tail -1)  # get disk info in GB
USAGE_PERCENT=$(echo $DISK_INFO | awk '{print $5}' | sed 's/%//')
USED_GB=$(echo $DISK_INFO | awk '{print $3}' | sed 's/G//')
AVAILABLE_GB=$(echo $DISK_INFO | awk '{print $4}' | sed 's/G//')

if [ "$USAGE_PERCENT" -ge "$THRESHOLD" ]; then
    echo "Warning! Disk usage is at $USAGE_PERCENT% ($USED_GB GB used, $AVAILABLE_GB GB available)."
else
    echo "Disk usage is fine: $USAGE_PERCENT% ($USED_GB GB used, $AVAILABLE_GB GB available)."
fi

