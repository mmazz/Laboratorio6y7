%	ANIMACION4	Animación de la trayectoria de un robot de 4 GDL
%		ANIMACION(MAT_Q) realiza la animación de la trayectoria, expresada
%		en la matriz MAT_Q, de un brazo robot de 4 GDL. MAT_Q contiene 4 filas
%		y una columna para cada disposición del robot.
%
%		Ver también DRAWROBOT3D4.

function animacion4(mat_q)

% Parámetros Denavit-Hartenberg del robot. Los parámetros correspondientes
% a variables articulares aparecen con valor 0
teta = [0	  0		0		0  ];
d    = [0.4   0   	0  	0.2];
a    = [0    -0.1   	0     0  ];
alfa = [0    -pi/2   0		0  ];

% Vector de posicion (x, y, z) del sistema de coordenadas de referencia
x0 = 0;		y0 = 0;		z0 = 0;

% Se dibuja el sistema de coordenadas de referencia. Se asigna el modo XOR para borrar
% sólo el robot dibujado anteriormente. Se utiliza un grosor de línea de 2 unidades
p = plot3(x0,y0,z0,'EraseMode','xor','LineWidth',2);
% Se asigna una rejilla a los ejes
grid;
% Se establecen los límites de los ejes
axis([-1.5 1.5 -1.5 1.5 0 1.5]);
% Mantiene el gráfico actual
hold on;

% Número de columnas de la matriz
n = size(mat_q,2);

% Se dibuja la disposición del robot correspondiente a cada columna
for i=1:n
   
   % Variables articulares del brazo robot
   q1 = mat_q(1,i);
  	q2 = mat_q(2,i);
	q3 = mat_q(3,i);
  	q4 = mat_q(4,i);

   % 	Matrices de transformación homogénea entre sistemas de coordenadas consecutivos
	A01 = denavit(q1, d(1), a(1), alfa(1));
	A12 = denavit(teta(2), q2, a(2), alfa(2));
	A23 = denavit(teta(3), q3, a(3), alfa(3));
	A34 = denavit(q4, d(4), a(4), alfa(4));

	% 	Matrices de transformación del primer sistema al correspondiente
	A02 = A01 * A12;
	A03 = A02 * A23;
	A04 = A03 * A34;

	%	Vector de posicion (x, y, z) de cada sistema de coordenadas
	x1 = A01(1,4);		y1 = A01(2,4);		z1 = A01(3,4);
   xi = x1;  			yi = y1;         	zi = z1 + q2;
   x2 = A02(1,4);		y2 = A02(2,4);		z2 = A02(3,4);
	x3 = A03(1,4);   	y3 = A03(2,4);   	z3 = A03(3,4);
	x4 = A04(1,4);   	y4 = A04(2,4);   	z4 = A04(3,4);
   
	%	Se dibuja el robot
	x = [x0 x1 xi x2 x3 x4];
	y = [y0 y1 yi y2 y3 y4];
   z = [z0 z1 zi z2 z3 z4];
	set(p,'XData',x,'YData',y,'ZData',z);
   % Se fuerza a MATLAB a actualizar la pantalla
   drawnow;  
end