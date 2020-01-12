% SIMULA3   Simulaci�n del p�ndulo de 3GDL.
%	MAT_Q = SIMULA3(TSIM, PINT) simula el comportamiento del p�ndulo
%	de 3 GDL suponiendo que no existe ning�n par en ninguna de las 
%	articulaciones. TSIM indica el tiempo total de la simulaci�n en 
%	segundos. PINT es el	periodo de integraci�n en segundos. Este
%	periodo se utiliza para dividir el tiempo de simulaci�n en intervalos. 
%	En MAT_Q se devuelven las coordenadas articulares del robot, almacenadas 
%	por columnas, correspondientes a cada intervalo de tiempo. MAT_Q es una 
%	matriz de 3 filas y una columna por cada intervalo de simulaci�n.
%
%	See also WALKERORINRUNGE3.

function mat_q = simula3(tsim, pint)

% Caracter�sticas de la carga externa
masaext = 0;
inerciaext = zeros(3);

% Posici�n y velocidad inicial de las articulaciones del robot
q  = zeros(3,1);
qp = zeros(3,1);

% Vector de tiempo dividido en intervalos
t = 0:pint:tsim;
% N�mero de intervalos + 1
n = length(t);

% Inicializaci�n de la matriz de coordenadas articulares
mat_q(:,1) = q;

% Se calcula las coordenadas articulares del robot
% en cada intervalo de la simulaci�n
for i=2:n
   % Se calcula la posici�n y la velocidad de cada articulaci�n
   % combinando el tercer m�todo de Walker & Orin con el m�todo
   % de integraci�n de Runge-Kutta.
  	[q qp] = walkerorinrunge3(q,qp,zeros(3,1),t(i-1),t(i),masaext,inerciaext);

  	% Se almacenan las coordenadas articulares
  	mat_q(:,i) = q;
end
