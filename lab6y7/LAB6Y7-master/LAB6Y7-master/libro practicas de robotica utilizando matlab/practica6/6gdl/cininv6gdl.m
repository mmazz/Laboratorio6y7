% CININV6GDL  Cinem�tica inversa de un robot de 6GDL.
%  Q = CININV6GDL(ENTRADA) devuelve el vector 6x1 de coordenadas
%	articulares que contiene la soluci�n cinem�tica inversa. 
%	ENTRADA es un vector 3x1 que representa la posici�n expresada 
%	en coordenadas	cartesianas.
%
%	Ver tambi�n INVERSEKINEMATIC6.

function q = cininv6gdl(entrada)

% Posici�n cartesiana
p = entrada;

% Orientaci�n deseada en el extremo del robot
n = [1  0  0]';
s = [0  0 -1]';
a = [0 -1  0]';

% Matriz con la orientaci�n y posici�n deseadas en el extremo del robot
T = [n s a entrada];

% Disposici�n del codo del robot deseada
codo = 1;		% Codo arriba

% Disposici�n de la mu�eca del robot deseada
muneca = -1;	% Mu�eca por encima de la posici�n cartesiana


% Se calculan las coordenadas articulares
q = inversekinematic6(T,codo,muneca);
