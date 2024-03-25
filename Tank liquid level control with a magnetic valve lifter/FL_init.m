%% Liquid level regulation system in a tank through a valve operated by a magnetic lifter
%% Control technique: Feedback linearization

% Numeric value
Kv = 2;         %[m^2/s]
K = -0.1;       %[m]
Au = 0.0079;    %[m^2]
m = 0.261;      %[kg]
g = 9.81;       %[m/s^2]
At = 0.1257;    %[m^2]

% Initial condition
h0 = 3;         %[m]
z0 = 0;         %[m]
dz0 = 0;        %[m/s]

% Final condition
hf = 3;         %[m]

% Kv = 1;         %[m^2/s]
% K = -1;       %[m]
% Au = 1;    %[m^2]
% m = 1;      %[kg]
% g = 9.81;       %[m/s^2]
% At = 1;    %[m^2]
num = [1.39240000000000,2.36000000000000,1];
den = [0.00211600000000000,0.0920000000000000,1];