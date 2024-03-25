function [xi, dxi] = RR_forward_kinematics(q, dq, params)
    
    % jacobian
    J = get_J(q, params);

    % position
    [p0, p1, xi] = RR_chain(q, params);

    % velocity
    dxi = J * dq;
end