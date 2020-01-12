% DENAVIT  Calculo de la matriz de transformacion a partir de la
%	   representacion de Denavit-Hartenberg.
%	   DENAVIT(D, ALFA, A, Q) devuelve la matriz de transformacion
%	   4x4 a partir de los parametros de Denavit-Hartneberg.

function dh=denavit(d,alfa,a,q)
dh=[cos(q) -cos(alfa)*sin(q) sin(alfa)*sin(q) a*cos(q);
   sin(q) cos(alfa)*cos(q) -sin(alfa)*cos(q) a*sin(q);
   0 sin(alfa) cos(alfa) d;
   0 0 0 1];

