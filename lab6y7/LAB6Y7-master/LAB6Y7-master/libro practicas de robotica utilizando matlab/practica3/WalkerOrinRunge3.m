% WALKERORINRUNGE3	Tercer método de Walker & Orin.
% 	[QFIN, QPFIN] = WALKERORINRUNGE3(QINI, QPINI, PAR, T0, TF, MASAEXT, 
%	INERCIAEXT) calcula la posición y la velocidad de cada articulación
%	del péndulo de 3 GDL combinando el tercer método de Walker & Orin 
%	con el método de integración de Runge-Kutta de orden cuatro.
%	QINI es el vector 3x1 de variables articulares en el instante de
%	tiempo T0. QPINI es el vector 3x1 que representa la velocidad de
%	cada articulación  en el instante de tiempo T0. PAR es el vector 
%	3x1 que representa el par de entrada a cada articulación. T0 y TF
% 	representan, respectivamente, los valores de inicio y de fin del 
%	intervalo de tiempo. MASAEXT es la masa de la carga externa. 
%	INERCIAEXT es la inercia de la carga externa. En QFIN y QPFIN se 
%	devuelven, respectivamente, los vectores 3x1 de posición y 
%	velocidad de cada articulación en el instante de tiempo TF.
%
%	See also WALKERORIN3.
 
function [qfin, qpfin] = walkerorinrunge3(qini,qpini,par,t0,tf,masaext,inerciaext);

h = (tf-t0);

% Primer termino.
t1 = t0;
q1 = qini;
qp1= qpini;
v1 = h*qpini;
w1 = h*walkerorin3(q1,qp1,par,masaext,inerciaext);

% Segundo termino.
t2 = t0 + .5*h;
q2 = qini + .5*v1;
qp2= qpini + .5*w1;
v2 = h*(qpini + .5*w1);
w2 = h*walkerorin3(q2,qp2,par,masaext,inerciaext);

% Tercer termino.
t3 = t0 + .5*h;
q3 = qini + .5*v2;
qp3= qpini + .5*w2;
v3 = h*(qpini + .5*w2);
w3 = h*walkerorin3(q3,qp3,par,masaext,inerciaext);

% Cuarto termino.
t4 = t0 + h;
q4 = qini + v3;
qp4= qpini + w3;
v4 = h*(qpini + w3);
w4 = h*walkerorin3(q4,qp4,par,masaext,inerciaext);

% Formula de Runge-Kutta.
qfin =  qini + (v1 + 2*v2 + 2*v3 + v4)/6;
qpfin =  qpini + (w1 + 2*w2 + 2*w3 + w4)/6;

% Redondeo para evitar oscilacion numerica.
qfin = round(qfin*1e13)/1e13;
qpfin = round(qpfin*1e13)/1e13;
