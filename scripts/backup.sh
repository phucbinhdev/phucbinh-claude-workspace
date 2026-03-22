#!/bin/bash

REPO_DIR="/home/phucbinh_dev/phucbinh"
LOG_FILE="$REPO_DIR/scripts/backup.log"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M')

cd "$REPO_DIR" || exit 1

git add -A

if git diff --cached --quiet; then
  echo "[$TIMESTAMP] No changes to backup." >> "$LOG_FILE"
  exit 0
fi

git commit -m "chore: backup $TIMESTAMP"
git push origin main

echo "[$TIMESTAMP] Backup successful." >> "$LOG_FILE"
