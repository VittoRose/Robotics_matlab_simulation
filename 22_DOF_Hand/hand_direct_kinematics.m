function    [thumb, index, middle, ring, pinky] = hand_direct_kinematics(q, L, offset)
    

    % -- 2D poses -- %
    p0 = [0; 0];

    thumb = p0 + [offset(1, 1) + L(1,1)*cos(q(1)) + L(1,2)*cos(q(1)+q(2));...
                    offset(1, 2) + L(1,1)*sin(q(1)) + L(1,2)*sin(q(1)+q(2))];

    index = p0 + [offset(2, 1) + L(2,1)*cos(q(3)) + L(2,2)*cos(q(3)+q(4)) + L(2,3)*cos(q(3)+q(4)+q(5)); ... 
                    offset(2, 2) + L(2,1)*sin(q(3)) + L(2,2)*sin(q(3)+q(4)) + L(2,3)*sin(q(3)+q(4)+q(5))];

    middle = p0 + [offset(3,1) + L(3,1)*cos(q(6)) + L(3,2)*cos(q(6)+q(7)) + L(3,3)*cos(q(6)+q(7)+q(8));...
                    offset(3,2) + L(3,1)*sin(q(6)) + L(3,2)*sin(q(6)+q(7)) + L(3,3)*sin(q(6)+q(7)+q(8))];

    ring = p0 + [offset(4,1) + L(4,1)*cos(q(9)) + L(4,2)*cos(q(9)+q(10)) + L(4,3)*cos(q(9)+q(10)+q(11));...
                    offset(4,2) + L(4,1)*sin(q(9)) + L(4,2)*sin(q(9)+q(10)) + L(4,3)*sin(q(9)+q(10)+q(11))];

    pinky = p0 + [offset(5,1) + L(5,1)*cos(q(12)) + L(5,2)*cos(q(12)+q(13)) + L(5,3)*cos(q(12)+q(13)+q(14));...
                    offset(5,2) + L(5,1)*sin(q(12)) + L(5,2)*sin(q(12)+q(13)) + L(5,3)*sin(q(12)+q(13)+q(14))];
end