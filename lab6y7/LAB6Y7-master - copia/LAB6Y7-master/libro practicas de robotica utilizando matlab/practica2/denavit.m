% DENAVIT  		Matriz de transformaci�n homog�nea.
% 	DH = DENAVIT(theta, D, A, alpha) devuelve la matriz de transformacion 
%	homog�nea 4 x 4 a partir de los parametros de Denavit-Hartenberg
%	D, alpha, A y theta.
%
%	See also DIRECTKINEMATIC.

function dh=denavit(theta, d, a, alpha)
dh=[cos(theta)  -cos(alpha)*sin(theta)   sin(alpha)*sin(theta)   a*cos(theta);
    sin(theta)   cos(alpha)*cos(theta)  -sin(alpha)*cos(theta)   a*sin(theta);
           0              sin(alpha)             cos(alpha)             d;
           0                     0                     0              1];
end



