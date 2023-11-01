#!/bin/bash

# Define paths and variables
CONTAINER_NAME_OR_ID="app_prodigy_1"
DB_PATH_IN_CONTAINER=".prodigy/prodigy.db"
BACKUP_PATH_IN_CONTAINER="data/prodigy_backup_$(date +%d-%m-%Y_%H:%M:%S).sqlite"
BACKUP_PATH_ON_HOST="/app/data/prodigy_backup_$(date +%d-%m-%Y_%H:%M:%S).sqlite.gz"
REMOTE_PATH="prodigy:/backups"

# Step 1: Backup and compress the database inside the Docker container
docker exec "$CONTAINER_NAME_OR_ID" bash -c "sqlite3 $DB_PATH_IN_CONTAINER 'VACUUM INTO \"$BACKUP_PATH_IN_CONTAINER\"'"
docker exec "$CONTAINER_NAME_OR_ID" bash -c "gzip -f $BACKUP_PATH_IN_CONTAINER"

# Step 2: Ensure the backup file exists on the host
if [[ -f "$BACKUP_PATH_ON_HOST" ]]; then
    # Step 3: Copy the backup to remote storage using rclone
    rclone copy "$BACKUP_PATH_ON_HOST" "$REMOTE_PATH"

    # Step 4: Optional: Clean up local backup file
    rm -f "$BACKUP_PATH_ON_HOST"
else
    echo "Backup file not found!"
fi