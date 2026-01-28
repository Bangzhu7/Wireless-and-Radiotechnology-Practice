# Wireless and Radiotechnology Course 2026

## 1. Objective

The goal of this assignment is to explore and analyze cellular network parameters using smartphone service mode. The experiment focuses on how physical environments (outdoors vs. indoors) and building materials affect signal strength, quality, and frequency band selection.

---

## 2. Experiment Setup

- **Device:** Samsung Smartphone
- **Mobile Operator:** DNA Finland (MCC-MNC: 244-12)
- **Technologies:** LTE (4G) and Wi-Fi (2.4 GHz)
- **Testing Tool:** Android Service Mode (`*#0011#`) and Wi-Fi Signal Analyzer

---

## 3. Collected Measurement Data

### Cellular Network (LTE)

| Location            | Band   | Frequency (EARFCN) | Bandwidth | RSRP (Strength) | SNR (Quality) | PCI |
| :------------------ | :----- | :----------------- | :-------- | :-------------- | :------------ | :-- |
| **A. Outdoors**     | Band 1 | 299 (2100 MHz)     | 20 MHz    | -79 dBm         | 15.0          | 35  |
| **B. Indoors**      | Band 7 | 3048 (2600 MHz)    | 20 MHz    | -97 dBm         | -1.6          | 35  |
| **C. Deep Indoors** | Band 1 | 299 (2100 MHz)     | 20 MHz    | -103 dBm        | 7.4           | 35  |

### Wi-Fi Signal (2.4 GHz)

- **Best Signal:** -12 dBm (Extremely close to the Access Point)
- **Average Indoor Signal:** -60 dBm to -75 dBm
- **Observation:** Significant interference observed from multiple neighboring SSID (e.g., TP-Link, DNA-WELHO).

---

## 4. Technical Analysis

### 4.1 Signal Strength (RSRP) and Path Loss

We observed a significant decrease in **RSRP** as we moved from outdoors to the building interior:

- **Outdoor to Deep Indoor:** The signal dropped from $-79\text{ dBm}$ to $-103\text{ dBm}$.
- **Conclusion:** This $24\text{ dB}$ difference represents the **Penetration Loss** caused by concrete walls and double-glazed windows. A signal below $-100\text{ dBm}$ usually results in lower data rates and potential handover issues.

### 4.2 Signal Quality (SNR) vs. Frequency Bands

A key finding in this experiment was the relationship between frequency and signal quality:

- In **Location B**, the phone connected to **Band 7 (2600 MHz)**. Despite having a moderate RSRP ($-97\text{ dBm}$), the **SNR dropped to -1.6**, indicating high noise and poor stability.
- In **Location C**, the device performed an **Inter-frequency Handover** back to **Band 1 (2100 MHz)**. Even though the power was weaker ($-103\text{ dBm}$), the SNR improved to **7.4**.
- **Conclusion:** Lower frequency bands (Band 1) provide better indoor penetration and signal-to-noise ratios in complex structures compared to higher frequency bands (Band 7).

### 4.3 Network Stability and Data Speed

- **Outdoors (High SNR 15.0):** Network stability is optimal, supporting maximum modulation (e.g., 256QAM) and high download speeds.
- **Indoors (Low SNR -1.6):** The negative SNR suggests the network would suffer from high packet loss and latency, even if the "bars" on the phone look sufficient.

---

## 5. Conclusion

The experiment demonstrates that:

1.  **Physical obstructions** are the primary cause of signal attenuation ($RSRP$).
2.  **Higher frequencies (2600 MHz)** suffer more significantly from indoor interference and attenuation than lower frequencies.
3.  **Signal Quality (SNR)** is often more critical for a stable user experience than raw Signal Strength ($RSRP$).

---

## 6. Screenshots

Measurements were captured via Samsung Service Mode.
