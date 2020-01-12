% RI0WPI 		Vector ri0wpi.
% 	Y = RI0WPI(IRI_1, I_1R0WPI_1, I_1R0WI_1, QPI, QPPI) calcula el vector 
%	3x1 que representa la aceleración angular de la articulación i-ésima 
%	respecto al sistema de coordenadas i-ésimo. IRI_1 es la matriz de rotación 
%	del sistema de coordenadas i-ésimo al (i-1)-ésimo. I_1R0WPI_1 es el vector 
%	3x1 de aceleración angular de la articulación (i-1)-ésima. I_1R0WI_1 es el 
%	vector 3x1 de velocidad angular de la articulación (i-1)-ésima. QPI es la 
%	magnitud de la velocidad angular de la articulación i-ésima respecto del 
%	elemento i-1. QPPI es la magnitud de la aceleración angular de la articulación 
%	i-ésima respecto del elemento i-1.

function y = ri0wpi(iri_1, i_1r0wpi_1, i_1r0wi_1, qpi, qppi)
						       
z = [0; 0; 1];
a = cross(i_1r0wi_1,z*qpi);
y = iri_1*(i_1r0wpi_1 + z*qppi + a);



