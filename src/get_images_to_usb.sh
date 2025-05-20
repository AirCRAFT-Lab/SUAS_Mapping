#!/bin/bash

#JETSON_IP = some fixed ip for jetson
#ssh $JETSON_IP 

#Define variables
CONTAINER_NAME="SUAS_GSTREAMER" 
CONTAINER_PATH=/ultralytics #Subject to change
MOUNT_PATH= "/mnt/usb"
IMAGE_FILE_PATH="$LOCAL_SAVE_DIR/images" #Subject to change if image directory already exists


#Copy images from docker to local Jetson directory
docker cp "$CONTAINER_NAME:$CONTAINER_PATH" "$LOCAL_SAVE_DIR" #will probably need to edit paths


#Create mount path if it doesn't exist 
if [ ! -e "$MOUNT_PATH"]; then 
    echo "USB mount directory does not exist. Creating one now..."
    sudo mkdir $MOUNT_PATH 
fi

#mount and copy images (assume usb will be at /dev/sda1, check decided usb)
sudo mount /dev/sda1 $MOUNT_PATH

cp -r "$IMAGE_FILE_PATH" "$MOUNT_PATH"

sudo umount "$MOUNT_PATH"

echo "Files copied to USB successfully."
