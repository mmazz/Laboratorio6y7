% DININV6GDL  Dinámica inversa de un robot de 6GDL.
%  PAR = DININV6GDL(ENTRADA) calcula el vector 6x1 de pares de
%  entrada a las articulaciones utilizando el método de Newton-Euler.
%  ENTRADA(1:6) representa la posición de cada articulación. 
%  ENTRADA(7:12) es la velocidad de cada articulación. ENTRADA(13:18)
%  es la aceleración de cada articulación.
%
%  See also NEWTONEULER6.

function par = dininv6gld(entrada)

q   = entrada(1:6);    % Posición de cada articulación
qp  = entrada(7:12);   % Velocidad de cada articulación
qpp = entrada(13:18);  % Aceleración de cada articulación

% Parámetros de la carga
masaext    = 10;
inerciaext = [0.0167 0 0;0 0.0167 0;0 0 0.0167];

% Se calcula el par utilizando Newton-Euler
par = newtoneuler6(q,qp,qpp,9.8,masaext,inerciaext);
