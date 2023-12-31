function J_index = get_J_index(in1)
%get_J_index
%    J_index = get_J_index(IN1)

%    This function was generated by the Symbolic Math Toolbox version 9.2.
%    10-Oct-2023 12:39:39

q3 = in1(3,:);
q4 = in1(4,:);
q5 = in1(5,:);
t2 = q3+q4;
t3 = cos(t2);
t4 = q5+t2;
t5 = sin(t2);
t6 = cos(t4);
t7 = sin(t4);
t8 = t3.*2.5e+1;
t9 = t5.*2.5e+1;
t10 = -t9;
t11 = t6.*2.0e+1;
t12 = t7.*2.0e+1;
t13 = -t12;
J_index = reshape([0.0,0.0,0.0,0.0,0.0,0.0,t10+t13-sin(q3).*5.0e+1,t8+t11+cos(q3).*5.0e+1,1.0,t10+t13,t8+t11,1.0,t13,t11,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0],[3,14]);
