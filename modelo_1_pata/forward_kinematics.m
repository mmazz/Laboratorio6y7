function [ foottip_pose_from_univ_UNROTATED] = forward_kinematics(p1,p2,p3,pata)
% FORWARD KINEMATICS
%INPUT: P1, P2 AND P3 ARE STRUCTS THAT INDICATES THE DH PARAMETERS OF THE LTH LINK
    s = 'Theta fuera de rango!';
    if(p1.theta < -90*pi/180 || p1.theta > 90*pi/180)
        disp(s)
        return;
    else
    T0_1=matriz_transf_DH(p1);
    T1_2=matriz_transf_DH(p2);
    T2_3=matriz_transf_DH(p3);
    T0_3 = T0_1*T1_2*T2_3;
    ya = 60.5; %p_y links 1, (-2),3, (-4)
    yb = 100.5; %p_y links 5,6
    xa = 120.6; %p_x links 1,2, (-3),(-4)
    body_params = [  pi/4,  xa, ya; %beta, p_x , p_y FIRST LEG
                       7*pi/4,  xa,-ya; %2ND LEG
                       3*pi/4, -xa, ya; %3RD LEG
                       5*pi/4, -xa,-ya; %4TH LEG
                         pi/2,   0, yb; %5TH LEG
                       3*pi/2,   0,-yb]; %6TH LEG
     P_l = [cos(body_params(pata,1)), -sin(body_params(pata,1)) , 0 , body_params(pata,2);
            sin(body_params(pata,1)),  cos(body_params(pata,1)) , 0 , body_params(pata,3);
           0                    ,   0                  , 1 ,    0   ;
           0                    ,   0                  , 0 ,    1];
    T0_4 = P_l*T0_3;
    pose_inicial = [0,0,0,1]';
    foottip_pose_from_univ_UNROTATED = T0_4 * pose_inicial; 
    foottip_pose_from_univ_UNROTATED = foottip_pose_from_univ_UNROTATED(1:end-1);
    end
end

