function J_middle = get_J_middle(in1)
%get_J_middle
%    J_middle = get_J_middle(IN1)

%    This function was generated by the Symbolic Math Toolbox version 9.2.
%    10-Oct-2023 12:39:39

q6 = in1(6,:);
q7 = in1(7,:);
q8 = in1(8,:);
t2 = q6+q7;
t3 = cos(t2);
t4 = q8+t2;
t5 = sin(t2);
t6 = cos(t4);
t7 = sin(t4);
t8 = t3.*2.0e+1;
t9 = t5.*2.0e+1;
t10 = -t9;
t11 = t6.*2.5e+1;
t12 = t7.*2.5e+1;
t13 = -t12;
J_middle = reshape([0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,t10+t13-sin(q6).*5.1e+1,t8+t11+cos(q6).*5.1e+1,1.0,t10+t13,t8+t11,1.0,t13,t11,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0],[3,14]);
