# Wireless Communication Performance Analysis

This project simulates and analyzes the communication performance of three major wireless technologies: **WiFi (802.11b)**, **Bluetooth**, and **Cellular (2G/GSM)** using MATLAB. The analysis focuses on how physical distance impacts received power, Signal-to-Interference-plus-Noise Ratio (SINR), and channel capacity.

## 🚀 Project Objectives

- Implement the **Friis Transmission Equation** to calculate received power.
- Model **SINR** based on a fixed noise floor ($500\mu W$).
- Apply the **Shannon-Hartley Theorem** to determine theoretical channel capacity.
- Compare the trade-offs between range, power, and bandwidth (The Wireless Trilemma).

---

## 📊 Simulation Parameters

| Parameter          | WiFi (802.11b) | Bluetooth  | Cellular (2G) |
| :----------------- | :------------- | :--------- | :------------ |
| **Frequency**      | 2.4 GHz        | 2.45 GHz   | 850 MHz       |
| **Bandwidth**      | 22 MHz         | 2 MHz      | 200 kHz       |
| **Transmit Power** | 100 mW         | 10 mW      | 40 W          |
| **Distance Range** | 1 – 100 m      | 0.5 – 10 m | 100 – 5000 m  |

---

## 📐 Mathematical Framework

### 1. Received Power ($P_r$)

Calculated using the **Friis Transmission Equation**, which models path loss in a free-space environment:
$$P_r = P_t G_t G_r \left( \frac{\lambda}{4\pi d} \right)^2$$

### 2. Channel Capacity ($C$)

Calculated using the **Shannon-Hartley Theorem**, defining the maximum data rate over a noisy channel:
$$C = B \log_2(1 + \text{SINR})$$

---

## 📈 Comparative Analysis (Task 4)

1.  **WiFi**: Offers the highest channel capacity. This is due to its wide **22 MHz** bandwidth. It is the optimal solution for high-speed data transfer within localized, medium-range areas (up to 100m).
2.  **Bluetooth**: Optimized for extremely low power consumption. While suitable for short-range peripheral connectivity, its low transmit power ($10\text{ mW}$) leads to a rapid signal drop-off, limiting its effective range to roughly 10m.
3.  **Cellular**: Demonstrates superior coverage capabilities (up to 5km). By utilizing a lower frequency ($850\text{ MHz}$) and high transmit power ($40\text{ W}$), it maintains a reliable link over long distances, though the narrow $200\text{ kHz}$ bandwidth limits its data throughput compared to WiFi.

---

## 🛠️ Installation and Usage

1.  Clone this repository or download `communication_assignment.m`.
2.  Open **MATLAB** and navigate to the project folder.
3.  Run the script to generate the $3 \times 3$ subplot visualization.
4.  The output plots will display the performance curves for $P_r$, SINR, and Capacity for all three technologies.
