%% ----- Unicycle Initialization ----- %%
% close all;
clear;
% Target position
q_final = [0; 0; 0];

% Initial configuration unicycle
qinit = [3; 3; pi/2] + q_final;

% Initial configuration in q_bar
q0 = [sqrt(qinit(1)^2+qinit(2)); atan(qinit(2)/qinit(1)) - pi; atan(qinit(2)/qinit(1)) - pi - qinit(3)];

% Third step flag
flag = true;

% Control constant
k1 = 1;
k2 = 1;
lambda2 = 0.5;
K = 1;

% Saturation
v_max = 1;
v_min = -1;

omega_max = 1;
omega_min = -1;

% Actuator Dynamics
k_v = 1;
t_v = 0.8;

k_omega = 1;
t_omega = t_v;

out = sim("Simulink_simulation.slx");
Data_analysis
