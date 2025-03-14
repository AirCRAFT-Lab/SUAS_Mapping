#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

PARENT_DIR="$(dirname "$SCRIPT_DIR")"
PX4_DIR="$PARENT_DIR/PX4-Autopilot"
QGC_APPIMAGE="$PARENT_DIR/QGroundControl/QGroundControl.AppImage"

if [ ! -d "$PX4_DIR"]; then 
    echo "Error: PX4-Autopilot directory not found at $PX4_DIR"
    exit 1
fi

if [ ! -f "$QGC_APPIMAGE"]; then
    echo "Error: QGroundControl AppImage not found at $QGC_APPIMAGE"
    exit 1
fi

echo "Launching PX4 SITL..."
xterm -e "cd '$PX4_DIR' && make px4_sitl_default gazebo-classic_plane; exec bash" &

echo "Launching QGroundControl..."
xterm -e "'$QGC_APPIMAGE'; exec bash" &

echo "PX4 SITL and QGroundControl launch succesful."
