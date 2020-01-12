% DINDIR4GDL  Dinámica directa de un robot de 4GDL.
%  QPP = DINDIR4GDL(ENTRADA) calcula el vector 4x1 de aceleración de
%  cada articulación utilizando el tercer método de Walker y Orin.
%  ENTRADA(1:4) representa el par de entrada a cada articulación. 
%  ENTRADA(5:8) es la posición de cada articulación. ENTRADA(9:12)
%  es la velocidad de cada articulación.
%
%  Ver también WALKERORIN4.

function qpp = dindir4gdl(entrada)

tau = entrada(1:4);	   % Par de entrada a cada articulación
q   = entrada(5:8);	   % Posición de cada articulación
qp  = entrada(9:12);		% Velocidad de cada articulación

% Parámetros de la carga
masaext    = 10;
inerciaext = [0.0167 0 0;0 0.0167 0;0 0 0.0167];

% Se convierten los pares de la articulación 2 y 3 en fuerzas.
n = 0.85;	% Eficiencia husillo
p = 0.025;	% Paso del husillo (mm)
tau(2:3) = 2*pi*tau(2:3)/p;

% Se calcula la aceleración utilizando el método de Walker y Orin.
qpp = walkerorin4(q,qp,tau,masaext,inerciaext);
