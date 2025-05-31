#!/bin/bash

# SSH into Jetson and run commands remotely
ssh suas@192.168.0.238 << 'EOF'
  echo "Starting Docker container..."
  docker start SUAS_GSTREAMER

  echo "Finding latest Images directory..."
  latest_images_dir=$(docker exec SUAS_GSTREAMER find /ultralytics/Flight_tests -type d -name Images | sort | tail -n 1)

  echo "Latest Images directory: \$latest_images_dir"

  # Ensure target directory is clean
  if [ -d /home/suas/latest_images ]; then
    echo "Removing previous latest_images directory..."
    rm -rf /home/suas/latest_images
  fi

  echo "Creating new latest_images directory..."
  mkdir -p /home/suas/latest_images

  echo "Copying latest Images directory to Jetson home..."
  docker cp SUAS_GSTREAMER:\$latest_images_dir /home/suas/latest_images

  echo "Done with Docker operations."
EOF

echo "Copying latest Images from Jetson to local machine..."
scp -r suas@192.168.0.238:/home/suas/latest_images ../data/raw

echo "All done."
