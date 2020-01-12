% DIRECTKINEMATIC4		Direct Kinematic.
% 	A04 = DIRECTKINEMATIC4(Q) devuelve la matriz de transformación del
%	primer sistema de coordenadas al último en función del vector Q 
%	de variables articulares.
%
%	See also DENAVIT.

function A04 = directkinematic4(q)

% 	Parámetros Denavit-Hartenberg del robot
teta = [q(1)	0	    0	    q(4)];
d    = [0.4    q(2)   q(3)  0.2 ];
a    = [0     -0.1    0     0   ];
alfa = [0     -pi/2	 0     0   ];

% 	Matrices de transformación homogénea entre sistemas de coordenadas consecutivos
A01 = denavit(teta(1), d(1), a(1), alfa(1));
A12 = denavit(teta(2), d(2), a(2), alfa(2));
A23 = denavit(teta(3), d(3), a(3), alfa(3));
A34 = denavit(teta(4), d(4), a(4), alfa(4));

% 	Matriz de transformación del primer al último sistema de coordenadas
A04  = A01 * A12 * A23 * A34;
