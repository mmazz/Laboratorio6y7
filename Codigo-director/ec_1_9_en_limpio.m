clear all;clc;
syms q1 q2 q3 q4 q5;
syms a1 a2 a3 d1 d5;

p1.d=d1 ; p1.a=a1 ; p1.alpha=pi/2 ;p1.q=q1;
p2.d=0  ; p2.a=a2  ; p2.alpha=0    ;p2.q=q2;
p3.d=0  ; p3.a=a3  ; p3.alpha=0    ;p3.q=q3;
p4.d=0  ; p4.a=0   ; p4.alpha=pi/2 ;p4.q=q4+pi/2;
p5.d=d5 ; p5.a=0   ; p5.alpha=0    ;p5.q=q5;

T0_1=transf_DHstd(p1);
T1_2=transf_DHstd(p2);
T2_3=transf_DHstd(p3);
T3_4=transf_DHstd(p4);
T4_5=transf_DHstd(p5);

T1_4=T1_2*T2_3*T3_4;
T1_4=simplify(T1_2*T2_3*T3_4);
T1_5=simplify(T1_4*T4_5);
T0_5=T0_1*T1_4*T4_5;  
T0_5=simplify(T0_1*T1_4*T4_5);  

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
