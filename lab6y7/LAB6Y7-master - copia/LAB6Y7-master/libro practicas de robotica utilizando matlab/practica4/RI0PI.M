% RI0PI 		Vector ri0pi.
% 	Y = RI0PI(A, D, ALFA) calcula el vector 3x1 que representa la
%	localización de (xi,yi,zi) desde el origen de (xi-1,yi-1,zi-1) 
%	con respecto al sistema de coordenadas i-ésimo utilizando los
%	parámetros de Denavit-Hartenberg A, D y ALFA.

function y = ri0pi(a,d,alfa)

y = [      a	  
   	d*sin(alfa)	 
   	d*cos(alfa)];
