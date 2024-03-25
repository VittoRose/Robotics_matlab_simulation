%% CON PARAMETRI PER MOTORE

clear all; clc;
addpath('./Dynamic Model');
addpath('./Kinematic Model');
addpath('./Utils');

%% RR Manipulator Definition

% RR params
g = 9.81;
a1 = 1;
a2 = 1;
m1 = 5;
m2 = 5;
l1 = a1/2;
l2 = a2/2;
Izz1 = (1/12)*m1*a1^2;
Izz2 = (1/12)*m2*a2^2;
Il = (1/3)*m1*a1^2;

params = [a1, a2, m1, m2, l1, l2, Izz1, Izz2];

% Initialize jointstate
q0 = [0.25 ; 0.25];
dq0 = [0.0 ; 0.0];
q1_0 = q0(1);
q2_0 = q0(2);

%% Trajectory
% Lissajous trajectory parameters
time_gain = 0.5;                    % Riferimento velocemente variabile time_gain = 1
par_traj.xi0 = [1.0; 1.0];
par_traj.A = 0.4;
par_traj.B = 0.4;
a0 = 1;
b0 = 2; 
par_traj.a = time_gain * a0;
par_traj.b = time_gain * b0;
par_traj.d = 0;

% For Kinematic Inversion
q0_d = [pi/2; -pi/2];
dq0_d = [0.0; 0.0];

%% Motor parameters 48V DC servo motor   https://www.ato.com/800w-dc-servo-motor
R = 0.11;       % 0.11 [ohm]
L = 50e-6;      % 50e-6 [H]
k_mot = 0.23;   % 0.23 [Nm/A]
Im = 740e-6;    % 740e-6 [Kg*m^2]  

% saturation
tau_max = 17.9;             % 17.9 [Nm]
V_max = 48;                 % 48 [V]
n_max = 1500;               % 1500 [rpm]
domega_max = 2*pi*n_max/60; % [rad/s]

K_pid = 5;
b = 0.1;
Ieq = Il + Im;
time_constat = (k_mot^2 + b*R*k_mot)/(Ieq*R)

% uncertainties
rng(1);
uncert = 0;
u_min = 1 - uncert;
u_max = 1 + uncert;
U = diag([1;1; u_min + rand([6,1])*(u_max - u_min)]);