#!/usr/bin/env bash

# POSIX Compliance
HOME_DIR=$(getent passwd "$(id -un)" | cut -d: -f6)
DAEMON_DIR="$HOME_DIR/spotify-playerctl-helper"
DAEMON_LOC="$DAEMON_DIR/daemon.sh"
SERVICE_LOC="$HOME_DIR/.config/systemd/user/spotify-playerctl-helper.service"

echo "[INFO] Cleaning up the installation..."

# Remove the daemon directory and its contents if it exists
if [ -d "$DAEMON_DIR" ]; then
    echo "[INFO] Removing directory $DAEMON_DIR"
    rm -rf "$DAEMON_DIR" || { echo "[ERROR] Failed to remove $DAEMON_DIR"; exit 1; }
else
    echo "[INFO] Directory $DAEMON_DIR does not exist."
fi

# Remove the service file if it exists
if [ -f "$SERVICE_LOC" ]; then
    echo "[INFO] Removing service file $SERVICE_LOC"
    rm -f "$SERVICE_LOC" || { echo "[ERROR] Failed to remove $SERVICE_LOC"; exit 1; }
else
    echo "[INFO] Service file $SERVICE_LOC does not exist."
fi

echo "[INFO] Cleanup completed."
