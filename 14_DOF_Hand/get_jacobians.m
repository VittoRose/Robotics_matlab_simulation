%% ----- 14 DOF Hand control - SCRIPT TO SYMBOLICALLY COMPUTE JACOBIANS ----- %%

syms q1 q2 q3 q4 q5 q6 q7 q8 q9 q10 q11 q12 q13 q14;

q = [q1; q2; q3; q4; q5; q6; q7; q8; q9; q10; q11; q12; q13; q14];
L = [31 31.5 0; 50 25 20; 51 20 25; 50 25 20; 45 25 20];
offset = [-20 0; 0 20; 3 27; 4 27; 5 23];

[thumb, index, middle, ring, pinky] = hand_direct_kinematics(q, L, offset);

J_thumb = jacobian(thumb(:),q);
J_index = jacobian(index(:),q);
J_middle = jacobian(middle(:),q);
J_ring = jacobian(ring(:),q);
J_pinky = jacobian(pinky(:),q);

disp('writing functions...')
matlabFunction(J_thumb,'file','functions\get_J_thumb', 'Vars', {q});
matlabFunction(J_index,'file','functions\get_J_index', 'Vars', {q});
matlabFunction(J_middle,'file','functions\get_J_middle', 'Vars', {q});
matlabFunction(J_ring,'file','functions\get_J_ring', 'Vars', {q});
matlabFunction(J_pinky,'file','functions\get_J_pinky', 'Vars', {q});
disp('done!')