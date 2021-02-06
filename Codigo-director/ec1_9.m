syms d_1 d_5 a_1 a_2 a_3 theta_1 theta_2 theta_3 theta_4 theta_5;
%dh(theta, d, a, alpha)
T_0_1 = dh(theta_1,d_1,a_1,pi/2);
T_1_2 = dh(theta_2,0,a_2,0);
T_2_3 = dh(theta_3,0,a_3,0);
T_3_4 = dh(theta_4 + pi/2,0,0, pi/2);
T_4_5 = dh(theta_5,d_5,0, 0); 
T_0_5 = T_0_1*T_1_2*T_2_3*T_3_4*T_4_5;
simplify(T_0_5)