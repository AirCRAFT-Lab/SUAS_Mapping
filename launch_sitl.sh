#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

PARENT_DIR="$(dirname "$SCRIPT_DIR")"
PX4_DIR="$PARENT_DIR/PX4-Autopilot"
QGC_APPIMAGE="$PARENT_DIR/QGroundControl/QGroundControl.AppImage"

echo "Launching PX4 SITL..."
wt -w 0 nt -p "Ubuntu-22.04" --title "PX$ SITL" bash -c "cd '$PX4_DIR'
&& make px4_sitl_default gazebo-classic_plane; exec bash"

echo "Launching QGroundControl..."

wt -w 0 nt -p "Ubuntu-22.04" --title "QGroundControl" bash -c "'$QGC_APPIMAGE'; exec bash"