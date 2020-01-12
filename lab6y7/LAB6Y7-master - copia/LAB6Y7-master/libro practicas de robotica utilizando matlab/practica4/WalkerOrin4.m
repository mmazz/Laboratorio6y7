% WALKERORIN4	Tercer método de Walker & Orin.
% 	QPP = WALKERORIN4(Q, QP, TAU, MASAEXT, INERCIAEXT) calcula la dinámica 
%	directa del robot de 4GDL devolviendo el vector 4x1 que representa la 
%	aceleración de cada articulación utilizando el tercer método de Walker y Orin.
%	Q es el vector 4x1 de variables articulares. QP es el vector 4x1 que
%	representa la velocidad de cada articulación. TAU es el vector 4x1
%	que representa el par de entrada a cada articulación. MASAEXT es
%	la masa de la carga externa. INERCIAEXT es la inercia de la carga externa.
%
%	See also NEWTONEULER4, H4.

function qpp = walkerorin4(q,qp,tau,masaext,inerciaext)

% Se calcula el vector b.
b = newtoneuler4(q,qp,zeros(4,1),9.8,masaext,inerciaext);

% Se calcula la matriz de momentos de inercia H. 
H = h4(q,masaext,inerciaext);

% Se calcula el vector de aceleración de cada articulación.
qpp = inv(H)*(tau-b);
