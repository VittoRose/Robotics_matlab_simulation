function plot_hand(q, L, offset)
    [thumb, index, middle, ring, pinky] = hand_direct_kinematics(q, L, offset);

    % -- thumb plot -- %
    plot([offset(1,1) thumb(1,1) thumb(1,2)],[offset(1,2) thumb(2,1) thumb(2,2)], '-ro', 'linewidth', 2);
    hold on
    
    % -- index plot -- %
    plot([offset(2,1) index(1,1) index(1,2) index(1,3)],[offset(2,2) index(2,1) index(2,2) index(2,3)], '-bo', 'linewidth', 2);

    % -- middle plot -- %
    plot([offset(3,1) middle(1,1) middle(1,2) middle(1,3)],[offset(3,2) middle(2,1) middle(2,2) middle(2,3)], '-yo', 'linewidth', 2);
       
    % -- ring plot -- %
    plot([offset(4,1) ring(1,1) ring(1,2) ring(1,3)],[offset(4,2) ring(2,1) ring(2,2) ring(2,3)], '-go', 'linewidth', 2);
    
    % -- pinky plot -- %
    plot([offset(5,1) pinky(1,1) pinky(1,2) pinky(1,3)],[offset(5,2) pinky(2,1) pinky(2,2) pinky(2,3)], '-ko', 'linewidth', 2);

    grid on

end
    