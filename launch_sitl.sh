#!/bin/bash

SCRIPT_DIR="$(CD "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

PARENT_DIR="$(dirname "$SCRIPT_DIR")"
PX4_DIR="$PARENT_DIR/PX4-Autopilot"
QGC_APPIMAGE="$PARENT_DIR/QGroundControl/QGroundContro.AppImage"

echo "Launching Gazebo SITL..."

cd "$PX4_DIR"
make px4_sitl_default gazebo-classic_plane

echo "Launching QGroundControl..."
cd "$QGC_APPIMAGE"
~./QGroundConrol.AppImage