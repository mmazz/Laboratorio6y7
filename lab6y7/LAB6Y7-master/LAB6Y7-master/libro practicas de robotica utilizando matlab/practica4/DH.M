
%***************************************************************
% Matriz de Denavit-Hartemberg.
%***************************************************************

function y = dh(teta,alfa)

y = zeros(3,3);

y = [cos(teta)  -cos(alfa)*sin(teta)   sin(alfa)*sin(teta)
     sin(teta)   cos(alfa)*cos(teta)  -sin(alfa)*cos(teta)
	  0           sin(alfa)              cos(alfa)    ];



