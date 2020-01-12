% WALKERORIN6	Tercer m�todo de Walker & Orin.
% 	QPP = WALKERORIN6(Q, QP, TAU, MASAEXT, INERCIAEXT) calcula la din�mica 
%	directa del robot de 6GDL devolviendo el vector 6x1 que representa la 
%	aceleraci�n de cada articulaci�n utilizando el tercer m�todo de Walker y Orin.
%	Q es el vector 6x1 de variables articulares. QP es el vector 6x1 que
%	representa la velocidad de cada articulaci�n. TAU es el vector 6x1
%	que representa el par de entrada a cada articulaci�n. MASAEXT es
%	la masa de la carga externa. INERCIAEXT es la inercia de la carga externa.
%
%	See also NEWTONEULER6, H6.

function qpp = walkerorin6(q,qp,tau,masaext,inerciaext)

% Se calcula el vector b.
b = newtoneuler6(q,qp,zeros(6,1),9.8,masaext,inerciaext);

% Se calcula la matriz de momentos de inercia H. 
H = h6(q,masaext,inerciaext);

% Se calcula el vector de aceleraci�n de cada articulaci�n.
qpp = inv(H)*(tau-b);
