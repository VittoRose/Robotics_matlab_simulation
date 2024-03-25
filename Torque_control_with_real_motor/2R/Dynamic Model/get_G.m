function G = get_G(q, params)

% Basic params
g = 9.81;
a1 = params(1);
a2 = params(2);
m1 = params(3);
m2 = params(4);
l1 = params(5);
l2 = params(6);
Izz1 = params(7);
Izz2 = params(8);

% Basic expressions for dynamics
Alpha = Izz1 + Izz2 + m1*(l1)^2 + m2*(a1^2+l2^2);
Beta = m2*a1*l2;
Delta = Izz2 +m2*l2^2;

% Gravity vector
G = [m1*g*l1*cos(q(1)) + m2*g*(a1*cos(q(1)) + l2*cos(q(1)+q(2)));
    m2*g*l2*cos(q(1)+q(2))];

end

