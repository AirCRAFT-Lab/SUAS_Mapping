#!/bin/bash

# Set your image save folder path
SAVE_DIR="/home/aidabah/test_images"

# Remove image files
rm -v "$SAVE_DIR"/*.png "$SAVE_DIR"/*.jpg 2>/dev/null

echo "Image folder cleaned."

