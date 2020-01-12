% DINDIR4GDL  Din�mica directa de un robot de 4GDL.
%  QPP = DINDIR4GDL(ENTRADA) calcula el vector 4x1 de aceleraci�n de
%  cada articulaci�n utilizando el tercer m�todo de Walker y Orin.
%  ENTRADA(1:4) representa el par de entrada a cada articulaci�n. 
%  ENTRADA(5:8) es la posici�n de cada articulaci�n. ENTRADA(9:12)
%  es la velocidad de cada articulaci�n.
%
%  Ver tambi�n WALKERORIN4.

function qpp = dindir4gdl(entrada)

tau = entrada(1:4);	   % Par de entrada a cada articulaci�n
q   = entrada(5:8);	   % Posici�n de cada articulaci�n
qp  = entrada(9:12);		% Velocidad de cada articulaci�n

% Par�metros de la carga
masaext    = 10;
inerciaext = [0.0167 0 0;0 0.0167 0;0 0 0.0167];

% Se convierten los pares de la articulaci�n 2 y 3 en fuerzas.
n = 0.85;	% Eficiencia husillo
p = 0.025;	% Paso del husillo (mm)
tau(2:3) = 2*pi*tau(2:3)/p;

% Se calcula la aceleraci�n utilizando el m�todo de Walker y Orin.
qpp = walkerorin4(q,qp,tau,masaext,inerciaext);
