% PLANIFICA6 	Planificación de trayectorias
%	MAT_Q = PLANIFICA6(P1, P2, N, S, A, CODO, MUNECA, NPUNTOS) realiza 
%	una planificación de trayectoria en línea recta desde la coordenada
%	cartesiana P1 hasta la P2, de manera que la mano del manipulador 
%	posee la orientación expresada por [N S A]. CODO = 1 indica codo del 
%	robot arriba, es decir, que la articulación 3 se sitúa por encima de 
%	la articulación 2, mientras que CODO = -1 indica codo	abajo, es decir 
%	que la articulación 2 se sitúa por encima de la 3. MUNECA = 1 indica que 
%	la muñeca del robot se sitúa por debajo de la coordenada	cartesiana, 
%	mientras que MUNECA = -1 significa que la muñeca se sitúa por arriba.
%	NPUNTOS indica el número de puntos en los que se divide la trayectoria.
%	En MAT_Q se devuelve las coordenadas articulares, almacenadas por
%	columnas, correspondientes a cada uno de los puntos cartesianos en los 
%	que se divide la trayectoria. MAT_Q es una matriz de NPUNTOS + 2 columnas 
%	y 6 filas. 
%
%	See also INVERSEKINEMATIC6.

function mat_q = planifica6(p1, p2, n, s, a, codo, muneca, npuntos)

% Cálculo del vector unitario
u  = p2-p1;
mu = sqrt(u(1)^2+u(2)^2+u(3)^2);
u  = (1/mu)*u;

% Cálculo de la distancia entre puntos
d = mu/(npuntos+1);

for i=0:(npuntos+1)
   % Cálculo de la posición cartesiana actual de la mano del manipulador
	p = p1+(i*d)*u;
   T = [n s a p];
   % Cálculo de las coordenadas articulares 
   q  = inversekinematic6(T,codo,muneca);
   mat_q(:,i+1) = q;
end
