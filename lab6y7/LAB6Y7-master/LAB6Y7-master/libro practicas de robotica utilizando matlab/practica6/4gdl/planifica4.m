% PLANIFICA4  Planificación de trayectorias en línea recta de un robot de 4GDL
% 	 Q = PLANIFICA4(ENTRADA) devuelve las coordenadas articulares 
%	 correspondientes al instante actual de simulación en una planificación
%	 de trayectoria en línea recta entre dos puntos cartesianos. ENTRADA(1) 
%   representa el instante de tiempo actual (seg). ENTRADA(2:4) es la 
%   posición cartesiana inicial de la trayectoria. ENTRADA(5:7) es la
%	 posición cartesiana final de la trayectoria.
%
%  Ver también CININV4GDL.

function q = planifica4(entrada)

t  = entrada(1);		% Instante actual de simuación (seg)
p1 = entrada(2:4);	% Posición cartesiana inicial
p2 = entrada(5:7);	% Posición cartesiana final

ts = 1;					% Tiempo de simulación (seg)
intervalo = 1e-4;		% Intervalo de integración (seg)

% Número de segmentos de la trayectoria
nseg = ts/intervalo;

% Cálculo del vector unitario
u  = p2-p1;
mu = sqrt(u(1)^2+u(2)^2+u(3)^2);
u  = (1/mu)*u;

% Cálculo de la distancia entre puntos
d = mu/nseg;

% Número de punto actual en la trayectoria (el inicial es 0)
i  = t*nseg;

% Cálculo de la posición cartesiana actual de la mano del manipulador
ps = p1+(i*d)*u;

% Cálculo de las coordenadas articulares 
q  = cininv4gdl(ps);
