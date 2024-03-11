%% Script to analyse error data from simulation

% Get data from simulink
x = out.x.Data;
y = out.y.Data;
theta = out.theta.Data;
t = out.tout;

% Reshape if needed
x = reshape(x,1,size(x,3));
y = reshape(y,1,size(y,3));
theta = reshape(theta,1,size(theta,3));

figure
% Plot
subplot(3,1,1)
plot(t, x, 'LineWidth',2)
xlabel("Time")
ylabel("e_x")
title("Error on x")
grid on

subplot(3,1,2)
plot(t,y,'LineWidth',2)
title("Error on y")
ylabel("e_y")
xlabel("Time")
grid on

subplot(3,1,3)
plot(t,theta,'LineWidth',2)
title("Error on \theta")
ylabel("e_\theta")
xlabel("Time")
grid on