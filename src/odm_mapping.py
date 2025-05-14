import pyodm
import time
import os
import errno


start_time = time.time()

RAW_IMAGES_DIR = os.path.join("data", "raw")
OUTPUT_FOLDER = os.path.join("data", "output")

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

task = node.create_task(RAW_IMAGES, skip_post_processing=True)

print("Task in progress...")
task.wait_for_completion()

print("Download in progress...")

try:
    task.download_assets(OUTPUT_FOLDER)
except PermissionError as e:
    if e.errno == errno.EACCES:
        print(f"Warning: Could not delete ZIP file because it's in use. Skipping cleanup.")
    else:
        raise 

end_time = time.time()
elapsed = end_time - start_time

mins, secs = divmod(elapsed, 60)
hrs, mins = divmod(mins, 60)

print(f"Mapping complete.\nOutput saved in {OUTPUT_FOLDER}")
print(f"Total runtime: {int(hrs)}h {int(mins)}m {int(secs)}s")