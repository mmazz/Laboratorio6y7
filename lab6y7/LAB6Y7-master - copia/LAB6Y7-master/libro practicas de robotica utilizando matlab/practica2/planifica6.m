% PLANIFICA6 	Planificaci�n de trayectorias
%	MAT_Q = PLANIFICA6(P1, P2, N, S, A, CODO, MUNECA, NPUNTOS) realiza 
%	una planificaci�n de trayectoria en l�nea recta desde la coordenada
%	cartesiana P1 hasta la P2, de manera que la mano del manipulador 
%	posee la orientaci�n expresada por [N S A]. CODO = 1 indica codo del 
%	robot arriba, es decir, que la articulaci�n 3 se sit�a por encima de 
%	la articulaci�n 2, mientras que CODO = -1 indica codo	abajo, es decir 
%	que la articulaci�n 2 se sit�a por encima de la 3. MUNECA = 1 indica que 
%	la mu�eca del robot se sit�a por debajo de la coordenada	cartesiana, 
%	mientras que MUNECA = -1 significa que la mu�eca se sit�a por arriba.
%	NPUNTOS indica el n�mero de puntos en los que se divide la trayectoria.
%	En MAT_Q se devuelve las coordenadas articulares, almacenadas por
%	columnas, correspondientes a cada uno de los puntos cartesianos en los 
%	que se divide la trayectoria. MAT_Q es una matriz de NPUNTOS + 2 columnas 
%	y 6 filas. 
%
%	See also INVERSEKINEMATIC6.

function mat_q = planifica6(p1, p2, n, s, a, codo, muneca, npuntos)

% C�lculo del vector unitario
u  = p2-p1;
mu = sqrt(u(1)^2+u(2)^2+u(3)^2);
u  = (1/mu)*u;

% C�lculo de la distancia entre puntos
d = mu/(npuntos+1);

for i=0:(npuntos+1)
   % C�lculo de la posici�n cartesiana actual de la mano del manipulador
	p = p1+(i*d)*u;
   T = [n s a p];
   % C�lculo de las coordenadas articulares 
   q  = inversekinematic6(T,codo,muneca);
   mat_q(:,i+1) = q;
end
