% T_R 		Vector de pares articulares.
% 	Y = T_R(IRI_1, IR0NIA, QPI, BI) calcula el vector 3x1 que representa 
%	el par de entrada a la articulación i. IRI_1 es la matriz de rotación 
%	del sistema de coordenadas i-ésimo al (i-1)-ésimo. IR0NIA es el vector 
%	3x1 de momento ejercido sobre el elemento i por el elemento i-1. QPI es 
%	la magnitud de la velocidad angular de la articulación i-ésima respecto 
%	del elemento i-1. BI es el coeficiente de amortiguamiento viscoso para
%	la articulación i.
%
%	See also RI0NIA.


function y = t_r(iri_1, ir0nia, qpi, bi)

z = [0; 0; 1];
y = ir0nia'*(iri_1*z) + bi*qpi;
