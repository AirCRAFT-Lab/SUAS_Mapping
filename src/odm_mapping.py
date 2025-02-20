import pyodm
import time
import os

RAW_IMAGES = os.path.join("data", "raw")
OUTPUT_FOLDER = os.path.join("data", "output")

os.makedirs(OUTPUT_FOLDER, exist_ok=True)

node = pyodm.Node("localhost", 3000) #Connect to ODM server

print("Sending images to OpenDroneMap server...")
task = node.create_task(RAW_IMAGES, options={})

while task.info.get("status") !="DONE":
    print("Processing images...")
    time.sleep(10)

task.download_assets(OUTPUT_FOLDER)

print(f"Mapping complete: Output saved in {OUTPUT_FOLDER}")