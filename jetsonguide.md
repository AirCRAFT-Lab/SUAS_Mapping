
# SUAS Jetson Guide & Useful Commands

This guide provides key setup steps and common commands for working with the Jetson onboard computer and the mapping task for AirCRAFT Lab's participation in SUAS 2025.

---

##  SSH into the Jetson & Start Docker

1. **SSH into Jetson Nano**  
   Replace the IP if needed (default shown below):
   ```bash
   ssh suas@192.168.0.238
   ```

2. **Start the Docker Container**  
   ```bash
   docker start SUAS_GSTREAMER
   ```
   > ⚠️ **Note:** Do not use `docker attach` when copying files to the local machine. You must start the container, but remain *outside* of it to use `docker cp`.

---

##  Accessing the Running Docker Container
To interact with files or run programs inside the container:
   ```bash
   docker attach SUAS_GSTREAMER
   ```
You’ll be inside the container (`root@...:/ultralytics`) where scripts and data live.

---

##  Copying Images to Jetson

After your flight:
```bash
docker cp SUAS_GSTREAMER:/ultralytics/Flight_tests /home/suas
```

Images will now be accessible on the Jetson at:
```
/home/suas/Flight_tests
```

---

##  Saving Images to USB Flash Drive

Make sure your USB is mounted (AirCRAFT Lab's default mount point is `/media/suas/ABDULRAHMAN`):
```bash
cp -r /home/suas/Flight_tests /media/suas/ABDULRAHMAN/
```

To confirm the USB is mounted, run:
```bash
lsblk
```

---

##  Running the Image Mapping Pipeline

Once images are copied to the **ground station computer** under the `data/raw` directory, follow these steps (caution: steps are designed for Windows OS):

###  Prerequisites (see full `README.md`)
- Docker Desktop installed and running  
- `odm_mapping.py` is available in your repo

###  Start the NodeODM API (on Windows)

1. Open Docker Desktop (keep it running in the background)
2. Run in a terminal:
   ```bash
   docker run -p 3000:3000 opendronemap/nodeodm
   ```
   
3. You can now run the mapping script:
   ```bash
   python odm_mapping.py
   ```

---

For any issues, refer to the full project README or contact the development team.
```
