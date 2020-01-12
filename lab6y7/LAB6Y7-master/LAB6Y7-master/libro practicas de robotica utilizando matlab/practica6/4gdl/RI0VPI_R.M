% RI0VPI_R 		Vector ri0vpi_r.
% 	Y = RI0VPI_R(IRI_1, I_1R0VPI_1, IR0WPI, IR0WI, IR0PI) calcula el 
%	vector 3x1 que representa la aceleración lineal de la articulación
%	rotacional i-ésima respecto al sistema de coordenadas i-ésimo. IRI_1 
%	es la matriz de rotación del sistema de coordenadas i-ésimo al (i-1)-ésimo. 
%	I_1R0VPI_1 es el vector 3x1 de aceleración lineal de la articulación 
%	(i-1)-ésima. IR0WPI es el vector 3x1 de aceleración angular de la articulación 
%	i-ésima. IR0WI es el vector 3x1 de velocidad angular de la articulación 
%	i-ésima. IRIPI es el vector 3x1 de localización de (xi,yi,zi) desde el 
%	origen de (xi-1,yi-1,zi-1) con respecto al sistema de coordenadas i-ésimo.
%
%	See also RI0WPI, RI0WI, RI0PI.

function y = ri0vpi_r(iri_1, i_1r0vpi_1, ir0wpi, ir0wi, ir0pi)

z = [0; 0; 1];
a = cross(ir0wpi, ir0pi);
b = cross(ir0wi,  ir0pi);
c = cross(ir0wi, b);
y = (a + c + iri_1*i_1r0vpi_1);

