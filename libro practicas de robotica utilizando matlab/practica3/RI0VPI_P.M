% RI0VPI_P 		Vector ri0vpi_p.
% 	Y = RI0VPI_P(IRI_1, I_1R0VPI_1, IR0WPI, IR0WI, IR0PI, QPI, QPPI) calcula el 
%	vector 3x1 que representa la aceleración lineal de la articulación
%	prismática i-ésima respecto al sistema de coordenadas i-ésimo. IRI_1 
%	es la matriz de rotación del sistema de coordenadas i-ésimo al (i-1)-ésimo. 
%	I_1R0VPI_1 es el vector 3x1 de aceleración lineal de la articulación 
%	(i-1)-ésima. IR0WPI es el vector 3x1 de aceleración angular de la articulación 
%	i-ésima. IR0WI es el vector 3x1 de velocidad angular de la articulación 
%	i-ésima. IR0PI es el vector 3x1 de localización de (xi,yi,zi) desde el 
%	origen de (xi-1,yi-1,zi-1) con respecto al sistema de coordenadas i-ésimo.
%	QPI es la magnitud de la velocidad angular de la articulación i-ésima respecto 
%	del elemento i-1. QPPI es la magnitud de la aceleración angular de la 
%	articulación i-ésima respecto del elemento i-1.
%
%	See also RI0WPI, RI0WI, RI0PI.

function y = ri0vpi_p(iri_1, i_1r0vpi_1, ir0wpi, ir0wi, ir0pi, qpi, qppi)

z = [0; 0; 1];
a = ir0wi;
b = cross(a, ir0pi);
c = cross(a, b);
y = iri_1*(z*qppi + i_1r0vpi_1) + cross(ir0wpi, ir0pi) + 2*(cross(ir0wi, ((iri_1)*(z*qpi)))) + c;
