function    [thumb, index, middle, ring, pinky] = hand_direct_kinematics(q, L, offset)
    

    % -- 2D poses -- %
    p0 = [0; 0];

    thumb(:,1) = p0 + [offset(1, 1) + L(1,1)*cos(q(1));...
                        offset(1, 2) + L(1,1)*sin(q(1)) ];

    thumb(:,2) = p0 + [offset(1, 1) + L(1,1)*cos(q(1)) + L(1,2)*cos(q(1)+q(2));...
                    offset(1, 2) + L(1,1)*sin(q(1)) + L(1,2)*sin(q(1)+q(2))];

    thumb(:,3) = [0; 0];

    index(:,1) = p0 + [offset(2, 1) + L(2,1)*cos(q(3)); ... 
                    offset(2, 2) + L(2,1)*sin(q(3)) ];

    index(:,2) = p0 + [offset(2, 1) + L(2,1)*cos(q(3)) + L(2,2)*cos(q(3)+q(4)); ... 
                    offset(2, 2) + L(2,1)*sin(q(3)) + L(2,2)*sin(q(3)+q(4)) ];

    index(:,3) = p0 + [offset(2, 1) + L(2,1)*cos(q(3)) + L(2,2)*cos(q(3)+q(4)) + L(2,3)*cos(q(3)+q(4)+q(5)); ... 
                    offset(2, 2) + L(2,1)*sin(q(3)) + L(2,2)*sin(q(3)+q(4)) + L(2,3)*sin(q(3)+q(4)+q(5))];

    middle(:,1) = p0 + [offset(3,1) + L(3,1)*cos(q(6)) ;...
                    offset(3,2) + L(3,1)*sin(q(6)) ];

    middle(:,2) = p0 + [offset(3,1) + L(3,1)*cos(q(6)) + L(3,2)*cos(q(6)+q(7)) ;...
                    offset(3,2) + L(3,1)*sin(q(6)) + L(3,2)*sin(q(6)+q(7)) ];

    middle(:,3) = p0 + [offset(3,1) + L(3,1)*cos(q(6)) + L(3,2)*cos(q(6)+q(7)) + L(3,3)*cos(q(6)+q(7)+q(8));...
                    offset(3,2) + L(3,1)*sin(q(6)) + L(3,2)*sin(q(6)+q(7)) + L(3,3)*sin(q(6)+q(7)+q(8))];

    ring(:,1) = p0 + [offset(4,1) + L(4,1)*cos(q(9)) ;...
                    offset(4,2) + L(4,1)*sin(q(9)) ];

    ring(:,2) = p0 + [offset(4,1) + L(4,1)*cos(q(9)) + L(4,2)*cos(q(9)+q(10));...
                    offset(4,2) + L(4,1)*sin(q(9)) + L(4,2)*sin(q(9)+q(10))];

    ring(:,3) = p0 + [offset(4,1) + L(4,1)*cos(q(9)) + L(4,2)*cos(q(9)+q(10)) + L(4,3)*cos(q(9)+q(10)+q(11));...
                    offset(4,2) + L(4,1)*sin(q(9)) + L(4,2)*sin(q(9)+q(10)) + L(4,3)*sin(q(9)+q(10)+q(11))];

    pinky(:,1) = p0 + [offset(5,1) + L(5,1)*cos(q(12));...
                    offset(5,2) + L(5,1)*sin(q(12)) ];

    pinky(:,2) = p0 + [offset(5,1) + L(5,1)*cos(q(12)) + L(5,2)*cos(q(12)+q(13));...
                    offset(5,2) + L(5,1)*sin(q(12)) + L(5,2)*sin(q(12)+q(13))];

    pinky(:,3) = p0 + [offset(5,1) + L(5,1)*cos(q(12)) + L(5,2)*cos(q(12)+q(13)) + L(5,3)*cos(q(12)+q(13)+q(14));...
                    offset(5,2) + L(5,1)*sin(q(12)) + L(5,2)*sin(q(12)+q(13)) + L(5,3)*sin(q(12)+q(13)+q(14))];
end