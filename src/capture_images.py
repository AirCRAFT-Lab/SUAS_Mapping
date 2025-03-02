import time
from pymavlink import mavutil
import cv2
import numpy as np

connection = mavutil.mavlink_connection('udpin:localhost:1450')

connection.wait_heartbeat()

print("Connected to PX4 waiting for camera images...")

while True:
    msg = connection.recv_match(type='CAMERA_FEEDBACK', blocking=True)
    if msg is not None:
        print(f"Received image capture feedback: {msg}")

        img = np.zeros((480, 640, 3), dtype=np.uint8)
        image_filename = f'output/captured_image_{time.time}.jpg'
        cv2.imwrite(image_filename. img)

        print(f"Image saved: {image_filename}")

time.sleep(1)