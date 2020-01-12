% PLANIFICA4  Planificaci�n de trayectorias en l�nea recta de un robot de 4GDL
% 	 Q = PLANIFICA4(ENTRADA) devuelve las coordenadas articulares 
%	 correspondientes al instante actual de simulaci�n en una planificaci�n
%	 de trayectoria en l�nea recta entre dos puntos cartesianos. ENTRADA(1) 
%   representa el instante de tiempo actual (seg). ENTRADA(2:4) es la 
%   posici�n cartesiana inicial de la trayectoria. ENTRADA(5:7) es la
%	 posici�n cartesiana final de la trayectoria.
%
%  Ver tambi�n CININV4GDL.

function q = planifica4(entrada)

t  = entrada(1);		% Instante actual de simuaci�n (seg)
p1 = entrada(2:4);	% Posici�n cartesiana inicial
p2 = entrada(5:7);	% Posici�n cartesiana final

ts = 1;					% Tiempo de simulaci�n (seg)
intervalo = 1e-4;		% Intervalo de integraci�n (seg)

% N�mero de segmentos de la trayectoria
nseg = ts/intervalo;

% C�lculo del vector unitario
u  = p2-p1;
mu = sqrt(u(1)^2+u(2)^2+u(3)^2);
u  = (1/mu)*u;

% C�lculo de la distancia entre puntos
d = mu/nseg;

% N�mero de punto actual en la trayectoria (el inicial es 0)
i  = t*nseg;

% C�lculo de la posici�n cartesiana actual de la mano del manipulador
ps = p1+(i*d)*u;

% C�lculo de las coordenadas articulares 
q  = cininv4gdl(ps);
