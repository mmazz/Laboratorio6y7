% SIMULA3   Simulación del péndulo de 3GDL.
%	MAT_Q = SIMULA3(TSIM, PINT) simula el comportamiento del péndulo
%	de 3 GDL suponiendo que no existe ningún par en ninguna de las 
%	articulaciones. TSIM indica el tiempo total de la simulación en 
%	segundos. PINT es el	periodo de integración en segundos. Este
%	periodo se utiliza para dividir el tiempo de simulación en intervalos. 
%	En MAT_Q se devuelven las coordenadas articulares del robot, almacenadas 
%	por columnas, correspondientes a cada intervalo de tiempo. MAT_Q es una 
%	matriz de 3 filas y una columna por cada intervalo de simulación.
%
%	See also WALKERORINRUNGE3.

function mat_q = simula3(tsim, pint)

% Características de la carga externa
masaext = 0;
inerciaext = zeros(3);

% Posición y velocidad inicial de las articulaciones del robot
q  = zeros(3,1);
qp = zeros(3,1);

% Vector de tiempo dividido en intervalos
t = 0:pint:tsim;
% Número de intervalos + 1
n = length(t);

% Inicialización de la matriz de coordenadas articulares
mat_q(:,1) = q;

% Se calcula las coordenadas articulares del robot
% en cada intervalo de la simulación
for i=2:n
   % Se calcula la posición y la velocidad de cada articulación
   % combinando el tercer método de Walker & Orin con el método
   % de integración de Runge-Kutta.
  	[q qp] = walkerorinrunge3(q,qp,zeros(3,1),t(i-1),t(i),masaext,inerciaext);

  	% Se almacenan las coordenadas articulares
  	mat_q(:,i) = q;
end
