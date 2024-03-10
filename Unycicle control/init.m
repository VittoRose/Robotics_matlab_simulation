%% ----- Unicycle Initialization ----- %%
close all;
clear all;

% Target position
q_final = [1; 0; 0];

% Initial configuration unicycle
qinit = [1; 3; pi/2] + q_final;

% Initial configuration in q_bar
q0 = [sqrt(qinit(1)^2+qinit(2)); atan(qinit(2)/qinit(1)) - pi; atan(qinit(2)/qinit(1)) - pi - qinit(3)] + q_final;

% Control constant
k1 = 2;
k2 = 2;
lambda2 = 1;

% Saturation
v_max = 1;
v_min = -1;

