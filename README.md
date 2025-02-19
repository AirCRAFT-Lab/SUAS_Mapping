# SUAS Mapping (2025)
This repository contains the code for an automated mapping system designed for the 2025 Student Unmanned Aerial Systems (SUAS) competition. The system captures, generates, and exports a high-resolution map of a predefined area in real-time, utilizing a UAS (Unmanned Aerial System) equipped with a camera and advanced algorithms for image stitching and processing.

This project is developed under the Aircraft Computational & Resource Aware Fault Tolerance (AirCRAFT) Lab at Saint Louis University, which focuses on research and development in autonomous systems, robotics, and unmanned aerial vehicles (UAVs). 

## Mission:

The mission for this project is to design and implement a system that enables a UAS to autonomously map a 10-acre area with high accuracy, generating a complete imagery map and exporting it to a USB within a **30-minute mission window**.

For further information about missions and tasks, please refer to the [2025 SUAS competition handbook](https://robonation.gitbook.io/suas-resources).

## Competition Information: SUAS (Student Unmanned Aerial Systems) 2025

The [**SUAS competition**](https://suas-competition.org/) is an annual event that encourages students to design, integrate, and demonstrate a UAS capable of autonomous flight and navigation. The competition engages students in real-world missions that simulate UAS tasks, including remote sensing and autonomous decision-making. This year it is held from June 24-26, 2025 at St. Mary’s County Regional Airport, California, MD.

### Mission Task:

- **Mapping Task**: Teams must generate high-resolution imagery maps of a 10-acre area, which will be evaluated for coverage, accuracy, and stitching quality. The mapping must be completed within the 30-minute mission window, and maps are submitted via USB.

**Mapping Scoring Criteria**:

- **Coverage**: The completeness of the mapped area.
- **Projection Accuracy**: How well the map matches the real-world coordinates.
- **Stitching Quality**: The quality of stitching between images (without noticeable seams or misalignments).
- **Overall Quality**: The map's usability as a professional-grade map.

## Project Components

### 1. **Capture**:

- Use of onboard **web camera** to capture images of the area.

### 2. **Process**:

- The images are processed using algorithms to detect features and align them for stitching.

### 3. **Stitching**:

- The **OpenCV** library (or similar image-processing tools) will be used to stitch the images into a seamless high-resolution map.

### 4. **Export**:

- The final map will be exported to a **USB drive** for submission during the mission.

## Tech Stack

- **OpenDroneMap (ODM)**: A popular open-source tool used for photogrammetry and creating 3D models from images. The system will leverage **pyODM** (a Python wrapper) for automation.
- **OpenCV**: Used for image stitching and enhancement algorithms.
- **Python**: Primary programming language for integrating the components and implementing the mapping logic.

## Hardware

- **UAS (Plane)**: **DragonFly** UAV, equipped with a flight controller and camera for autonomous operation.
- **Onboard Computer**: **NVIDIA Jetson Orin Nano** for processing captured images and running the required algorithms.
- **Flight Controller**: **Pixhawk 4** to manage the UAV’s flight.
- **Web Camera**: Captures images for processing.
- **Off-Board Server**: Ground laptop to manage and monitor the UAV’s flight and data processing.

## AirCRAFT Lab at Saint Louis University

This project is being developed under the **Aircraft Computational & Resource Aware Fault Tolerance (AirCRAFT) Lab** at **Saint Louis University**. The AirCRAFT Lab's mission is to address aircraft safety through cutting-edge, high-risk/high-reward flight control algorithms, particularly in adverse conditions such as sensor and actuator failures.

## Contact
For inquiries regarding this research, please reach out to:

- Aida Bah – aidasulayb@gmail.com

- Dr. Srikanth Gururajan (Lab Director) – srikanth.gururajan@slu.edu
