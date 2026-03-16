# Bluetooth IoT Sensor Simulation

## Project Description

This project implements a simple Bluetooth client–server application in Python using RFCOMM sockets.

The system simulates an IoT environment where:

- The **client** acts as a sensor device.
- The **server** acts as a gateway device.

The client generates a random temperature value every 5 seconds and sends it to the server using Bluetooth. The server receives the data and prints it to the terminal.

Example output:

Temperature: 22.8 C  
Temperature: 23.4 C  
Temperature: 21.9 C

---

## Bluetooth MAC Address

The Bluetooth MAC address used in this project:

---10:B5:88:59:4D:6B

## How to Run the Program

### 1. Pair the devices

Make sure the two devices are paired via Bluetooth before running the program.

### 2. Run the server

On the server device:

```bash
python3 server.py
```
