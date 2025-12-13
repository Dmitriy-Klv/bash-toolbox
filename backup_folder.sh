#!/bin/bash
set -e

SOURCE_DIR="/opt/myproject"
BACKUP_DIR="/var/backups/myproject"

mkdir -p "$BACKUP_DIR"

DATE=$(date +%Y-%m-%d_%H-%M-%S)
ARCHIVE="$BACKUP_DIR/backup_$(basename "$SOURCE_DIR")_$DATE.tar.gz"

tar -czf "$ARCHIVE" "$SOURCE_DIR"

echo "Backup created successfully:"
echo "$ARCHIVE"

