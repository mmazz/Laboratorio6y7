% 	DH		Matriz de rotación.
% 		R = DH(TETA, ALFA) devuelve la matriz de rotación 3x3 utilizando 
%		los parámetros de Denavit-Hartenberg TETA y ALFA.
%
%		See also DENAVIT.

function R = dh(teta,alfa)

R = [cos(teta)  -cos(alfa)*sin(teta)   sin(alfa)*sin(teta)
     sin(teta)   cos(alfa)*cos(teta)  -sin(alfa)*cos(teta)
	         0              sin(alfa)             cos(alfa)];

