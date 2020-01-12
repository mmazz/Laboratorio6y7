% F_P 		Vector de fuerzas articulares.
% 	Y = F_P(IRI_1, IR0FIA, QPI, BI) calcula el vector 3x1 que representa 
%	la fuerza de entrada a la articulación i. IRI_1 es la matriz de rotación 
%	del sistema de coordenadas i-ésimo al (i-1)-ésimo. IR0FIA es el vector 
%	3x1 de fuerza ejercida sobre el elemento i por el elemento i-1. QPI es 
%	la magnitud de la velocidad de la articulación i-ésima respecto del elemento 
%	i-1. BI es el coeficiente de amortiguamiento viscoso para la articulación i.
%
%	See also RI0FIA.

function y = f_p(iri_1, ir0fia, qpi, bi);

z = [0; 0; 1];
y = ir0fia'*(iri_1*z) + bi*qpi;
