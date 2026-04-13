# Multi-Sensor IoT Monitoring System

## Project Overview

This project demonstrates an end-to-end IoT pipeline that collects data from multiple simulated sensors, transmits it via socket programming to an edge device, and routes it through an MQTT broker for real-time visualization in Grafana.

### System Architecture

1. **Sensor Node (Laptop 1):** Simulates environmental data and sends it via TCP Sockets.
2. **Edge Device (Laptop 2):** Acts as a gateway, receiving socket data, parsing it, and publishing individual metrics to an MQTT Broker.
3. **MQTT Broker:** Facilitates the Pub/Sub messaging (using `broker.emqx.io`).
4. **Grafana Dashboard:** Subscribes to the MQTT topics to provide a visual representation of the sensor data.

---

## Sensor Description

The system monitors three specific environmental variables:

- **Temperature:** Simulated values between 20°C and 35°C.
- **Humidity:** Simulated values between 40% and 80%.
- **Light Intensity:** Measures ambient light from 100 to 1000 lux.

## MQTT Topics

The Edge Device publishes data to the following specific topics:

| Sensor      | MQTT Topic                | Data Type   |
| :---------- | :------------------------ | :---------- |
| Temperature | `savonia/iot/temperature` | Float (°C)  |
| Humidity    | `savonia/iot/humidity`    | Float (%)   |
| Light       | `savonia/iot/light`       | Float (lux) |

---

## Dashboard Layout

The Grafana dashboard is organized into a 4-panel layout for optimal monitoring:

- **Panel 1 (Top):** **Temperature Graph** (Time series showing historical trends).
- **Panel 2 (Middle Left):** **Humidity Gauge** (Current moisture levels).
- **Panel 3 (Middle Right):** **Light Gauge** (Current brightness in lux).
- **Panel 4 (Bottom):** **Status Panel** (Quick reference for current sensor states).

### Dashboard Screenshot

![Dashboard Screenshot](screenshot.png)
_(Note: Ensure you upload your screenshot to the repository and name it screenshot.png)_

---

## Reflection Question

**Why do we separate each sensor into a different MQTT topic?**

Separating sensors into individual topics is a best practice for several reasons:

1.  **Efficiency:** Clients (subscribers) only receive the specific data they need, reducing unnecessary network traffic and processing load.
2.  **Scalability:** You can add new sensors or more devices without changing the logic of existing subscribers.
3.  **Flexibility:** It allows for granular control; for example, you can set different retention policies or security permissions for "Temperature" vs. "Security Camera" data.
4.  **Simplicity:** It makes the data stream easier to organize and map to visualization tools like Grafana.

---

## How to Run

1.  **Start the Edge Device (Laptop 2):**
    ```bash
    python edge_device.py
    ```
2.  **Start the Sensor Node (Laptop 1):**
    _Ensure the `SERVER_IP` in the script matches the IP of Laptop 2._
    ```bash
    python socket_sensor.py
    ```
3.  **View Data:**
    Open your Grafana instance and navigate to your 4-panel dashboard.
