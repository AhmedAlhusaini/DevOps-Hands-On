#!/bin/bash
# Backup current web_project into a dated tar.gz

PROJECT=~/web_project
BACKUP_DIR=~/web_project/backup
TIMESTAMP=$(date +%Y%m%d_%H%M)
ARCHIVE="$BACKUP_DIR/web_project_$TIMESTAMP.tar.gz"

# Ensure backup directory exists
mkdir -p "$BACKUP_DIR"

# Create compressed archive
tar czvf "$ARCHIVE" -C ~ web_project

echo "Backup created at $ARCHIVE"
