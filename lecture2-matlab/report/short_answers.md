# Short Answers (Lecture-2)

## Q1: What is the difference between time domain and frequency domain?

The time domain represents a signal's amplitude as it changes over time, showing "when" things happen. It is what you see on a standard oscilloscope. The frequency domain, calculated via the Fast Fourier Transform (FFT), shows the signal's energy distribution across different frequencies, revealing "what" specific tones or components make up the signal.

## Q2: Why does filtering help in RF receivers?

Filtering is essential in RF receivers to isolate the desired signal from a crowded spectrum. Since antennas pick up many signals and background noise simultaneously, filters (LPF, HPF, BPF) allow the receiver to "select" only the specific frequency channel of interest while suppressing interference and noise that would otherwise degrade the communication quality.

## Q3: What does modulation achieve in an RF system?

Modulation translates a low-frequency baseband signal (like voice or data) to a higher frequency carrier. This achieves two main goals:

1. **Antenna Efficiency:** Higher frequencies allow for smaller, practical antenna sizes.
2. **Multiplexing:** It allows multiple users to share the same airwaves by shifting different signals to different carrier frequencies (channels) so they do not interfere with each other.

## Q4: From A2: which filter was easiest to design and why?

The **Low-Pass Filter (LPF)** was the easiest to design because it only requires a single cutoff frequency. By simply setting the cutoff between the first and second peaks (e.g., 550 Hz), we can effectively remove all higher-frequency components with one simple command, whereas band-pass filters require defining two separate frequency boundaries.

## Q5: From A3: where do the new frequency components appear after modulation?

After modulation (multiplication in the time domain), the new frequency components appear as "sidebands" at the sum and difference of the carrier frequency ($f_c$) and the message frequency ($f_m$). Specifically, they appear at $f_c - f_m$ and $f_c + f_m$. In this assignment, these appeared at **1900 Hz** and **2100 Hz**.
