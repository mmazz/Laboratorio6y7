% DIRECTKINEMATIC6		Direct Kinematic.
% 	A06 = DIRECTKINEMATIC6(Q) devuelve la matriz de transformación del
%	primer sistema de coordenadas al último en función del vector Q 
%	de variables articulares.
%
%	See also DENAVIT.

function A06 = directkinematic6(q)

% 	Parámetros Denavit-Hartenberg del robot
teta = q;
d    = [0.315  0      0     0.5     0    0.08];
a    = [0      0.45   0     0       0    0];
alfa = [-pi/2  0    pi/2  -pi/2   pi/2   0];

% 	Matrices de transformación homogénea entre sistemas de coordenadas consecutivos
A01 = denavit(teta(1), d(1), a(1), alfa(1));
A12 = denavit(teta(2), d(2), a(2), alfa(2));
A23 = denavit(teta(3), d(3), a(3), alfa(3));
A34 = denavit(teta(4), d(4), a(4), alfa(4));
A45 = denavit(teta(5), d(5), a(5), alfa(5));
A56 = denavit(teta(6), d(6), a(6), alfa(6));

% 	Matriz de transformación del primer al último sistema de coordenadas
A06  = A01 * A12 * A23 * A34 * A45 * A56;
