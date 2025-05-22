#!/bin/bash

#!/bin/bash

# SSH into Jetson and run commands remotely
ssh suas@192.168.0.238 << 'EOF'
  echo "Starting Docker container..."
  docker start SUAS_GSTREAMER

  echo "Copying images from Docker container to Jetson home directory..."
  docker cp SUAS_GSTREAMER:/ultralytics/Flight_tests /home/suas

  echo "Copying images from Jetson to USB drive..."
  cp -r /home/suas/Flight_tests /media/suas/ABDULRAHMAN/

  echo "Done."
EOF
