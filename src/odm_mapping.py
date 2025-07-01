import time
import os
import errno
from pyodm import exceptions, Node
import pyodm
from pyodm.types import TaskStatus    

start_time = time.time()


PROJECT_ROOT = os.path.join(os.path.dirname(__file__), '..')
RAW_IMAGES_DIR = os.path.join(PROJECT_ROOT, "data", "raw")
OUTPUT_FOLDER = os.path.join(PROJECT_ROOT, "data", "output")

# Ensure output folder exists
os.makedirs(OUTPUT_FOLDER, exist_ok=True)

# Build list of image file paths
RAW_IMAGES = [
    os.path.join(RAW_IMAGES_DIR, f)
    for f in os.listdir(RAW_IMAGES_DIR)
    if f.lower().endswith(('.jpg', '.jpeg', '.png'))
]

 #Connect to ODM server
node = pyodm.Node("localhost", 3000)

print("Sending images to OpenDroneMap server...")

task = node.create_task(
    RAW_IMAGES, 
    skip_post_processing=True,
    options={
        #"fast-orthophoto": True,
        "skip-3dmodel": True,
        #"orthophoto-resolution": 5
    })

print("Task submitted. Monitoring progress...")

while True:
    status = task.info().status
    print(f"Current status: {status}")

    if status == TaskStatus.COMPLETED:
        break
    elif status == TaskStatus.FAILED:
        print("Task failed with error:", task.info().last_error)
        break

    time.sleep(10)
    
if task.info().status == TaskStatus.COMPLETED:
    print("Download in progress...")
    try:
        task.download_assets(OUTPUT_FOLDER)
    except PermissionError as e:
        if e.errno == errno.EACCES:
            print(f"Warning: Could not delete ZIP file because it's in use. Skipping cleanup.")
        else:
            raise 
    print(f"Mapping complete.\nOutput saved in {OUTPUT_FOLDER}")


end_time = time.time()
elapsed = end_time - start_time

mins, secs = divmod(elapsed, 60)
hrs, mins = divmod(mins, 60)

print(f"Total runtime: {int(hrs)}h {int(mins)}m {int(secs)}s")
