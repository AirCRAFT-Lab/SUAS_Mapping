# SUAS Mapping (2025)
This repository contains the code for an automated mapping system designed for the 2025 Student Unmanned Aerial Systems (SUAS) competition. The system captures, generates, and exports a high-resolution map of a predefined area utilizing geotagged aerial data.

This project is developed under the Aircraft Computational & Resource Aware Fault Tolerance (AirCRAFT) Lab at Saint Louis University, which focuses on research and development in autonomous systems, robotics, and unmanned aerial vehicles (UAVs). 


## Mission:

The mission for this portion of the competition is to design and implement a system that enables a UAS to map a 10-acre area with high accuracy, generating a complete orthomosaic map and exporting it to a USB flash-drive within a **30-minute mission window**.

For further information about missions and tasks, please refer to the [2025 SUAS competition handbook](https://robonation.gitbook.io/suas-resources).

## Competition Information: SUAS (Student Unmanned Aerial Systems) 2025

The [**SUAS competition**](https://suas-competition.org/) is an annual event that encourages students to design, integrate, and demonstrate a UAS capable of autonomous flight and navigation. The competition engages students in real-world missions that simulate UAS tasks, including remote sensing and autonomous decision-making. This year it is held from June 24-26, 2025 at St. Mary’s County Regional Airport, California, MD.


### Mission Task:

- **Mapping Task**: Teams must generate high-resolution imagery maps of a 10-acre area, which will be evaluated for coverage, accuracy, and stitching quality. The mapping must be completed within the 30-minute mission window, and maps are submitted via USB flash-drive.


**Mapping Scoring Criteria**:

- **Coverage**: The completeness of the mapped area.
- **Projection Accuracy**: How well the map matches the real-world coordinates.
- **Stitching Quality**: The quality of stitching between images (without noticeable seams or misalignments).
- **Overall Quality**: The map's usability as a professional-grade map.


## Project Components

### 1. **Capture**:

- Use of on-board camera to capture images of the mapping region. Images are then ran trhough geotagging software (using GPS and IMU data).

### 2. **Process**:

- The images are processed and stitched using mapping software OpenDroneMap through the python wrapper PyODM.

### 3. **Export**:

- The final map will be exported to a **USB flash drive** for submission during the mission.

## Tech Stack

- **OpenDroneMap (ODM)**: A popular open-source tool used for photogrammetry and creating 3D models from images. The system will leverage **PyODM** (a Python wrapper) for automation.
- **Python**: Primary programming language for integrating the components and implementing the mapping logic.

## Hardware

- **UAS (Plane)**: **DragonFly** UAV, equipped with a flight controller and camera for autonomous operation.
- **On-board Computer**: **NVIDIA Jetson Orin Nano** for processing captured images and running the required algorithms.
- **Flight Controller**: **Pixhawk 4** to manage the UAV’s flight.
- **On-boad Camera**: Captures images for processing.
- **Off-Board Server**: Ground PC to manage and monitor the UAV’s flight and data processing.


## Demo Instructions

This project currently supports **Windows OS** only (Linux support coming soon).

Follow these steps to install dependencies and test-run the software with provided sample geotagged images.


### Prerequisites

* **Python 3** (latest version recommended)
* **Docker Desktop** installed and running ([Docker installation guide](https://docs.docker.com/get-docker/))
* **NodeODM API** running (see [NodeODM setup guide](https://github.com/OpenDroneMap/NodeODM))


### Setup

1. **Clone the repository**

   ```bash
   git clone https://github.com/yourusername/SUAS_Mapping.git
   cd SUAS_Mapping
   ```

2. **Create and activate a virtual environment**

   ```bash
   python -m venv venv
   venv\Scripts\activate
   ```

3. **Install Python dependencies**

   ```bash
   pip install -r requirements.txt
   ```

4. **Start the NodeODM API**

   Open a separate terminal window and launch NodeODM.
   *(Refer to the [NodeODM setup guide](https://github.com/OpenDroneMap/NodeODM) for detailed instructions.)*


### Running the Demo with Sample Images

1. **Prepare the sample data**

   Copy the provided sample images from:

   ```
   SUAS_Mapping/data/sample_data/fourth_ave_test_data
   ```

   into:

   ```
   SUAS_Mapping/data/raw
   ```

2. **Run the mapping script**

   ```bash
   python odm_mapping.py
   ```

3. **View the output**

   The processed map outputs will be saved to:

   ```
   SUAS_Mapping/data/output
   ```

### Using Your Own Geotagged Images
To test with your own images:

* Place them in the `data/raw` folder.
* Follow the same steps to run the script.


### Troubleshooting NodeODM
If you encounter issues with NodeODM or PyODM please refer to the their respective guides: 
* [NodeODM Guide](https://github.com/OpenDroneMap/NodeODM?tab=readme-ov-file)
* [PyODM Documentation](https://pyodm.readthedocs.io/en/latest/)


### In Development
* SITL test and setup using Gazebo simulation *(work in progress)*.

### Reports for Analysis
All generated outputs in the `data/output` folder will include a task report that can be reviewed or exported for any analysis use.


## AirCRAFT Lab at Saint Louis University
This project is being developed under the **Aircraft Computational & Resource Aware Fault Tolerance (AirCRAFT) Lab** at **Saint Louis University**. The AirCRAFT Lab's mission is to address aircraft safety through cutting-edge, high-risk/high-reward flight control algorithms, particularly in adverse conditions such as sensor and actuator failures.


## Contact
For inquiries regarding this research, please reach out to:

- Aida Bah – aidasulayb@gmail.com

- Dr. Srikanth Gururajan (Lab Director) – srikanth.gururajan@slu.edu


## License
This project is licensed under the **AirCRAFT Lab Research License (ALRL) v1.0**. It is for internal research use at the **AirCRAFT Lab, Saint Louis University (SLU)**. External distribution, commercial use, and public disclosure are prohibited without prior approval.

For full details, see the file `LICENSE.md`.
