clc;
close all;
clear all;

% --- Input Commands ---
tmin = input('The lower bound of theta in degree=');
tmax = input('The upper bound of theta in degree=');
pmin = input('The lower bound of phi in degree=');
pmax = input('The upper bound of phi in degree=');

% --- Variable Assignments ---
tinc = 2;
pinc = 4;
rad = pi/180;

% --- Coordinate Processing ---
theta1 = (tmin:tinc:tmax);
phi1 = (pmin:pinc:pmax);
theta = theta1 .* rad;
phi = phi1 .* rad;

% Generate Meshgrid
[THETA, PHI] = meshgrid(theta, phi);

% --- Field Pattern Inputs ---
% For an omni-directional antenna, the value is constant (1)
y1 = input('The field pattern: E(THETA,PHI)=');
v = input('The field pattern: P(THETA,PHI)=', 's');

% Process absolute value and scaling
y = abs(y1); 
ratio = max(max(y)); % Calculating max of the matrix

% --- Coordinate Transformation and Plotting ---
% sph2cart(Azimuth, Elevation, Radius)
% Note: In antenna theory, THETA is often elevation and PHI is azimuth
[X, Y, Z] = sph2cart(PHI, THETA, y); 

mesh(X, Y, Z);
axis equal; % Ensures the sphere doesn't look like an egg
title('3 D Pattern','Color','b','FontName','Helvetica','FontSize',12,'FontWeight','demi');

% --- Output Parameters ---
fprintf('\n Input Parameters: \n-------------------- ');
fprintf('\n Theta = %2.0f', tmin);
fprintf(' : %2.0f', tinc);
fprintf(' : %2.0f', tmax);
fprintf('\n Phi = %2.0f', pmin);
fprintf(' : %2.0f', pinc);
fprintf(' : %2.0f', pmax);
fprintf('\n FIELD PATTERN : %s', v)
fprintf('\n \n Output is shown in the figure below----------- ');
fprintf('\n');