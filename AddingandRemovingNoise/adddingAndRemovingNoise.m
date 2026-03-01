%% Signal Noise Addition and Removal Simulation
clear; clc; close all;

% 1. Parameters
fs = 1000;              % Sampling frequency (Hz)
t = 0:1/fs:1;           % Time vector (1 second)
f_signal = 5;           % Frequency of sine wave (Hz)
amplitude = 1;          % Amplitude
cutoff_freq = 10;       % Low-pass filter cutoff (Hz)
noise_level = 0.5;      % Standard deviation of noise

% 2. Generate Original Sinusoidal Signal
original_signal = amplitude * sin(2 * pi * f_signal * t);

% 3. Add Gaussian White Noise
noise = noise_level * randn(size(t));
noisy_signal = original_signal + noise;

% 4. Remove Noise Using a Low-pass Filter (Butterworth)
% Normalize the cutoff frequency (0 to 1, where 1 is Nyquist frequency)
Wn = cutoff_freq / (fs / 2); 
[b, a] = butter(4, Wn, 'low'); % 4th order filter
filtered_signal = filter(b, a, noisy_signal);

% 5. Plotting Results
figure('Position', [100, 100, 800, 600]);

subplot(3,1,1);
plot(t, original_signal, 'LineWidth', 1.5);
title('Original Sinusoidal Signal (5 Hz)');
grid on; ylim([-2.5 2.5]);

subplot(3,1,2);
plot(t, noisy_signal, 'Color', [0.8 0.3 0.3]);
title('Signal with Added Gaussian White Noise');
grid on; ylim([-2.5 2.5]);

subplot(3,1,3);
plot(t, filtered_signal, 'g', 'LineWidth', 1.5);
hold on;
plot(t, original_signal, 'k--', 'LineWidth', 1); % Overlay original for comparison
title(['Filtered Signal (Low-pass Cutoff: ', num2str(cutoff_freq), ' Hz)']);
legend('Filtered', 'Original Target');
grid on; ylim([-2.5 2.5]);