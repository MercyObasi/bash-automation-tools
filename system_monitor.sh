#!/bin/bash
# Enable debugging trace so we can see how variables change
#set -x


 echo "=========================================="
 echo "          SYSTEM HEALTH MONITOR           "
 echo "=========================================="
 echo "Checked on: $(date)"


# Define our warning thresholds (in percentages)
 DISK_THRESHOLD=80

# Get the usage percentage of the main hard drive (/)
# We use 'awk' to grab the 5th column and 'tr' to remove the % sign
 CURRENT_DISK=$(df / | awk 'NR==2 {print $5}' | tr -d '%')
 
 echo "Current Disk Usage: ${CURRENT_DISK}%"

 # Check if current disk usage is Greater Than (-gt) our threshold
 if [[ "$CURRENT_DISK" -gt "$DISK_THRESHOLD" ]]; then
	 echo "WARNING: Disk usage is critically high at ${CURRENT_DISK}%!"

	 # Log the warning to a file for Github tracking
	 echo "$(date) - ALERT: Disk usage at ${CURRENT_DISK}%" >> system_alerts.log
 else
	 echo "Disk space is healthy."
 fi


 echo "==========================================="
