% RI0FIA		Vector ri0fia.
% 	Y = RI0FIA(IRI1, I1R0FI1A, IR0FI) calcula el vector 3x1 que 
%	representa la fuerza ejercida sobre el elemento i por el 
%	elemento (i-1). IRI1	es la matriz de rotación del sistema de 
%	coordenadas i-ésimo al (i+1)-ésimo. I1R0FI1A es el vector 3x1
%	de fuerza ejercida sobre el elemento (i+1) por el elemento i.
%	IR0FI es el vector 3x1 de fuerzas que actúan	sobre el elemento 
%	i en el centro de masa.
%
%	See also RI0FI.

function y = ri0fia(iri1, i1r0fi1a, ir0fi)

y = iri1*(i1r0fi1a) + ir0fi;





