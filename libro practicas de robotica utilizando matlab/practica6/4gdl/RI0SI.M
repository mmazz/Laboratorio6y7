% RI0SI 		Vector ri0si.
% 	Y = RI0SI(A, D, ALFA, FACTOR) calcula el vector 3x1 que representa 
%	la	posición del centro de masa del elemento i respecto de su sistema 
%	de coordenadas utilizando los parámetros de Denavit-Hartenberg A, D
%	y ALFA. FACTOR es un escalar que se utiliza para ubicar el centro de masa.

function y = ri0si(a,d,alfa,factor)

y = [		factor*a
	  factor*d*sin(alfa)
	  factor*d*cos(alfa)];
