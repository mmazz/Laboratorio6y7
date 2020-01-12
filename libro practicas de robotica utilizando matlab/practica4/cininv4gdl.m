% CININV4GDL  Cinemática inversa de un robot de 4GDL.
%  Q = CININV4GDL(ENTRADA) devuelve el vector 4x1 de coordenadas
%	articulares que contiene la solución cinemática inversa. 
%	ENTRADA es un vector 3x1 que representa la posición expresada 
%	en coordenadas	cartesianas.
%
%	Ver también INVERSEKINEMATIC4.

function q = cininv4gdl(entrada)

% Posición cartesiana
p = entrada;

% Orientación deseada en el extremo del robot
n = [1  0  0]';
s = [0  0 -1]';
a = [0  1  0]';

% Matriz con la orientación y posición deseadas en el extremo del robot
T = [n s a entrada];

% Se calculan las coordenadas articulares
q = inversekinematic4(T);
