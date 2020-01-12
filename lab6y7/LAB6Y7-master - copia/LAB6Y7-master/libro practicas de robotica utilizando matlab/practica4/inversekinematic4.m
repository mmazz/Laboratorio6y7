% INVERSEKINEMATIC4 	Inverse Kinematic
%	Q = INVERSEKINEMATIC4(T) devuelve el vector de coordenadas
%	articulares correspondiente a la solución cinemática inversa de
%	la mano del manipulador en la posición y orientación expresadas
%	en la matriz T.
%
%	See also DIRECTKINEMATIC4, DENAVIT.

function q = inversekinematic4(T)

p = T(1:3,4);	% Posición de la mano del manipulador

% Inicialización de las variables articulares a calcular
q1 = 0;
q2 = 0;
q3 = 0;
q4 = 0;

% 	Parámetros Denavit-Hartenberg del robot
teta = [q1	  0	  0	  q4 ];
d    = [0.4   q2    q3    0.2];
a    = [0    -0.1   0     0  ];
alfa = [0    -pi/2  0     0  ];

% Solución de la primera articulación: q1
R = sqrt(p(1)^2+p(2)^2);
r = sqrt(R^2-a(2)^2);

sphi = -p(1)/R;
cphi = p(2)/R;
phi  = atan2(sphi, cphi);

sbeta = -a(2)/R;
cbeta = r/R;
beta  = atan2(sbeta, cbeta);

q1 = phi - beta;

% Solución de la segunda articulación: q2
q2 = p(3) - d(1);

% Solución de la tercera articulación: q3
q3 = r - d(4); 

% Solución de la cuarta articulación: q4

% 	Cálculo de la matriz de transformación A03
A01 = denavit(q1, d(1), a(1), alfa(1));
A12 = denavit(teta(2), q2, a(2), alfa(2));
A23 = denavit(teta(3), q3, a(3), alfa(3));
A03 = A01 * A12 * A23;

y3 = A03(1:3,2);

sq4 = dot(T(1:3,1), y3);	% Vector orientación n: T(1:3,1)
cq4 = dot(T(1:3,2), y3);	% Vector orientación s: T(1:3,2)
q4  = atan2(sq4, cq4);

% Vector de variables articulares
q  = [q1 q2 q3 q4]';
