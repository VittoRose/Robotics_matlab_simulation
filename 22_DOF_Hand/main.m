%% -- 14 DOF hand task set inversion -- %%

clear; close all; clc;

%% -- Hand parameters -- %%

DOF = 14;

% Link length
L = [31 31.5 0; 50 25 20; 51 20 25; 50 25 20; 45 25 20];
offset = [0 20; 0 20; 3 27; 4 27; 5 23];

% Initial configuration 
var = 0;
% q0 = [pi-var 0 ...
%     pi/2+var pi/2+var pi/2+var ...
%     pi/2+var pi/2+var pi/2+var ...
%     pi/2+var pi/2+var pi/2+var ...
%     pi/2+var pi/2+var pi/2+var ]';

q0 = [pi-0.1 -pi/6-.1 ...
    1.3/2*pi   pi/4+0.25   pi/4+0.2 ...
    pi/2+0.2 0.1 0.1 ...
    pi/2+0.1 0.1 0.1 ...
    pi/2 0.1 0.1 ]';

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

plot_hand(q,L, offset)
axis equal

% while (norm(des_pinky)>0.015 || norm(des_ring)>0.015 || norm(des_middle)>0.015...
%         || norm(des_index)>0.015 || norm(des_thumb)>0.015) && i<max_step
%     
%     q = q_out(:,i); 
%   [thumb, index, middle, ring, pinky] = hand_direct_kinematics(q, L, offset);
% 
%     %-- errors --%
%     e_thumb = des_thumb - thumb;
%     e_index = des_index - index;
%     e_middle = des_middle - middle;
%     e_ring = des_ring - ring;
%     e_pinky = des_pinky - pinky;
% 
%     errors(:, i) = [e_thumb; e_index; e_middle; e_ring; e_pinky];
% 
% 
%     i = i + 1;
% end




