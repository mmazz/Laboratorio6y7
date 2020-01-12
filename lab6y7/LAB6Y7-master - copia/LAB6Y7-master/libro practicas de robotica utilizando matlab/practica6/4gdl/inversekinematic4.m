% INVERSEKINEMATIC4 	Inverse Kinematic
%	Q = INVERSEKINEMATIC4(T) devuelve el vector de coordenadas
%	articulares correspondiente a la soluci�n cinem�tica inversa de
%	la mano del manipulador en la posici�n y orientaci�n expresadas
%	en la matriz T.
%
%	See also DIRECTKINEMATIC4, DENAVIT.

function q = inversekinematic4(T)

p = T(1:3,4);	% Posici�n de la mano del manipulador

% Inicializaci�n de las variables articulares a calcular
q1 = 0;
q2 = 0;
q3 = 0;
q4 = 0;

% 	Par�metros Denavit-Hartenberg del robot
teta = [q1	  0	  0	  q4 ];
d    = [0.4   q2    q3    0.2];
a    = [0    -0.1   0     0  ];
alfa = [0    -pi/2  0     0  ];

% Soluci�n de la primera articulaci�n: q1
R = sqrt(p(1)^2+p(2)^2);
r = sqrt(R^2-a(2)^2);

sphi = -p(1)/R;
cphi = p(2)/R;
phi  = atan2(sphi, cphi);

sbeta = -a(2)/R;
cbeta = r/R;
beta  = atan2(sbeta, cbeta);

q1 = phi - beta;

% Soluci�n de la segunda articulaci�n: q2
q2 = p(3) - d(1);

% Soluci�n de la tercera articulaci�n: q3
q3 = r - d(4); 

% Soluci�n de la cuarta articulaci�n: q4

% 	C�lculo de la matriz de transformaci�n A03
A01 = denavit(q1, d(1), a(1), alfa(1));
A12 = denavit(teta(2), q2, a(2), alfa(2));
A23 = denavit(teta(3), q3, a(3), alfa(3));
A03 = A01 * A12 * A23;

y3 = A03(1:3,2);

sq4 = dot(T(1:3,1), y3);	% Vector orientaci�n n: T(1:3,1)
cq4 = dot(T(1:3,2), y3);	% Vector orientaci�n s: T(1:3,2)
q4  = atan2(sq4, cq4);

% Vector de variables articulares
q  = [q1 q2 q3 q4]';
