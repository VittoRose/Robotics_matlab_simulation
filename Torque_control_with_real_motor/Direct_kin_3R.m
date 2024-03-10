function [x_ee, y_ee] = Direct_kin_3R(q1, q2, q3, a1, a2, a3)
    % get the end effector position using the angle as an input

    p0 = [0;0];
    p1 = p0 + [a1*cos(q1); a1*sin(q1)];
    p2 = p1 + [a2*cos(q1+q2); a2*sin(q1+q2)];
    p3 = p2 + [a3*cos(q1+q2+q3); a3*cos(q1+q2+q3)];
    
    x_ee = p3(1);
    y_ee = p3(2);
end

