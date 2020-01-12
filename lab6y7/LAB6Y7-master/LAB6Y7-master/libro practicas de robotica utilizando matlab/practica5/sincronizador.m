%	SINCRONIZADOR Funcion que sincroniza los movimientos teniendo en consideraci�n
%	las condiciones iniciales, finales, caracter�sticas de las articulaciones y 
%	velocidades nominales.
%		[VELO2,TMAXIMO]=SINCRONIZADOR(Q0,QF,VELO) devuelve la nueva velocidad m�xima
%		de cada motor.
%		Q0 posici�n inicial (coordenadas articulares).
%		QF posici�n final (coordenadas articulares).
%		VELO velocidad m�xima nominal de cada actuador.
%
%		Ver tambi�n PLANIFICADOR, CALCULOCOEF, SINCRONIZADOR, EVALPOS, EVALACEL.

function [velo2,tmaximo]=sincronizador(q0,qf,velo)

%--Calculo de tiempos aproximados.
taprox = abs((qf(:,1)-q0(:,1)))./velo;
tmaximo = max(taprox);

%--Nueva velocidad maxima de cada motor.
velo2=(qf(:,1)-q0(:,1))/tmaximo;

return
