% INVERSEKINEMATIC6 	Inverse Kinematic
%	Q = INVERSEKINEMATIC6(T, CODO, MUNECA) devuelve el vector de coordenadas
%	articulares correspondiente a la soluci�n cinem�tica inversa de la mano
%	del manipulador en la posici�n y orientaci�n expresadas en la matriz T. 
%	CODO = 1 indica codo del robot arriba, es decir, que la articulaci�n 3 se 
%	sit�a por encima de la articulaci�n 2,	mientras que CODO = -1 indica codo
%	abajo, es decir que la articulaci�n 2 se sit�a por encima de la 3.
%	MUNECA = 1 indica que la mu�eca del robot se sit�a por debajo de la coordenada
%	expresada en T, mientras que MUNECA = -1 significa que la mu�eca se sit�a
%	por arriba.
%
%	See also DIRECTKINEMATIC6, DENAVIT.

function q = inversekinematic6(T,codo,muneca)

% 	Par�metros Denavit-Hartenberg del robot
d    = [0.315  0      0     0.5     0    0.08];
a    = [0      0.45   0     0       0    0];
alfa = [-pi/2  0    pi/2  -pi/2   pi/2   0];

% Posici�n de la mano del manipulador
p  = T(1:3,4)-d(6)*T(1:3,3);

% Soluci�n de la primera articulaci�n: q1
R = sqrt(p(1)^2+p(2)^2);
sq1=p(2)/R;
cq1=p(1)/R;
q1 = atan2(sq1,cq1);

% Soluci�n de la segunda articulaci�n: q2
r = sqrt(R^2+(p(3)-d(1))^2);
salfa = (d(1)-p(3))/r;
calfa = R/r;

cbeta = (r^2+a(2)^2-d(4)^2)/(2*r*a(2));
sbeta = sqrt(1-cbeta^2);

if codo == -1	% Codo abajo
	sq2 = salfa*cbeta+sbeta*calfa;
	cq2 = calfa*cbeta-salfa*sbeta;
else				% Codo arriba
	sq2 = salfa*cbeta-sbeta*calfa;
	cq2 = calfa*cbeta+salfa*sbeta;
end

q2 = atan2(sq2,cq2);

% Soluci�n de la tercera articulaci�n: q3
cbeta=(a(2)^2+d(4)^2-r^2)/(2*a(2)*d(4));
sbeta=sqrt(1-cbeta^2);
beta=atan2(sbeta,cbeta);

if codo == 1	% Codo arriba
   q3 = 3*pi/2-beta;
else				% Codo abajo
   q3 = beta - pi/2;
end

% Soluci�n de la cuarta articulaci�n: q4

% 	C�lculo de la matriz de transformaci�n A03
A01 = denavit(q1, d(1), a(1), alfa(1));
A12 = denavit(q2, d(2), a(2), alfa(2));
A23 = denavit(q3, d(3), a(3), alfa(3));
A03 = A01 * A12 * A23;

x3 = A03(1:3,1);
y3 = A03(1:3,2);
z3 = A03(1:3,3);
z4 = cross(z3,T(1:3,3));	% Vector orientaci�n a: T(1:3,3)

% Determinaci�n del indicador de orientaci�n omega
aux = dot(T(1:3,2),z4);	% Vector orientaci�n s: T(1:3,2)
if aux ~= 0
   omega = aux;
else
   aux=dot(T(1:3,1),z4);	% Vector orientaci�n n: T(1:3,1)
   if aux ~=0
      omega=aux;
   else
      omega=0;
   end
end

M   = muneca*sign(omega);

sq4 = -M*dot(z4,x3);
cq4 = M*dot(z4,y3);
q4  = atan2(sq4,cq4);

% Soluci�n de la quinta articulaci�n: q5
z5  = T(1:3,3);		% Vector de orientaci�n a: T(1:3,3)

A34 = denavit(q4, d(4), a(4), alfa(4));
A04 = A03 * A34;
x4  = A04(1:3,1);
y4  = A04(1:3,2);

sq5 = dot(T(1:3,3),x4);	% Vector de orientaci�n a: T(1:3,3)
cq5 = -dot(T(1:3,3),y4);	% Vector de orientaci�n a: T(1:3,3)
q5  = atan2(sq5,cq5);

% Soluci�n de la sexta articulaci�n: q6
y6  = T(1:3,2);	% Vector de orientaci�n s: T(1:3,2)

A45 = denavit(q5, d(5), a(5), alfa(5));
A05 = A04 * A45;
y5  = A05(1:3,2);

sq6 = dot(T(1:3,1),y5);	% Vector de orientaci�n n: T(1:3,1)
cq6 = dot(T(1:3,2),y5);	% Vector de orientaci�n s: T(1:3,2)
q6  = atan2(sq6,cq6);

% Vector de coordenadas articulares
q  = [q1 q2 q3 q4 q5 q6]';
