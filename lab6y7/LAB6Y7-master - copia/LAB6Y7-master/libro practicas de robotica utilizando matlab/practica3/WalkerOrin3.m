% WALKERORIN3	Tercer m�todo de Walker & Orin.
% 	QPP = WALKERORIN3(Q, QP, TAU, MASAEXT, INERCIAEXT) calcula la cinem�tica 
%	inversa del robot de 3GDL devolviendo el vector 3x1 que representa la 
%	aceleraci�n de cada articulaci�n utilizando el tercer m�todo de Walker y Orin.
%	Q es el vector 3x1 de variables articulares. QP es el vector 3x1 que
%	representa la velocidad de cada articulaci�n. TAU es el vector 3x1
%	que representa el par de entrada a cada articulaci�n. MASAEXT es
%	la masa de la carga externa. INERCIAEXT es la inercia de la carga externa.
%
%	See also NEWTONEULER3, H3.

function qpp = walkerorin3(q,qp,tau,masaext,inerciaext)

% Se calcula el vector b.
b = newtoneuler3(q,qp,zeros(3,1),9.8,masaext,inerciaext);

% Se calcula la matriz de momentos de inercia H. 
H = h3(q,masaext,inerciaext);

% Se calcula el vector de aceleraci�n de cada articulaci�n.
qpp = inv(H)*(tau-b);
