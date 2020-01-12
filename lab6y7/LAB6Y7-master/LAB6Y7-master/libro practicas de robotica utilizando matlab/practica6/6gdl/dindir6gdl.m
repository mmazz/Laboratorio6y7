% DINDIR6GDL  Din�mica directa de un robot de 6GDL.
%  QPP = DINDIR6GDL(ENTRADA) calcula el vector 6x1 de aceleraci�n de
%  cada articulaci�n utilizando el tercer m�todo de Walker y Orin.
%  ENTRADA(1:6) representa el par de entrada a cada articulaci�n. 
%  ENTRADA(7:12) es la posici�n de cada articulaci�n. ENTRADA(13:18)
%  es la velocidad de cada articulaci�n.
%
%  Ver tambi�n WALKERORIN6.

function qpp = dindir6gdl(entrada)

tau = entrada(1:6);	   % Par de entrada a cada articulaci�n
q   = entrada(7:12);	   % Posici�n de cada articulaci�n
qp  = entrada(13:18);	% Velocidad de cada articulaci�n

% Par�metros de la carga
masaext    = 10;
inerciaext = [0.0167 0 0;0 0.0167 0;0 0 0.0167];

% Se calcula la aceleraci�n utilizando el m�todo de Walker y Orin.
qpp = walkerorin6(q,qp,tau,masaext,inerciaext);
