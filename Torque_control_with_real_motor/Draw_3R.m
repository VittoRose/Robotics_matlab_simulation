
function Draw_3R(q1, q2, q3, a1, a2, a3, color)
%Plot the 3R planar

% Get RR position
p0 = [0; 0];
p1 = p0 + [a1*cos(q1); a1*sin(q1)];
p2 = p1 + [a2*cos(q1+q2); a2*sin(q1+q2)];
p3 = p2 + [a3*cos(q1+q2+q3); a3*cos(q1+q2+q3)];

% Set color
color_string = ['-', color, 'o'];

plot([p0(1) p1(1) p2(1) p3(1)],[p0(2) p1(2) p2(2) p3(2)], color_string, 'LineWidth',2);
end

