% CININV6GDL  Cinemática inversa de un robot de 6GDL.
%  Q = CININV6GDL(ENTRADA) devuelve el vector 6x1 de coordenadas
%	articulares que contiene la solución cinemática inversa. 
%	ENTRADA es un vector 3x1 que representa la posición expresada 
%	en coordenadas	cartesianas.
%
%	Ver también INVERSEKINEMATIC6.

function q = cininv6gdl(entrada)

% Posición cartesiana
p = entrada;

% Orientación deseada en el extremo del robot
n = [1  0  0]';
s = [0  0 -1]';
a = [0 -1  0]';

% Matriz con la orientación y posición deseadas en el extremo del robot
T = [n s a entrada];

% Disposición del codo del robot deseada
codo = 1;		% Codo arriba

% Disposición de la muñeca del robot deseada
muneca = -1;	% Muñeca por encima de la posición cartesiana


% Se calculan las coordenadas articulares
q = inversekinematic6(T,codo,muneca);
