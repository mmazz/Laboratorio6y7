% RI0NI 		Vector ri0ni.
% 	Y = RI0NI(IR0WPI, IR0WI, IR0I_0RI) calcula el vector 3x1 que representa 
%	el momento externo ejercido sobre el elemento i en el centro de masa. 
%	IR0WPI es el vector 3x1 de aceleración angular de la articulación i-ésima. 
%	IR0WI es el vector 3x1 de velocidad angular de la articulación i-ésima. 
% 	IR0I_0RI es la matriz 3x3 que representa la inercia del elemento i.
%
%	See also RI0WPI, RI0WI.

function y = ri0ni(ir0wpi, ir0wi, ir0I_0ri)

y = ir0I_0ri*ir0wpi + cross(ir0wi, (ir0I_0ri*ir0wi));
