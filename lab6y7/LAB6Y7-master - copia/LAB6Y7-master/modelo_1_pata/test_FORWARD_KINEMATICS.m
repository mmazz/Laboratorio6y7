% FORWARD KINEMATICS
%DH PARAMETERS
syms theta1 theta2 theta3;
syms a1 a2 a3 d5;
syms theta1_off theta2_off theta3_off;
theta1 = -2; theta2 = 0;    theta3 = 0;
a1 = 58; a2 = 65; a3 = 133; %milimeters
theta1_off =0; theta2_off = -0.22; theta3_off = -0.81;
p1.d=0 ; p1.a=a1 ; p1.alpha=pi/2 ;p1.theta=theta1;
p2.d=0  ; p2.a=a2  ; p2.alpha=0    ;p2.theta=theta2;
p3.d=0  ; p3.a=a3  ; p3.alpha=0    ;p3.theta=theta3;
p4.d=0  ; p4.a=0   ; p4.alpha=pi/2 ;p4.theta=-pi/2;
p1.theta_off = theta1_off; p2.theta_off = theta2_off; p3.theta_off =theta3_off;
%WE MAKE A TEST!


T0_1=matriz_transf_DH(p1);
T1_2=matriz_transf_DH(p2);
T2_3=matriz_transf_DH(p3);

T0_3 = T0_1*T1_2*T2_3;
% T3_FOOTTIP = matriz_transf_DH(p4);
%BODY PARAMETERS
ya = 60.5; %p_y links 1, (-2),3, (-4)
yb = 100.5; %p_y links 5,6
xa = 120.6; %p_x links 1,2, (-3),(-4)
body_params = [  pi/4,  xa, ya; %beta, p_x , p_y FIRST LEG
                   7*pi/4,  xa,-ya; %2ND LEG
                   3*pi/4, -xa, ya; %3RD LEG
                   5*pi/4, -xa,-ya; %4TH LEG
                     pi/2,   0, yb; %5TH LEG
                   3*pi/2,   0,-yb]; %6TH LEG
P_l = [cos(body_params(1,1)), -sin(body_params(1,1)) , 0 , body_params(1,2);
       sin(body_params(1,1)), cos(body_params(1,1)) , 0 , body_params(1,3);
       0                    ,   0                  , 1 ,    0   ;
       0                    ,   0                  , 0 ,    1];
       
%WE CHECK EQ (2)
pose_final_foottip = [0,0,0,1];

pose_final_foottip_desde_TIERRA= P_l*T0_3*T3_FOOTTIP*pose_final_foottip;
%pose_final_foottip_desde_TIERRA= P_l*T0_3*pose_final_foottip;

