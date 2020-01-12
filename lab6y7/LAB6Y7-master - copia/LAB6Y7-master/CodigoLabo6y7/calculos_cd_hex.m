clear all;clc;
syms q1 q2 q3 q4 q5;
syms a1 a2 a3 d1 d5;

p1.d=0 ; p1.a=a1 ; p1.alpha=pi/2 ;p1.q=q1;
p2.d=0  ; p2.a=a2  ; p2.alpha=0    ;p2.q=q2;
p3.d=0  ; p3.a=a3  ; p3.alpha=0    ;p3.q=q3;

T0_1=transf_DHstd(p1);
T1_2=transf_DHstd(p2);
T2_3=transf_DHstd(p3);

T0_3=simplify(T0_1*T1_2*T2_3);

syms xa ya yb;
body_params = [  pi/4,  xa, ya; %beta, p_x , p_y FIRST LEG
                   7*pi/4,  xa,-ya; %2ND LEG
                   3*pi/4, -xa, ya; %3RD LEG
                   5*pi/4, -xa,-ya; %4TH LEG
                     pi/2,   0, yb; %5TH LEG
                   3*pi/2,   0,-yb]; %6TH LEG
               
% 
% if (-1*1e-10 < cbl) && (cbl< 1e-10),cbl=0;end
% if (-1*1e-10 < salpha) && (salpha< 1e-10),salpha=0;end

cbl = cos(body_params(1,1));
sbl = sin(body_params(1,1));
P_l = [cbl, -sbl , 0 , body_params(1,2);
       sbl, cbl , 0 , body_params(1,3);
       0                    ,   0                  , 1 ,    0   ;
       0                    ,   0                  , 0 ,    1];
T0_4 = simplify(P_l*T0_3);






pos(1) = T0_5(1,4);   %x
pos(2) = T0_5(2,4);   %y
pos(3) = T0_5(3,4);   %z
pos(4) = q2 + q3 + q4;   %qpich
pos(5)= q5;       %qroll

%construimos la R_h que consiste de una rotación en z de 180° y de una
%rotación en el eje y de pi/2. La multiplicación de las matrices de
%rotación se realiza en el orden en el que se las hace.
T_h = [ 0, 0 , 1 ,0;
        0, -1, 0, 0;
        1 , 0, 0 ,0;
        0,0,0,1];
T0_h = simplify(T0_5*T_h);
