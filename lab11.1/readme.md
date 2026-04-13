IoT Real-Time Monitoring System: Socket to MQTT to Grafana
Project Description
This project demonstrates a multi-stage IoT data pipeline. It simulates a sensor environment where data is transmitted across different protocols (Socket and MQTT) and finally visualized in a real-time dashboard.

The system follows this flow:

Laptop 1 (Sensor): Generates random temperature data and sends it via TCP Sockets.

Laptop 2 (Edge Device): Acts as a gateway. It listens for incoming socket data and republishes it to an MQTT Broker.

Laptop 1 (Main Server): Subscribes to the MQTT broker and visualizes the live data stream using Grafana.

System Architecture
Data Source: socket_sensor.py (Laptop 1)

Bridge: edge_device.py (Laptop 2)

Protocol 1: TCP Socket (Local Network)

Protocol 2: MQTT (TCP Port 1883)

Visualization: Grafana (MQTT Data Source Plugin)

Technical Details
Socket IP/Port: 192.168.116.14:5007

MQTT Broker: broker.emqx.io (Port 1883)

MQTT Topic: savonia/iot/temperature (Update this if you used a custom string)

Grafana Configuration
To visualize the data, Grafana was configured on Laptop 1 as follows:

Installation: Installed via Homebrew (brew install grafana) or the standalone binary.

Plugin: Installed the MQTT Data Source plugin.

Data Source Setup:

Host: broker.emqx.io

Port: 1883

Protocol: mqtt://

Dashboard: Created a new dashboard with a Time Series panel subscribing to the topic savonia/iot/temperature.

Note on Limitations: This setup uses the live MQTT stream. Because there is no database (like InfluxDB or SQLite) attached, the dashboard only shows data that arrives while the browser is open. Refreshing the page clears the current graph.

How to Run
Start the Edge Device (Laptop 2):

Bash
python3 edge_device.py
Start the Sensor (Laptop 1):

Bash
python3 socket_sensor.py
View Data:
Open http://localhost:3000 in your browser and navigate to your dashboard.
