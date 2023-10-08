%% -- 14 DOF hand task set inversion -- %%

clear; close all; clc;

%% -- Hand parameters -- %%

DOF = 12;

% Link length
L = [1 2 0; 1 2 3; 1 2 3; 1 2 3];  

% Initial configuration 
var = 0;
q0 = [pi-var 0 ...
    pi/2+var pi/2+var pi/2+var ...
    pi/2+var pi/2+var pi/2+var ...
    pi/2+var pi/2+var pi/2+var ...
    pi/2+var pi/2+var pi/2+var ]';

%% --- simulation parameters --- %%
Ts = 0.05;
max_step = 200;
epsilon = 0.001;

% Desired configuration 
des_thumb = [0; 0];
des_index = [0; 0];
des_middle = [0; 0];
des_ring = [0; 0];
des_pinky = [0; 0];

% --- pre allocation --- $$
q_out = zeros(DOF, max_step);
errors = zeros(DOF, max_step);


%% Loop: simulation and control %%
i = 1;
q = q0;
q_out(:,1) = q0;

while (norm(des_pinky)>0.015 || norm(des_ring)>0.015 || norm(des_middle)>0.015...
        || norm(des_index)>0.015 || norm(des_thumb)>0.015) && i<max_step
    
    q = q_out(:,i); 
    [thumb, index, middle, ring, pinky] = hand_direct_kinematics(q, L);

    %-- errors --%
    e_thumb = des_thumb - thumb;
    e_index = des_index - index;
    e_middle = des_middle - middle;
    e_ring = des_ring - ring;
    e_pinky = des_pinky - pinky;

    errors(:, i) = [e_thumb; e_index; e_middle; e_ring; e_pinky];



end




