%CODIGO DE FACUNDO PESSACG!!!
clear,clc


%%%%%%%Link(theta d a alpha 0o1)
L(1) = Link([ 0     0.334  0.101   pi/2   0], 'stdDH');
L(2) = Link([ 0     0      0.220   0      0], 'stdDH');
L(3) = Link([ 0     0      0.220   0      0], 'stdDH');
L(4) = Link([ 0     0      0       pi/2   0], 'stdDH');
L(5) = Link([ 0     0.137  0       0      0], 'stdDH');

scorbot_v5plus = SerialLink(L, 'name', 'scorbot_v5plus');

%Grafico estado robot para q1,q2,q3,q4,q5
q1 = 0; q2 = 0; q3 = 0;q4 = 0;q5 = 180;
q1=q1*pi /180; q2=q2*pi /180; q3=q3*pi /180;q4=q4*pi /180;q5=q5*pi /180;

figure(1),scorbot_v5plus.plot([q1 q2 q3 q4 q5]) 
view([0 0]);
%view([0 0]);zlim([-1 1]);daspect([1 1 1])
% figure(2),scorbot_v5plus.plot([0 pi/4 pi/4 pi/4 pi/4])

% % syms q1 q2 q3 q4 q4;
%Calculo cinematica directa
% % scorbot_v5plus.fkine([q1 q2 q3 q4 q5])