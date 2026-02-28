clc;
close all;
clear all;

% --- Input Parameters Section ---
tmin = input('The lower bound of theta in degree=');
tmax = input('The upper bound of theta in degree='); % As requested
pmin = input('The lower bound of phi in degree=');   % As requested
pmax = input('The upper bound of phi in degree=');   % As requested

% --- Coordinate Processing ---
% Create vectors from min to max with 1-degree steps
theta_deg = tmin:1:tmax; 
phi_deg = pmin:1:pmax;

% Convert to radians: Rad = Deg * (pi/180)
theta = theta_deg * (pi/180); 
phi = phi_deg * (pi/180);

% Calculate differentials (step size)
dth = theta(2) - theta(1);
dph = phi(2) - phi(1);

% Create a 2D grid for the integration
[THETA, PHI] = meshgrid(theta, phi);

% --- Pattern Definition ---
% Field Pattern input
x_input = input('The field pattern : E(THETA,PHI)=', 's'); 
% Assigning the functional value for calculation
E_field = cos(THETA); 

% Power Pattern input
v = input('The power pattern: P(THETA,PHI)=', 's'); 
% Pn(theta, phi) is E_field squared
Pn = E_field.^2; 

% --- Numerical Integration ---
% Formula: ΩA = ∬ Pn(θ, φ) * sin(θ) dθ dφ
% We use element-wise multiplication (.*) and double sum for the grid
Prad = sum(sum( Pn .* sin(THETA) * dth * dph ));

% --- Formatting Output ---
fprintf('\n Input Parameters: \n-------------------- ');
fprintf('\n Theta = %2.0f', tmin);
fprintf(' : %2.0f', dth*180/pi);
fprintf(' : %2.0f', tmax);
fprintf('\n Phi = %2.0f', pmin);
fprintf(' : %2.0f', dph*180/pi);
fprintf(' : %2.0f', pmax);
fprintf('\n POWER PATTERN : %s', v);

fprintf('\n \n Output Parameters: \n-------------------- ');
% Final Answer Printing
fprintf('\n BEAM AREA (steradians) = %3.2f\n', Prad);