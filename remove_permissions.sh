#!/bin/bash

TARGET_DIR=$1
if [ -z "$TARGET_DIR" ]; then
    read -p "Enter dir name: " TARGET_DIR
fi

ls -la "$TARGET_DIR" | grep -v total | awk '{print $1, $9}'

for FILE in "$TARGET_DIR"/*.sh; do
    if [ -f "$FILE" ]; then
        chmod -x "$FILE"
        echo "Permissions have been removed: $FILE"
    fi
done


