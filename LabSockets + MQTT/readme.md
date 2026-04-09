IoT Communication Pipeline: Sockets to MQTT
This repository contains a three-part lab series demonstrating a complete IoT data pipeline. The project simulates a sensor node, an edge gateway, and a cloud-based monitoring application using Python, Socket programming, and the MQTT protocol.

🏗 System Architecture
The system is distributed across two physical machines to simulate real-world network latency and connectivity:

Sensor Node (Laptop 1): Simulates hardware sensors generating temperature data.

Edge Device (Laptop 2): Acts as a gateway. It collects data via TCP Sockets and forwards it to a broker.

Cloud Subscriber (Laptop 1): Acts as the end-user application, receiving data from the MQTT broker for monitoring.

🛠 Project Components
Lab 1: Socket Communication
socket_sensor.py: Client script that generates random temperature data.

socket_server.py: Simple server to receive direct data streams.

Lab 2: MQTT Messaging
mqtt_publisher.py: Connects to a public broker to publish data.

mqtt_subscriber.py: Subscribes to a specific topic to monitor incoming data.

Lab 3: Integrated Pipeline
edge_device.py: The bridge. It runs a socket server to receive local data and an MQTT client to forward it to the cloud.
