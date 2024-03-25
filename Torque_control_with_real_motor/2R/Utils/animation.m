%% PLOTS

clear Le f;
f = figure;
f.WindowState = 'maximized';
pause(0.1)

% Getting Vectors from Sim
e_out = out.e_out.Data;
q_out = out.q_out.Data;
q_des_out = out.q_des_out.Data;
xi_des_out = out.xi_des_out.Data;
t_out = out.tout;

% post process
res = 0.1;
[t_sim, q_sim] = adjust_time(t_out,q_out,res);
[~, q_sim_des] = adjust_time(t_out,q_des_out,res);
[~, xi_des] = adjust_time(t_out,xi_des_out,res);

% errors
h(1) = subplot(1,2,1);
hold on
plot(t_out,e_out(1,:));
plot(t_out,e_out(2,:));
grid on
legend('$e_x$','$e_y$','Interpreter','latex')
title('Errors')

% robot motion
h(2) = subplot(1,2,2);
hold on
axis equal
axis ([-0.5 2.5 -2.0 2.0])
grid on
title('Animation - PD or Computed torque')

% initialize animation
t_h = text(2.2,2.2,['(' num2str(0) ')']);
t_xi = plot(xi_des(1,:,:),xi_des(2,:,:),'r');
Le(1)=plot_robot(q_sim(:,1),params,1);
Le(2)=plot_robot(q_sim_des(:,1),params,0);
legend(Le, {'execution','reference'})

pause

for i=1:1:size(t_sim,2)
    
    delete(Le(1))
    delete(Le(2))
    delete(t_h)
    
    t_h = text(2.2,2.2,['(' num2str(t_sim(i)) ')']);
    hold on
    Le(1)=plot_robot(q_sim(:,i),params,1);
    Le(2)=plot_robot(q_sim_des(:,i),params,0);
    legend(Le, {'execution','reference'})
    
    drawnow
    pause(0.01)
    
end