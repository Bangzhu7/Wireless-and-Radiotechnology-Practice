clear all;
close all;

%% Global Parameters
G_t = 1; % Transmitter Gain
G_r = 1; % Receiver Gain
c = 3*1e8; % Speed of light
Pn = 500*1e-6; % Noise power (500 microWatts)

%% Task 1: WiFi Simulation (IEEE 802.11b)
f_wifi = 2.4*1e9; 
BW_wifi = 22*1e6;
d_wifi = 1:5:100;
P_t_wifi = 100*1e-3;
lamb_wifi = c/f_wifi;

% Calculations
Pr_wifi = P_t_wifi * G_t * G_r * (lamb_wifi ./ (4 * pi * d_wifi)).^2;
SINR_wifi = Pr_wifi / Pn;
Cap_wifi = BW_wifi * log2(1 + SINR_wifi);

%% Task 2: Bluetooth Simulation (IEEE 802.11)
f_bluetooth = 2.45*1e9; 
BW_bluetooth = 2*1e6;
d_bluetooth = 0.5:0.5:10; % This is the variable name you defined
P_t_bluetooth = 10*1e-3;
lamb_bluetooth = c/f_bluetooth;

% Calculations - updated variable names below:
Pr_bt = P_t_bluetooth * G_t * G_r * (lamb_bluetooth ./ (4 * pi * d_bluetooth)).^2;
SINR_bt = Pr_bt / Pn;
Cap_bt = BW_bluetooth * log2(1 + SINR_bt);

%% Task 3: Cellular Simulation (2G, GSM)
f_cellular = 850*1e6; 
BW_cellular = 200*1e3;
d_cellular = 100:100:5000; % Defined as 'd_cellular'
P_t_cellular = 40; 
lamb_cellular = c/f_cellular;

% Calculations - updated variable names to match 'd_cellular'
Pr_cell = P_t_cellular * G_t * G_r * (lamb_cellular ./ (4 * pi * d_cellular)).^2;
SINR_cell = Pr_cell / Pn;
Cap_cell = BW_cellular * log2(1 + SINR_cell);

%% Visualization (3x3 Subplot Grid)
figure('Name', 'Wireless Technology Comparison');

% WiFi Column
subplot(3,3,1); plot(d_wifi, 10*log10(Pr_wifi)); title('WiFi'); ylabel('P_r (dB)'); grid on;
subplot(3,3,4); plot(d_wifi, 10*log10(SINR_wifi)); ylabel('SINR (dB)'); grid on;
subplot(3,3,7); plot(d_wifi, 10*log10(Cap_wifi)); ylabel('Capacity (dB)'); xlabel('distance (m)'); grid on;

% Bluetooth Column
subplot(3,3,2); plot(d_bluetooth, 10*log10(Pr_bt)); title('Bluetooth'); grid on;
subplot(3,3,5); plot(d_bluetooth, 10*log10(SINR_bt)); grid on;
subplot(3,3,8); plot(d_bluetooth, 10*log10(Cap_bt)); xlabel('distance (m)'); grid on;

% Cellular Column
subplot(3,3,3); plot(d_cellular, 10*log10(Pr_cell)); title('Cellular'); grid on;
subplot(3,3,6); plot(d_cellular, 10*log10(SINR_cell)); grid on;
subplot(3,3,9); plot(d_cellular, 10*log10(Cap_cell)); xlabel('distance (m)'); grid on;