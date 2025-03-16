#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

PARENT_DIR="$(dirname "$SCRIPT_DIR")"
PX4_DIR="$PARENT_DIR/PX4-Autopilot"
QGC_APPIMAGE="$PARENT_DIR/QGroundControl/QGroundControl.AppImage"

echo "Launching PX4 SITL..."
xterm -e "cd '$PX4_DIR' && make px4_sitl_default gazebo-classic_suas_dragonfly__baylands; exec bash" &

echo "Launching QGroundControl..."

xterm -e "'$QGC_APPIMAGE'; exec bash" &
