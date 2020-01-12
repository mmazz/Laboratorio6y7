% DININV4GDL  Dinámica inversa de un robot de 4GDL.
%  PAR = DININV4GDL(ENTRADA) calcula el vector 4x1 de pares/fuerzas de
%  entrada a las articulaciones utilizando el método de Newton-Euler.
%  ENTRADA(1:4) representa la posición de cada articulación. 
%  ENTRADA(5:8) es la velocidad de cada articulación. ENTRADA(9:12)
%  es la aceleración de cada articulación.
%
%  See also NEWTONEULER4.

function par = dininv4gld(entrada)

q   = entrada(1:4);    % Posición de cada articulación
qp  = entrada(5:8);    % Velocidad de cada articulación
qpp = entrada(9:12);   % Aceleración de cada articulación

% Parámetros de la carga
masaext    = 10;
inerciaext = [0.0167 0 0;0 0.0167 0;0 0 0.0167];

% Se calcula el vector de pares/fuerzas utilizando Newton-Euler
par = newtoneuler4(q,qp,qpp,9.8,masaext,inerciaext);
