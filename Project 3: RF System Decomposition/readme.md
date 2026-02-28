Assignment: RF System Block Analysis - nRF52840
Student Name: bangzhu

Selected Device: Nordic Semiconductor nRF52840 (BLE SoC)

Datasheet Link:
https://www.nordicsemi.com/Products/nRF52840?lang=en

1. RF System Block Diagram
   请根据以下描述，在你的 GitHub 中上传一张手绘或使用在线工具（如 Draw.io）绘制的框图。

2. RF Block Explanations
   Information Source / MCU (ARM® Cortex®-M4)
   The MCU acts as the brain of the system, processing the application data and protocol stacks (like BLE or Thread). It prepares the digital data packets that need to be transmitted and manages the timing and control signals for the radio peripheral.

RF Transceiver (2.4 GHz Radio)
This block handles the transition between digital data and analog radio waves for both transmission (Tx) and reception (Rx). It contains the frequency synthesizer and local oscillators required to operate in the 2.4 GHz ISM band.

Modulation / Demodulation
For transmission, this block converts digital bits into complex physical waveforms using GFSK (for BLE). During reception, it reverses the process, extracting digital symbols from the incoming high-frequency analog signal.

Power Amplifier (PA)
The PA is part of the Transmit (Tx) chain, responsible for boosting the signal strength before it reaches the antenna. It ensures the signal has enough power to overcome path loss and reach the intended receiver at the desired range.

Low Noise Amplifier (LNA)
The LNA is the first active component in the Receive (Rx) chain, designed to amplify the very weak signals captured by the antenna. It provides gain while adding as little noise as possible to maintain a high Signal-to-Noise Ratio (SNR).

RF Filtering / Matching Network
This passive section consists of inductors and capacitors that match the impedance (usually 50 ohms) between the chip and the antenna. It also acts as a band-pass filter to suppress unwanted harmonics and out-of-band interference.

Antenna Interface
The antenna interface is the physical point where the RF signal is radiated into or captured from the air. In the nRF52840, this usually connects to a PCB trace antenna or a ceramic chip antenna via a single-ended output.

Power Supply for RF Section (DCDC / LDO)
The RF section requires a very stable and clean voltage to prevent phase noise and frequency drift. The nRF52840 uses internal low-dropout regulators (LDO) or a DC-DC converter to provide precise power to the sensitive analog radio components.

3. Signal Flow Summary
   Transmission (Tx): MCU → Modulation → PA → Matching Network → Antenna.

Reception (Rx): Antenna → Matching Network → LNA → Demodulation → MCU.
