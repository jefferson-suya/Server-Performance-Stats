#!/bin/bash

# Directory to store archived logs
ARCHIVE_DIR=/home/wks-intern/archived_logs


# Directory containing logs to archive (provided as argument)
LOG_DIR=$1

# Check if log directory is provided
if [ -z "$LOG_DIR" ]; then
  echo "Error: No log directory provided."
  echo "Usage: log-archive <log-directory>"
  exit 1
fi

# Get current date and time for archive filename
DATE=$(date +%Y%m%d_%H%M%S)
ARCHIVE_FILE="$ARCHIVE_DIR/logs_archive_$DATE.tar.gz"
LOG_FILE="$ARCHIVE_DIR/archive_log.txt"

# Create archive directory if it doesn't exist
if [ ! -d "$ARCHIVE_DIR" ]; then
  echo "Creating archive directory at $ARCHIVE_DIR"
  mkdir -p "$ARCHIVE_DIR"
fi

# Log start time
echo "Archiving logs from $LOG_DIR" >> "$LOG_FILE"
echo "Started at $(date)" >> "$LOG_FILE"

# Create a compressed tar.gz archive of the logs
tar -czf "$ARCHIVE_FILE" -C "$LOG_DIR" .

# Log completion time
echo "Log archive completed!" >> "$LOG_FILE"
echo "Archive saved at $ARCHIVE_FILE" >> "$LOG_FILE"
echo "Completed at $(date)" >> "$LOG_FILE"

echo "Logs archived successfully to $ARCHIVE_FILE"
