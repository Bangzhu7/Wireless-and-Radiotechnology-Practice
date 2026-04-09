AI Home Monitoring System (IoT + YOLOv8)
Overview
This project demonstrates a real-time intelligent monitoring pipeline. One laptop acts as the Camera Node, streaming live video via Flask, while a second laptop acts as the AI Monitoring Node, processing that stream using the YOLOv8 object detection model.

Team Members
Laptop A (Sender)

Laptop B (Receiver)

System Pipeline
Camera Node: Captures frames via OpenCV and serves them over a Flask web server.

Network Stream: Video is transmitted over the local WiFi network.

AI Node: Pulls the stream, runs inference on each frame, and displays results.

Setup & Implementation

1. Network Configuration
   Network: Both laptops were connected to the same WiFi network.

Sender IP Address (Laptop A): 192.168.116.14

Stream URL: http://192.168.116.14:5005

2. Running the System
   On Laptop A (Camera Node):

Installed dependencies: pip install opencv-python flask.

Executed the streaming server:

Bash
python app.py
Verified the stream was active by visiting the IP address in a web browser.

On Laptop B (AI Node):

Installed dependencies: pip install opencv-python ultralytics.

Updated the STREAM_URL in yolo_stream.py to match Laptop A’s IP.

Executed the detection script:

Bash
python yolo_stream.py
Results & Detections
The system successfully identified the following objects during the live test:

Person: (Detected when team members entered the frame)

Cell phone: (Detected when held up to the camera)

Laptop/Keyboard: (Detected from the workstation environment)

Bottle/Cup: (Detected on the desk)

Troubleshooting & Fixes
Firewall Issues: Initially, Laptop B could not connect. We had to allow Python through the Windows Firewall on Laptop A.

Latency: There was a slight lag in the stream. We minimized this by ensuring the WiFi signal was strong and closing background apps.

OpenCV Error: If the webcam didn't trigger, we ensured that other apps (like Zoom or Teams) were closed before running app.py.

Bonus Features (If Applicable)
Object Logging: Modified the code to print detected object names to the console.

Detection Capture: Added a function to save a .jpg file whenever a person was detected with a confidence score above 0.5.
