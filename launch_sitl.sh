#!/bin/bash

echo "Launching Gazebo SITL..."

cd ~/PX4-Autopilot
make px4_sitl_default gazebo-classic_plane

echo "Launching QGroundControl..."
cd ~/QGroundConrol
~./QGroundConrol.AppImage