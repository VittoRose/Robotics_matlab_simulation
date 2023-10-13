function J_ring = get_J_ring(in1)
%get_J_ring
%    J_ring = get_J_ring(IN1)

%    This function was generated by the Symbolic Math Toolbox version 9.2.
%    10-Oct-2023 12:39:39

q9 = in1(9,:);
q10 = in1(10,:);
q11 = in1(11,:);
t2 = q9+q10;
t3 = cos(t2);
t4 = q11+t2;
t5 = sin(t2);
t6 = cos(t4);
t7 = sin(t4);
t8 = t3.*2.5e+1;
t9 = t5.*2.5e+1;
t10 = -t9;
t11 = t6.*2.0e+1;
t12 = t7.*2.0e+1;
t13 = -t12;
J_ring = reshape([0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,t10+t13-sin(q9).*5.0e+1,t8+t11+cos(q9).*5.0e+1,1.0,t10+t13,t8+t11,1.0,t13,t11,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0],[3,14]);