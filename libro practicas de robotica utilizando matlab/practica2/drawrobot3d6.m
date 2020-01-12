% DRAWROBOT3D6	Representación 3D de un robot.
%	DRAWROBOT3D6(Q) realiza una representación 3D de un robot 
%	en función del vector de variables articulares Q.
%
%	See also DENAVIT, DIRECTKINEMATIC6.


function drawrobot3d6(q)

% 	Parámetros Denavit-Hartenberg del robot
teta = q;
d    = [0.315  0      0     0.5     0    0.08];
a    = [0      0.45   0     0       0    0   ];
alfa = [-pi/2  0    pi/2  -pi/2   pi/2   0   ];

% 	Matrices de transformación homogénea entre sistemas de coordenadas consecutivos
A01 = denavit(teta(1), d(1), a(1), alfa(1));
A12 = denavit(teta(2), d(2), a(2), alfa(2));
A23 = denavit(teta(3), d(3), a(3), alfa(3));
A34 = denavit(teta(4), d(4), a(4), alfa(4));
A45 = denavit(teta(5), d(5), a(5), alfa(5));
A56 = denavit(teta(6), d(6), a(6), alfa(6));

% 	Matrices de transformación del primer sistema al correspondiente
A02 = A01 * A12;
A03 = A02 * A23;
A04 = A03 * A34;
A05 = A04 * A45;
A06 = A05 * A56;

%	Vector de posicion (x, y, z) de cada sistema de coordenadas
x0 = 0;				y0 = 0;				z0 = 0;
x1 = A01(1,4);		y1 = A01(2,4);		z1 = A01(3,4);
x2 = A02(1,4);		y2 = A02(2,4);		z2 = A02(3,4);
x3 = A03(1,4);   	y3 = A03(2,4);   	z3 = A03(3,4);
x4 = A04(1,4);   	y4 = A04(2,4);   	z4 = A04(3,4);
x5 = A05(1,4);   	y5 = A05(2,4);   	z5 = A05(3,4);
x6 = A06(1,4);   	y6 = A06(2,4);   	z6 = A06(3,4);

%	Se dibuja el robot
x = [x0 x1 x2 x3 x4 x5 x6];
y = [y0 y1 y2 y3 y4 y5 y6];
z = [z0 z1 z2 z3 z4 z5 z6];
plot3(x,y,z);
% Se coloca una rejilla a los ejes
grid;
% Se establecen los límites de los ejes
axis([-1 1 -1 1 0 1.5]);
