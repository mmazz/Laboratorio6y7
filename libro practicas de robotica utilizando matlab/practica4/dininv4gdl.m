% DININV4GDL  Din�mica inversa de un robot de 4GDL.
%  PAR = DININV4GDL(ENTRADA) calcula el vector 4x1 de pares/fuerzas de
%  entrada a las articulaciones utilizando el m�todo de Newton-Euler.
%  ENTRADA(1:4) representa la posici�n de cada articulaci�n. 
%  ENTRADA(5:8) es la velocidad de cada articulaci�n. ENTRADA(9:12)
%  es la aceleraci�n de cada articulaci�n.
%
%  See also NEWTONEULER4.

function par = dininv4gld(entrada)

q   = entrada(1:4);    % Posici�n de cada articulaci�n
qp  = entrada(5:8);    % Velocidad de cada articulaci�n
qpp = entrada(9:12);   % Aceleraci�n de cada articulaci�n

% Par�metros de la carga
masaext    = 10;
inerciaext = [0.0167 0 0;0 0.0167 0;0 0 0.0167];

% Se calcula el vector de pares/fuerzas utilizando Newton-Euler
par = newtoneuler4(q,qp,qpp,9.8,masaext,inerciaext);
