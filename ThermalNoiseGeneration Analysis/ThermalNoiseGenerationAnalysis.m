% --- Thermal Noise Simulation ---
% Parameters
B = 1e6;            % Bandwidth (1 MHz)
R = 100;            % Resistance (100 Ohms)
T = 300;            % Temperature (300 K)
k = 1.38e-23;       % Boltzmann constant
n_samples = 10000;

% Time vector (Sampling frequency set to satisfy Nyquist)
fs = 2 * B; 
time = (0:n_samples-1) / fs;

% Thermal Noise Generation
% Formula: V_rms = sqrt(4 * k * T * R * B)
noise_std = sqrt(4 * k * T * R * B);
thermal_noise = noise_std * randn(1, n_samples);

% --- Plotting ---
figure('Color', [1 1 1]);

% Time Domain Plot
subplot(2,1,1);
plot(time*1e6, thermal_noise);
title('Thermal Noise: Time Domain');
xlabel('Time (\mu s)');
ylabel('Voltage (V)');
grid on;

% PSD Analysis
subplot(2,1,2);
[psd, freq] = pwelch(thermal_noise, [], [], [], fs);
semilogx(freq, 10*log10(psd));
title('Power Spectral Density (PSD)');
xlabel('Frequency (Hz)');
ylabel('Power/Frequency (dB/Hz)');
grid on;