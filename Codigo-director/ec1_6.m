% T = [R 0] [r 1] ec 1.6 a 1.7
%r = d_i z^ + a_i (cos theta_i x^ + sin theta_i y^)
syms d a;
assume([d a], 'real');
d_i = [0 0 d 0];
d_i = (d_i)';
d_i
syms theta;
assume(theta, 'real');
a_i = a.*[cos(theta) sin(theta) 0 0];
a_i = (a_i)';
a_i
r= d_i + a_i;
r
%R
R_x = [1 0 0 ; 0 cos(theta) -sin(theta) ; 0 sin(theta) cos(theta)];
R_z = [cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0 ; 0 0 1];
R_y = [cos(theta) 0 sin(theta) ; 0 1 0 ; -sin(theta) 0 cos(theta)];
%vamos por la 1.7
Rot_z = [cos(theta) -sin(theta) 0 0 ; sin(theta) cos(theta) 0 0 ; 0 0 1 0 ;0 0 0 1];
Tras_z = [1 0 0 0 ; 0 1 0 0 ; 0 0 1 d ; 0 0 0 1];
syms alpha x y z;
Rot_x = [1 0 0 0 ; 0 cos(alpha) -sin(alpha) 0 ; 0 sin(alpha) cos(alpha) 0 ; 0 0 0 1];
Tras_x = [1 0 0 a ; 0 1 0 0 ; 0 0 1 0 ; 0 0 0 1];
% T = Tras_x * Rot_x
T = Tras_z*Rot_z*Tras_x * Rot_x;
T
%T es la matriz de transformación de la trama i-1 a la trama i.
T_0_1 = Tras_z*Rot_z*Tras_x * Rot_x;


