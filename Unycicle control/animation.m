%% ----- Animated plot ----- %%
close all

dt  =  0.1;

% Create a blank figure
f = figure;
f.WindowState = 'maximized';

% Getting Vectors from Sim
q = out.q.Data;
q_d = q_final.*ones(size(q));
tout = out.tout;


% resampling data at dt
time  =  0 : dt : tout(end);
q_pp  =  zeros(size(q,1),size(time,2));
traj_pp  =  zeros(size(q_d,1),size(time,2));

for i  =  1 : size(time,2)
    [d, ix]  =  min(abs(tout-time(i)));
    q_pp(:,i)  =  q(:, ix);
    traj_pp(:,i) = q_d(:,ix);
end

% unicycle motion
hold on
axis equal
axis ([-5 5 -5 5])
grid on
title('unicycle motion')

% unicycles
rho = 0.3;  % unicycle size
% Follower
plot(q_pp(1,1), q_pp(2,1),'LineStyle', '-', 'Color',[0.2 .7 .5],'LineWidth',4);
rectangle('Position',[q_pp(1,1)-rho/2, q_pp(2,1)-rho/2, rho, rho],'Curvature',[1,1],'EdgeColor','g','LineWidth',5);
line([q_pp(1,1);rho*cos(q_pp(3,1)) + q_pp(1,1)],[q_pp(2,1);rho*sin(q_pp(3,1))+q_pp(2,1)],'LineStyle','-','Color','g','LineWidth',5);
% Leader
plot(traj_pp(1,1), traj_pp(2,1),'LineStyle', '-', 'Color', 'k','LineWidth',1);
rectangle('Position',[traj_pp(1,1)-rho/2, traj_pp(2,1)-rho/2, rho, rho],'Curvature',[1,1],'EdgeColor','k','LineWidth',1);
line([traj_pp(1,1);rho*cos(traj_pp(3,1)) + traj_pp(1,1)],[traj_pp(2,1);rho*sin(traj_pp(3,1))+traj_pp(2,1)],'LineStyle','-','Color','k','LineWidth',1);

for i=1:1:size(q_pp,2)
    
    % delete previous plots
    cla;
    
    % follower
    plot(q_pp(1,1:i), q_pp(2,1:i),'LineStyle', '-', 'Color',[0.2 .7 .5],'LineWidth',4);
    rectangle('Position',[q_pp(1,i)-rho/2, q_pp(2,i)-rho/2, rho, rho],'Curvature',[1,1],'EdgeColor','b','LineWidth',5);
    line([q_pp(1,i);rho*cos(q_pp(3,i)) + q_pp(1,i)],[q_pp(2,i);rho*sin(q_pp(3,i))+q_pp(2,i)],'LineStyle','-','Color','b','LineWidth',5);
    % Leader
    plot(traj_pp(1,1:i), traj_pp(2,1:i),'LineStyle', '-', 'Color','k','LineWidth',1);
    rectangle('Position',[traj_pp(1,i)-rho/2, traj_pp(2,i)-rho/2, rho, rho],'Curvature',[1,1],'EdgeColor','k','LineWidth',1);
    line([traj_pp(1,i);rho*cos(traj_pp(3,i)) + traj_pp(1,i)],[traj_pp(2,i);rho*sin(traj_pp(3,i))+traj_pp(2,i)],'LineStyle','-','Color','k','LineWidth',1);
    
    drawnow
    pause(dt)
    
end

