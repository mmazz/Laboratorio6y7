%	ANIMACION3	Animación del movimiento del péndulo de 3GDL.
%		ANIMACION3(MAT_Q) realiza la animación del movimiento del
%		péndulo de 3GDL a partir de las coordenadas articulares
%		almacenadas en la matriz MAT_Q. MAT_Q contiene 3 filas
%		y una columna para cada disposición del robot durante el
%		movimiento.

function animacion3(mat_q)

% 	Parámetros Denavit-Hartenberg del robot
d    = [0 0 0];
a    = [1 1 1];
alfa = [0 0 0];

% Vector de posicion (x, y) del sistema de coordenadas de referencia
x0 = 0;	y0 = 0;

% Se dibuja el sistema de coordenadas de referencia. Se asigna el modo XOR para borrar
% sólo el robot dibujado anteriormente.
p = plot(x0,y0,'EraseMode','xor');
% Se asigna una rejilla a los ejes
grid;
% Se establecen los límites de los ejes
axis([-3.2 3.2 -3.1 1]);

% Mantiene el gráfico actual
hold on;

% Número de columnas de la matriz
n = size(mat_q,2);

% Se dibuja la disposición del robot correspondiente a cada columna
for i=1:n
   % Variables articulares del brazo robot
   teta1 = mat_q(1,i);
  	teta2 = mat_q(2,i);
	teta3 = mat_q(3,i);

   % 	Matrices de transformación homogénea entre sistemas de coordenadas consecutivos
	A01 = denavit(teta1, d(1), a(1), alfa(1));
	A12 = denavit(teta2, d(2), a(2), alfa(2));
	A23 = denavit(teta3, d(3), a(3), alfa(3));

	% 	Matrices de transformación del primer sistema al correspondiente
	A02 = A01 * A12;
	A03 = A02 * A23;

	%	Vector de posicion (x, y) de cada sistema de coordenadas
	x1 = A01(1,4);		y1 = A01(2,4);
	x2 = A02(1,4);		y2 = A02(2,4);
	x3 = A03(1,4);   	y3 = A03(2,4);

	%	Se dibuja el robot
	x = [x0 x1 x2 x3];
	y = [y0 y1 y2 y3];
	set(p,'XData',x,'YData',y);
   % Se fuerza a MATLAB a actualizar la pantalla
   drawnow;  
end