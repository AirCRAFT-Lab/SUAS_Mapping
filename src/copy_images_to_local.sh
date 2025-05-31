#!/bin/bash

# SSH into Jetson and run commands remotely
ssh suas@192.168.0.238 << 'EOF'
  echo "Starting Docker container..."
  docker start SUAS_GSTREAMER

  echo "Finding latest Images directory..."
  # Find all 'Images' directories, sort by modification time, get the latest
  latest_images_dir=\$(find /ultralytics/Flight_tests -type d -name Images | sort | tail -n 1)

  echo "Latest Images directory: \$latest_images_dir"

  echo "Copying latest Images directory to Jetson home..."
  docker cp SUAS_GSTREAMER:\$latest_images_dir /home/suas/latest_images

  echo "Done with Docker operations."
EOF

echo "Copying latest Images from Jetson to local machine..."
scp -r suas@192.168.0.238:/home/suas/latest_images SUAS_Mapping/data/raw

echo "All done."

