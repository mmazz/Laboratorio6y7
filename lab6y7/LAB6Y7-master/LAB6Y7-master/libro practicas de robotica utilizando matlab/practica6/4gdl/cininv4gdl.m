% CININV4GDL  Cinem�tica inversa de un robot de 4GDL.
%  Q = CININV4GDL(ENTRADA) devuelve el vector 4x1 de coordenadas
%	articulares que contiene la soluci�n cinem�tica inversa. 
%	ENTRADA es un vector 3x1 que representa la posici�n expresada 
%	en coordenadas	cartesianas.
%
%	Ver tambi�n INVERSEKINEMATIC4.

function q = cininv4gdl(entrada)

% Posici�n cartesiana
p = entrada;

% Orientaci�n deseada en el extremo del robot
n = [1  0  0]';
s = [0  0 -1]';
a = [0  1  0]';

% Matriz con la orientaci�n y posici�n deseadas en el extremo del robot
T = [n s a entrada];

% Se calculan las coordenadas articulares
q = inversekinematic4(T);
