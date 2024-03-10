function draw_robot(q)

    L = 1;
    l1 = 1;
    l2 = 2;
    l3 = 1;
    l4 = 2;

    A = [L; 0];
    B = A + [cos(q(1))*l1; sin(q(1))*l1];
    C = B + [cos(q(1)+q(2))*l2; sin(q(1)+q(2))*l2];

    D = [-L; 0];
    E = D + [cos(q(3))*l3; sin(q(3))*l3];
    F = E + [cos(q(3)+q(4))*l4; sin(q(3)+q(4))*l4];

    %   right arm
    plot([A(1) B(1) C(1)],[A(2) B(2) C(2)], "-ro");

    axis equal; hold on
    %   left arm
    plot([D(1) E(1) F(1)],[D(2) E(2) F(2)], "-go");
    
    %   EE
    plot([C(1) F(1)], [C(2) F(2)], "-b");

end

