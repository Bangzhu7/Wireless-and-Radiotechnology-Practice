IoT Real-Time Home Monitoring System

1. Project Overview
   This project implements a simple real-time home monitoring system using Python, OpenCV, and Flask. One laptop acts as the Camera Node (Sender), capturing live video and broadcasting it over the local network, while another device acts as the Viewer (Receiver) to watch the stream via a web browser.

2. Team Members & Roles
   Laptop A (Sender/Camera)

Laptop B (Receiver/Viewer)

3. Network Configuration
   Connectivity: Both laptops were connected to the same WiFi network.

Sender IP Address: 192.168.116.14

Streaming URL: http://192.168.116.14:5003

4. How to Start the Stream
   Prerequisites
   Ensure both laptops have Python 3 installed and the required libraries on the Sender:

Bash
pip install opencv-python flask
Execution Steps
On Laptop A: Navigate to the project folder and run the application:

Bash
python app.py
On Laptop B: Open a web browser and enter the Sender's IP address followed by port 5000.

5. Implementation Details
   Capture: Used cv2.VideoCapture(0) to access the local webcam.

Encoding: Converted raw video frames into .jpg format using cv2.imencode.

Streaming: Utilized Flask's Response with multipart/x-mixed-replace MIME type to stream frames continuously to the browser.

6. Results & Testing
   Webcam Connection: Successfully opened and captured live frames.

Network Access: Laptop B was able to access the stream using the Sender's IP.

Performance: The video updated continuously in real-time with [Low/Minimal/Noticeable] latency.

Verification: The system functioned effectively as a basic home monitoring setup.

7. Troubleshooting (Optional)
   Example: We initially couldn't connect, so we disabled the Windows Firewall on Laptop A, which fixed the issue.

Example: Made sure no other apps (like Zoom or Teams) were using the webcam.

8. Proof of Work
   (Note: Please replace these placeholders with your actual screenshots in the GitHub repository)

Flask Server Running (Laptop A)
Live Stream in Browser (Laptop B)
