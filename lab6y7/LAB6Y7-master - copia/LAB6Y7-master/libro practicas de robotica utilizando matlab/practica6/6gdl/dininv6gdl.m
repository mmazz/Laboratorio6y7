% DININV6GDL  Din�mica inversa de un robot de 6GDL.
%  PAR = DININV6GDL(ENTRADA) calcula el vector 6x1 de pares de
%  entrada a las articulaciones utilizando el m�todo de Newton-Euler.
%  ENTRADA(1:6) representa la posici�n de cada articulaci�n. 
%  ENTRADA(7:12) es la velocidad de cada articulaci�n. ENTRADA(13:18)
%  es la aceleraci�n de cada articulaci�n.
%
%  See also NEWTONEULER6.

function par = dininv6gld(entrada)

q   = entrada(1:6);    % Posici�n de cada articulaci�n
qp  = entrada(7:12);   % Velocidad de cada articulaci�n
qpp = entrada(13:18);  % Aceleraci�n de cada articulaci�n

% Par�metros de la carga
masaext    = 10;
inerciaext = [0.0167 0 0;0 0.0167 0;0 0 0.0167];

% Se calcula el par utilizando Newton-Euler
par = newtoneuler6(q,qp,qpp,9.8,masaext,inerciaext);
