% RI0WI 		Vector ri0wi.
% 	Y = RI0WI(IRI_1, I_1R0WI_1, QPI) calcula el vector 3x1 que representa 
%	la	velocidad angular de la articulación i-ésima respecto al sistema de
%	coordenadas i-ésimo. IRI_1 es la matriz de rotación del sistema de 
%	coordenadas i-ésimo al (i-1)-ésimo. I_1R0WI_1 es el vector 3x1 de velocidad 
%	angular de la articulación (i-1)-ésima. QPI es la magnitud de la velocidad 
%	angular de la articulación i-ésima respecto del elemento i-1.

function y = ri0wi(iri_1, i_1r0wi_1, qpi)

z = [0; 0; 1];
y = iri_1*(i_1r0wi_1 + z*qpi);
