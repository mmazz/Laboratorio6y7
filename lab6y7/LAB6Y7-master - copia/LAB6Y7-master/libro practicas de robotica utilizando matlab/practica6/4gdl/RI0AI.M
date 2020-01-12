% RI0AI 		Vector ri0ai.
% 	Y = RI0AI(IR0VPI, IR0WPI, IR0WI, IR0SI) calcula el vector 3x1 que 
%	representa la aceleración lineal del centro de masa del elemento i. 
%	IR0VPI es el vector 3x1 de aceleración lineal de la articulación i-ésima. 
%	IR0WPI es el vector 3x1 de aceleración angular de la articulación i-ésima. 
%	IR0WI es el vector 3x1 de velocidad angular de la articulación i-ésima. 
%	IR0SI es el vector 3x1 de la posición del centro de masa del elemento i 
%	respecto de su sistema de coordenadas.
%
%	See also RI0VPI_r, RI0WPI, RI0WI, RI0SI.

function y = ri0ai(ir0vpi, ir0wpi, ir0wi, ir0si)
   
a = cross(ir0wi, ir0si);
b = cross(ir0wi, a);
y = cross(ir0wpi, ir0si) + b + ir0vpi;
