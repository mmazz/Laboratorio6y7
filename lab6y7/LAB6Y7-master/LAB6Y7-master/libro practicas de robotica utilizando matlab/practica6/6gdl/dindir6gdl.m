% DINDIR6GDL  Dinámica directa de un robot de 6GDL.
%  QPP = DINDIR6GDL(ENTRADA) calcula el vector 6x1 de aceleración de
%  cada articulación utilizando el tercer método de Walker y Orin.
%  ENTRADA(1:6) representa el par de entrada a cada articulación. 
%  ENTRADA(7:12) es la posición de cada articulación. ENTRADA(13:18)
%  es la velocidad de cada articulación.
%
%  Ver también WALKERORIN6.

function qpp = dindir6gdl(entrada)

tau = entrada(1:6);	   % Par de entrada a cada articulación
q   = entrada(7:12);	   % Posición de cada articulación
qp  = entrada(13:18);	% Velocidad de cada articulación

% Parámetros de la carga
masaext    = 10;
inerciaext = [0.0167 0 0;0 0.0167 0;0 0 0.0167];

% Se calcula la aceleración utilizando el método de Walker y Orin.
qpp = walkerorin6(q,qp,tau,masaext,inerciaext);
