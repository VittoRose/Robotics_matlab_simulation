%% Animation for RR control on a circle with real motor
clc, close all;

% Get data from simulink 
q1_out = out.q1.Data;
q2_out = out.q2.Data;
t_out = out.tout;

%% Ideal system

% Initial condition
q1_old = q1_0;
q2_old = q2_0;

% Memory allocation
q1_ideal = zeros([1, size(t_out)]);
q2_ideal = zeros([1, size(t_out)]);
cond_number = zeros([1, size(t_out)]);

for i = 1:1:size(t_out)
    
    % Get Jacobian and inv(Jacobian)
    J = [-a2*sin(q1_old + q2_old) - a1*sin(q1_old), -a2*sin(q1_old + q2_old);
      a2*cos(q1_old + q2_old) + a1*cos(q1_old),  a2*cos(q1_old + q2_old)];
    Jinv = pinv(J, 0.001);
    cond_number(i) = cond(J);

    % Get old end effector position
    [x_ee, y_ee] = Direct_kin_RR(q1_old, q2_old, a1, a2);

    % Track equations
    C_xi = (x_ee - x0)^2 + (y_ee - y0)^2 - R^2;
    Cxi_xi = [2*(x_ee - x0), 2*(y_ee - y0)];
    S_xi = [-(y_ee - y0); (x_ee - x0)];
    alpha = 1/norm(S_xi);
    
    % Control signal
    u = -k_track*Jinv*transpose(Cxi_xi)*C_xi + Jinv*S_xi*alpha;
    %u = [0.1+0.01*i; 0];
    q1 = u(1);
    q2 = u(2);

    % Save old angle
    q1_ideal(1,i) = q1;
    q2_ideal(1,i) = q2;

    % Update variables
    q1_old = q1;
    q2_old = q2;
end

%% Animation loop
for i = 1:1:size(t_out)

    Draw_RR(q1_ideal(1,i), q2_ideal(1,i), a1, a2, 'b');
    
    hold on;
    axis equal;
    axis ([-2 2 -2 2]);
    grid on;
    rectangle('Position',[x0-R, y0-R, 2*R, 2*R], 'Curvature',[1,1], 'EdgeColor','g','LineWidth',2);     % draw the reference circle
    hold off;
    drawnow;
end
