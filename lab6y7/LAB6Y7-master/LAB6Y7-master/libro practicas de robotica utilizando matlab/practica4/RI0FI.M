% RI0FI 		Vector ri0fi.
% 	Y = RI0FI(RI0AI, MI) calcula el vector 3x1 de fuerzas que actúan
%	sobre el elemento i en el centro de masa. RI0AI representa la 
%	aceleración lineal en el centro de masa del elemento i. MI es la 
%	masa del elemento i.
%
%	See also RI0AI.

function y = ri0fi(ri0ai, mi)

y = ri0ai*mi;
