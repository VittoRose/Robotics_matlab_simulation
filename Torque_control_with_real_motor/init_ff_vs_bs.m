%% Parameters for RR control on a circle with real motor
%clc, clear, close all;

%% Motor parameters 48V DC servo motor   https://www.ato.com/800w-dc-servo-motor

R = 0.11;       % 0.11 [ohm]
L = 50e-6;      % 50e-6 [H]
k_mot = 0.23;   % 0.23 [Nm/A]
Im = 740e-6;    % 740e-6 [Kg*m^2]
b = 0.1;        % [kg/s]

% Saturation
tau_max = 17.9;             % 17.9 [Nm]
V_max = 48;                 % 48 [V]
n_max = 1500;               % 1500 [rpm]
domega_max = 2*pi*n_max/60; % [rad/s]

% PID params
K_pid = 10;

%% 3R parameters

% Link lenght
a1 = 1;             % [m]
a2 = 1;             % [m]
a3 = 1;             % [m]

% Mass and inertia
m1 = 1;
m2 = 2;
m3 = 3;
Izz1 = (1/12)*m1*a1^2;
Izz2 = (1/12)*m2*a2^2;
Izz3 = (1/12)*m3*a3^2;

% Initial condition
q0 = [pi/2; -pi/3; 0];
dq0 = [0; 0; 0];

% Initial condition for inverse kinematic
q0_d = q0;
dq0_d = dq0;

%% Trajectory definition

time_gain = 0.5;                    % Riferimento velocemente variabile time_gain = 1
par_traj.xi0 = [1.0; 1.0];
par_traj.A = 0.4;
par_traj.B = 0.4;
a0 = 1;
b0 = 2; 
par_traj.a = time_gain * a0;
par_traj.b = time_gain * b0;
par_traj.d = 0;


