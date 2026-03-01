# Signal Denoising Simulation using Low-Pass Filtering

## 1. Objective

The objective of this experiment is to simulate the process of signal degradation by Gaussian White Noise and demonstrate the effectiveness of a **Butterworth Low-Pass Filter (LPF)** in recovering the original signal.

## 2. System Parameters

- **Signal Frequency:** 5 Hz
- **Sampling Rate ($f_s$):** 1000 Hz
- **Noise Type:** Additive White Gaussian Noise (AWGN)
- **Filter Type:** 4th Order Butterworth Low-Pass
- **Cutoff Frequency ($f_c$):** 10 Hz

## 3. Methodology

1. **Signal Generation:** A pure 5 Hz sine wave is created.
2. **Noise Induction:** Random Gaussian noise is added to simulate real-world interference.
3. **Filtering:** A Butterworth filter is designed. Since the target signal is low-frequency (5 Hz) and the noise is spread across all frequencies (high-frequency components), the LPF allows the 5 Hz signal to pass while suppressing the high-frequency noise.

## 4. Observations & Results

### Effect of Noise Addition

The addition of Gaussian noise masks the smooth sinusoidal shape. While the underlying 5 Hz trend is visible to the eye, the signal-to-noise ratio (SNR) is significantly reduced, making precise measurements difficult.

### Low-Pass Filter Performance

By setting the cutoff frequency to 10 Hz:

- **Noise Reduction:** Most high-frequency "jagged" edges are removed.
- **Signal Integrity:** The 5 Hz sine wave is successfully recovered.
- **Phase Shift:** A slight delay (phase shift) is observed in the filtered signal compared to the original, which is a characteristic of IIR filters like the Butterworth.

[Image of low pass filter frequency response]

## 5. Experimentation & Evaluation

| Experiment           | Change             | Observation                                                                                  |
| :------------------- | :----------------- | :------------------------------------------------------------------------------------------- |
| **Noise Level**      | Increased $\sigma$ | The signal becomes completely submerged; recovery requires a narrower filter.                |
| **Cutoff Frequency** | Decreased to 6 Hz  | Better noise removal, but the signal amplitude may start to decrease (attenuation).          |
| **Cutoff Frequency** | Increased to 50 Hz | The filter allows too much high-frequency noise to pass through; the output remains "noisy." |

## 6. Conclusion

The experiment demonstrates that a Low-Pass Filter is highly effective for denoising signals when the target signal frequency is significantly lower than the noise frequencies. However, there is a trade-off: a lower cutoff provides cleaner signals but introduces more phase lag and potential attenuation of the desired signal.
