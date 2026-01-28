# Wireless and Radiotechnology Course 2026 - Cellular Analysis

## 1. Objective

The objective of this assignment is to explore and analyze cellular network parameters (Signal Strength, Quality, Bandwidth, and Frequency) using a smartphone's Service Mode. The experiment focuses on how physical environments and building materials affect wireless communication performance.

## 2. Experiment Setup

- **Device:** Samsung Smartphone
- **Network Operator:** (e.g., Telia / Orange / China Mobile - _Fill in yours_)
- **Tools:** Android Service Mode (accessed via `*#0011#`)
- **Parameters Tracked:** \* **RSRP:** Reference Signal Received Power (Signal Strength)
  - **SINR:** Signal to Interference & Noise Ratio (Signal Quality)
  - **Band/EARFCN:** Carrier Frequency and Band Designation
  - **BW:** Bandwidth (MHz)
  - **Cell ID (PCI):** Physical Cell Identity

## 3. Test Locations

Three distinct locations were chosen to simulate different signal propagation conditions:

1.  **Location A (Outdoor):** Clear line-of-sight to the environment.
2.  **Location B (Building Center):** Indoor environment with moderate wall obstruction.
3.  **Location C (Deep Indoor):** Deepest part of the building with multiple wall/floor obstructions.

## 4. Collected Measurement Data

| Parameter           | Location A: Outdoor | Location B: Indoor Center | Location C: Deep Indoor |
| :------------------ | :------------------ | :------------------------ | :---------------------- |
| **Network Tech**    | LTE                 | LTE                       | LTE                     |
| **Band**            | Band 1              | **Band 7**                | Band 1                  |
| **Bandwidth (BW)**  | 20 MHz              | 20 MHz                    | 20 MHz                  |
| **PCI (Cell ID)**   | 35                  | 35                        | 35                      |
| **RSRP (Strength)** | -79 dBm             | -97 dBm                   | -103 dBm                |
| **SINR (Quality)**  | 15.0 dB             | -1.6 dB                   | 7.4 dB                  |
| **RSRQ**            | -10                 | -14                       | -12                     |

### 📸 Visual Evidence (Screenshots)

\_Service Mode screenshots for each location:
| ![Outdoor](./screenshots/sc.jpeg) | ![Indoor](./screenshots/460201.jpg) | ![Deep Indoor](./screenshots/460202.jpg) |

---

## 5. Analysis and Observations

### 5.1 Impact of Physical Obstructions on Signal Strength (RSRP)

The data shows a significant drop in **RSRP** from **-79 dBm** (Outdoor) to **-103 dBm** (Deep Indoor). This **24 dBm decrease** is a direct result of **Path Loss** and **Shadowing**. Building materials such as concrete and steel attenuate high-frequency radio waves, significantly reducing the power that reaches the device.

### 5.2 Frequency Band Switching and Signal Quality (SINR)

An interesting behavior was observed in **Location B**:

- The device attempted to use **Band 7 (2600 MHz)**. Because this is a high-frequency band, it struggled with indoor penetration, resulting in a **negative SINR (-1.6 dB)**. This indicates high interference and noise.
- In **Location C**, the device performed a handover or stayed on **Band 1 (2100 MHz)**. Even though the signal was weaker (-103 dBm), the quality (SINR) improved to **7.4 dB**.
- **Finding:** Higher frequency bands provide more capacity but suffer more in indoor environments compared to lower frequency bands.

### 5.3 Network Stability and Reliability

- **Reliability:** In Location B, despite having "better" RSRP than Location C, the negative SINR would likely cause packet loss and jitter during data transfers.
- **Data Speed:** Location A (SINR 15.0) would yield the highest throughput. Location C, while stable, would have limited speed due to the very low RSRP.

## 6. Conclusions

1.  **Walls are Barriers:** Physical obstructions significantly degrade signal power (RSRP), necessitating the use of small cells or indoor repeaters for large buildings.
2.  **Frequency Matters:** High-frequency bands (Band 7) are highly sensitive to obstacles. Lower bands (Band 1) are more reliable for maintaining "coverage" in deep indoor areas.
3.  **Quality vs. Strength:** A "strong" signal indicator on a phone does not always mean a "fast" connection; the signal quality (SINR) is the true decider of network stability.

---

_Created as part of the Wireless and Radiotechnology Course 2026._
