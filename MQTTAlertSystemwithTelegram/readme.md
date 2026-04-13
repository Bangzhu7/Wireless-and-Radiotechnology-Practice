# MQTT Alert System with Telegram Notification

## 📌 Project Overview

This project implements a simple IoT monitoring system with real-time alert functionality.

The system simulates a temperature monitoring pipeline where:

- A sensor sends temperature data using **Socket communication**
- An edge device receives the data and publishes it via **MQTT**
- A cloud server subscribes to the MQTT topic
- If the temperature exceeds a predefined threshold, a **Telegram alert** is sent

---

## 🏗️ System Architecture

```
Sensor (Laptop 1)
      │
      │ Socket
      ▼
Edge Device (Laptop 2)
      │
      │ MQTT Publish
      ▼
MQTT Broker (broker.emqx.io)
      │
      │ MQTT Subscribe
      ▼
Cloud Server (Laptop 1)
      │
      ▼
Telegram Alert
```

---

## 📡 MQTT Configuration

- **Broker:** broker.emqx.io
- **Port:** 1883
- **Topic:** savonia/iot/temperature

---

## ⚙️ Files Description

### 1. `socket_sensor.py`

- Simulates a temperature sensor
- Sends temperature data to the edge device using socket

### 2. `edge_device.py`

- Receives temperature data from the sensor
- Publishes the data to the MQTT broker

### 3. `mqtt_alert_subscriber.py`

- Subscribes to the MQTT topic
- Checks if temperature exceeds the threshold
- Sends alert message via Telegram

---

## 🚀 How to Run

### Step 1 — Install Dependencies

```bash
pip install paho-mqtt requests
```

---

### Step 2 — Configure Telegram Bot

1. Create a bot using BotFather
2. Get your **TOKEN**
3. Get your **CHAT_ID**
4. Update in `mqtt_alert_subscriber.py`:

```python
TOKEN = "8287245743:AAFsJLwsFKOpFfLFvQql3SU3f_YPY29WXyA"
CHAT_ID = "1730038415"
```

---

### Step 3 — Run the System

Run the programs in the correct order:

#### 1️⃣ Start Subscriber (Cloud Server)

```bash
python mqtt_alert_subscriber.py
```

#### 2️⃣ Start Edge Device

```bash
python edge_device.py
```

#### 3️⃣ Start Sensor

```bash
python socket_sensor.py
```

---

## ✅ Expected Output

### Terminal Output

```
Temperature: 29.3
ALERT: High temperature 29.3 °C
```

---

### Telegram Notification

```
ALERT: High temperature 29.3 °C
```

---

## 📸 Screenshot

(Add a screenshot here showing the Telegram alert)

---

## 🧠 How the System Works

1. The sensor generates temperature data and sends it via socket
2. The edge device receives the data and publishes it to MQTT
3. The cloud server subscribes to the topic and processes incoming data
4. If the temperature exceeds the threshold (e.g., 28°C), an alert is triggered
5. The system sends a notification to the user via Telegram Bot API

---

## ⚠️ Notes

- Make sure the Telegram bot has been started (send a message first)
- Ensure all devices use the same MQTT topic
- Internet connection is required for MQTT and Telegram API

---

## 🎯 Conclusion

This project demonstrates how IoT systems can integrate:

- Local communication (Socket)
- Lightweight messaging (MQTT)
- Cloud-based alerts (Telegram)

It simulates a real-world monitoring system used in smart environments.

---
