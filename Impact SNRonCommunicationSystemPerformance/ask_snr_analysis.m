% ASK Modulation and Demodulation Performance under Varying SNR
clear; clc; close all;

%% 1. Parameters
fs = 1000;              % Sampling frequency (Hz)
T = 1;                  % Duration (s)
t = 0:1/fs:T-1/fs;      % Time vector
f_c = 50;               % Carrier frequency (Hz)
snr_values = [10, 5, 0, -5]; % SNR values in dB

%% 2. Generate Binary Message Signal
num_bits = 10; 
bits = randi([0 1], 1, num_bits); 
message_signal = repelem(bits, fs/num_bits); % Upsample to match time vector

%% 3. Modulation (ASK)
carrier = sin(2*pi*f_c*t);
modulated_signal = message_signal .* carrier;

%% 4. Processing and Plotting
fig = figure('Name', 'ASK Analysis', 'Position', [100, 100, 800, 900]);

for i = 1:length(snr_values)
    current_snr = snr_values(i);
    
    % Add AWGN Noise
    received_signal = awgn(modulated_signal, current_snr, 'measured');
    
    % --- 5. Demodulation ---
    % Step 1: Coherent detection (Multiply by carrier)
    demod_step1 = received_signal .* carrier;
    % Step 2: Low-pass filtering (Moving average)
    filtered_signal = movmean(demod_step1, fs/num_bits);
    % Step 3: Threshold Decision
    threshold = max(filtered_signal) / 2;
    recovered_bits = filtered_signal > threshold;
    
    % --- 6. Visualization ---
    subplot(4, 2, 2*i-1);
    plot(t, received_signal, 'Color', [0.7 0.7 0.7]); hold on;
    plot(t, modulated_signal, 'r');
    title(['Received Signal (SNR = ', num2str(current_snr), ' dB)']);
    
    subplot(4, 2, 2*i);
    plot(t, message_signal, 'k--', 'LineWidth', 1.5); hold on;
    plot(t, recovered_bits, 'b', 'LineWidth', 1);
    title(['Demodulated vs Original (SNR = ', num2str(current_snr), ' dB)']);
    ylim([-0.2 1.2]);
end

sgtitle('Impact of SNR on ASK Demodulation Performance');
drawnow; 
saveas(gcf, 'results_plot.png'); % Saves the plot to your current folder
disp('Simulation complete. Image saved as results_plot.png');