% DININV3GDL  Función que calcula la dinámica inversa de un robot de 3GDL
%				  a partir de los parámetros proporcionados en Simulink.

function par = dininv3gld(entrada);

% Parámetros de la carga
masaext=10;
inerciaext=[0.0167 0 0;0 0.0167 0;0 0 0.0167];

% entrada es una vector columna
q = entrada(1:3);
qp = entrada(4:6);
qpp = entrada(7:9);

% Se calcula el par utilizando Newton-Euler
par=newtoneuler3(q,qp,qpp,9.8062,masaext,inerciaext);
