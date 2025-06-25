#!/bin/bash
echo "Deleting all containers..."
docker rm -v -f $(docker ps -qa) #Delete all containers

echo "Resizing virtual disk..."
Resize-VHD -Path "C:\Users\Aida\AppData\Local\Docker\wsl\disk\docker_data.vhdx" #Resize docker virtual hard disk

echo "Docker cleaned."