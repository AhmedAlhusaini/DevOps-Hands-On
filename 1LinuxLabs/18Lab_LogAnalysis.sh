#!/usr/bin/bash
# Lab: Log Analysis Script
# Description: This script analyzes system logs for specific patterns and outputs the results.
# Usage: ./18Lab_LogAnalysis.sh
# Ensure the script is run with root privileges


journalctl -n 20
journalctl -p err
journalctl --system | grep -i "machine"
journalctl --since yesterday
journalctl --since today
timeout 30 journalctl -f



if [ "$(id -u)" -ne 0 ]; then
	echo "This script must be run as root. Please use sudo."
	exit 1
fi
# Define log file to analyze
LOG_FILE="/var/log/syslog"
# Check if the log file exists
if [ ! -f "$LOG_FILE" ]; then
	echo "Log file $LOG_FILE does not exist. Please check the path."
	exit 1
fi
# Function to analyze log for specific patterns
analyze_log() {
	echo "Analyzing log file: $LOG_FILE"
	echo "Searching for error messages..."		
	grep -i "error" "$LOG_FILE" | while read -r line; do
		echo "Found error: $line"
	done
	echo "Searching for warning messages..."
	grep -i "warning" "$LOG_FILE" | while read -r line; do
		echo "Found warning: $line"		
	done
	echo "Searching for critical messages..."
	grep -i "critical" "$LOG_FILE" | while read -r line; do
		echo "Found critical: $line"
	done
	echo "Log analysis complete."		
}