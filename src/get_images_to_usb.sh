#!/bin/bash

# SSH into Jetson and run commands remotely
ssh suas@192.168.0.238 << 'EOF'
  echo "Starting Docker container..."
  docker start SUAS_GSTREAMER

  echo "Copying images from Docker container to Jetson home directory..."
  docker cp SUAS_GSTREAMER:/ultralytics/Flight_tests /home/suas

  echo "Copying images from Jetson to local machine..."
  exit 
  scp -r suas@192.168.0.238:/Flight_tests/06_25_2025/Flight_1/Images SUAS_Mapping/data/raw

  echo "Done."
EOF
