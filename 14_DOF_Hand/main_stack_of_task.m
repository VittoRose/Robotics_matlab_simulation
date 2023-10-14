%% -- 14 DOF hand task set inversion -- %%

clear; close all; clc;
addpath functions\

%% -- Hand parameters -- %%

DOF = 14;

% Link length
L = [31 31.5 0; 50 25 20; 51 20 25; 50 25 20; 45 25 20];
offset = [-20 0; 0 20; 3 27; 4 27; 5 23];

% Initial configuration

q0 = [pi-0.1 -.1 ...
    pi/3  0 0 ...
    pi/3 0 0 ...
    pi/3 0 0 ...
    pi/3 0 0 ]';

%   final config

% q0 = [pi-0.1 -pi/6-.1 ...
%     1.6/2*pi   pi/4   pi/4+0.1...
%     pi/2+0.2 0.1 0.1 ...
%     pi/2+0.1 0.1 0.1 ...
%     pi/2 0.1 0.1 ]';

%% --- simulation parameters --- %%
Ts = 0.05;
max_step = 100;
epsilon = 0.001;

% Desired configuration 
des_thumb = [-75; 24];
des_index = [-75.5; 28];
des_middle = [-22; 118];
des_ring = [-11; 120];
des_pinky = [-1.5; 111];

% --- pre allocation --- $$
q_out = zeros(DOF, max_step);
errors = zeros(10, max_step);
u = zeros(DOF,1);

%% Loop: simulation and control %%
i = 1;
q = q0;
q_out(:,1) = q0;

[thumb, index, middle, ring, pinky] = hand_direct_kinematics(q, L, offset);

thumb = thumb(1:2,2);
index = index(1:2,3);
middle = middle(1:2,3);
ring = ring(1:2,3);
pinky = pinky(1:2,3);

while (norm(des_pinky - pinky)>0.015 || norm(des_ring - ring)>0.015 || norm(des_middle - middle)>0.015...
        || norm(des_index - index)>0.015 || norm(des_thumb - thumb)>0.015) && i<max_step
    
    q = q_out(:,i); 
    [thumb, index, middle, ring, pinky] = hand_direct_kinematics(q, L, offset);
    
    thumb = thumb(1:2,2);
    index = index(1:2,3);
    middle = middle(1:2,3);
    ring = ring(1:2,3);
    pinky = pinky(1:2,3);

    %-- errors --%
    e_thumb = des_thumb - thumb;
    e_index = des_index - index;
    e_middle = des_middle - middle;
    e_ring = des_ring - ring;
    e_pinky = des_pinky - pinky;

    errors(:, i) = [e_thumb; e_index; e_middle; e_ring; e_pinky];

    %% -- stack of task control -- %%

    J1 = get_J_thumb(q);
    J1 = J1(1:2,:);                     % prendo soltanto le coordinate spaziali
    pinv_J1 = pinv(J1, epsilon);        % pseudoinversa di J1 14x3
    P1 = eye(14) - pinv_J1*J1;          % proiettore nel nullo di J1 14x14
    u1 = pinv_J1 * e_thumb;             
    
    J2 = get_J_index(q);
    J2 = J2(1:2,:);                     
    P2 = P1 - pinv(J2*P1, epsilon) * J2*P1;
    u2 = u1 + pinv(J2*P1,epsilon)*(e_index - J2*u1);

    J3 = get_J_middle(q);
    J3 = J3(1:2,:);                             
    P3 = P2 - pinv(J3*P2, epsilon) * J3*P2;
    u3 = u2 + pinv(J3*P2,epsilon)*(e_middle - J3*u2);

    J4 = get_J_ring(q);
    J4 = J4(1:2,:);                             
    P4 = P3 - pinv(J4*P3, epsilon) * J4*P3;
    u4 = u3 + pinv(J4*P3,epsilon)*(e_ring - J4*u3);

    J5 = get_J_pinky(q);
    J5 = J5(1:2,:);                             
    P5 = P4 - pinv(J5*P4, epsilon) * J5*P4;
    u5 = u4 + pinv(J5*P4,epsilon)*(e_pinky - J5*u4);

    q_out(:, i+1) = q + Ts*u5;

    i = i + 1;
end

% -- resize vector -- %%
i = i-1;
q_out = q_out(:, 1:i);

%% Animation %%
a = figure; 
title("Animation")
axis equal;
for j = 1:i
    cla(a)
    axis([-90 60, -1.5 125]);
    plot_hand(q_out(:,j),L, offset);
    pause(0.1);
end

%% -- Plot configuration -- %% 

t = linspace(0,Ts*(i),i);

figure;
subplot(1,5,1);
plot(t,q_out(1:2,:));
grid on;
title('Thumb Lagrangian coordinates', 'Interpreter', 'latex')
legend('q_1','q_2')

subplot(1,5,2);
plot(t,q_out(3:5,:));
grid on;
title('Index Lagrangian coordinates', 'Interpreter', 'latex')
legend('q_3','q_4', 'q_5')

subplot(1,5,3);
plot(t,q_out(6:8,:));
grid on;
title('Middle Lagrangian coordinates', 'Interpreter', 'latex')
legend('q_6','q_7', 'q_8')

subplot(1,5,4);
plot(t,q_out(9:11,:));
grid on;
title('Ring Lagrangian coordinates', 'Interpreter', 'latex')
legend('q_9','q_{10}', 'q_{11}')

subplot(1,5,5);
plot(t,q_out(12:14,:));
grid on;
title('Pinky Lagrangian coordinates', 'Interpreter', 'latex')
legend('q_{12}','q_{13}', 'q_{14}')
