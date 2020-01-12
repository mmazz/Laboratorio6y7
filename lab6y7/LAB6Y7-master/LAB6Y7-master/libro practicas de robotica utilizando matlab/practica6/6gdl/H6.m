% H6 	Matriz de momentos de inercia. 
% 	H = H6(Q, MASAEXT, INERCIAEXT) calcula la matriz de momentos de 
%	inercia H 6x6 utilizando el tercer método de Walker y Orin. Q es 
%	el vector 6x1 de variables articulares.  MASAEXT es la masa de la 
%	carga externa. INERCIAEXT es la inercia de la carga externa.
%
%	See also WALKERORIN6.

function  h = h6(q, masaext, inerciaext)

% 	Parámetros Denavit-Hartenberg del robot
teta = q;
d    = [0.315  0      0     0.5     0    0.08];
a    = [0      0.45   0     0       0    0   ];
alfa = [-pi/2  0    pi/2  -pi/2   pi/2   0   ];

% Masa de cada elemento (Kg)
m    = [ 2.78;  10.25;  0; 5.57;  0; 1.98];

% Matrices de Inercias Centroidales. (Kg-m^2.)
J    = [ 0.0191   0    0;   0    0.0191    0; 0   0   0.0068;
         0.0031   0    0;   0    0.0484    0; 0   0   0.0484;
         0        0    0;   0    0         0; 0   0   0;
         0.0606   0    0;   0    0.0053    0; 0   0   0.0606;
         0        0    0;   0    0         0; 0   0   0;
         0.0022   0    0;   0    0.0022    0; 0   0   0.0014];
      
% La septima inercia es la de la carga externa.
J(19:21,1:3) = inerciaext;
      
% Vector Z0.
z0 = [0; 0; 1];

% Condiciones de Carga Externa.
M(7)  = masaext;
cj_1j = zeros(3,1);
Ej_1j = J(19:21,1:3);

for j = 6:-1:1
	% Constante para sacar la Inercia J.
	k = (j-1)*3 + 1;
   
   % Vectores p y s.
	p = [a(j); d(j)*sin(alfa(j)); d(j)*cos(alfa(j))];
	s = -0.5*p;
   
   % Matrices de transformacion.
	aj_1j = dh(teta(j),alfa(j));
	ajj_1 = aj_1j';
   
   % Centroide e Inercia de los elementos anteriores.
	cjjM1 = cj_1j;
	EjjM1 = Ej_1j;
   
   % Masa de todos los elementos anteriores.
	M(j)  = M(j+1) + m(j);
   
   % Nuevo centroide.
	cjj   = ((s + p)*m(j) + M(j+1)*(cjjM1 + p))/M(j);
	cj_1j = aj_1j*cjj;
   
   % Distancia de traslado de las inercias.
	p1 = (cjjM1 + p - cjj);
	d1 = dot(p1,p1)*eye(3) - (p1*p1'); 
	p2 = (s + p - cjj);
	d2 = dot(p2,p2)*eye(3) - (p2*p2');
   
   % Nueva Inercia.
	Ej_1j = aj_1j*(EjjM1 + M(j+1)*d1 + J(k:k+2,1:3) + m(j)*d2)*ajj_1;
   
   % Fuerza y par de los elementos j hasta N.
	Fj_1j = cross(z0,M(j)*cj_1j);
	Nj_1j = Ej_1j*z0;
   
   % Elemento j. Componente H(j,j).
	fi_1i = Fj_1j;
	ni_1i = Nj_1j + cross(cj_1j, Fj_1j);
	h(j,j)= ni_1i(3,1);
   
   % Elementos j-1 hasta 1. Componentes H(1:j-1,j)
	i = j - 1;
  	while i >= 1
  		% Vector p.
  		p = [a(i); d(i)*sin(alfa(i)); d(i)*cos(alfa(i))];
          
      % Matrices de rotacion.
  		ai_1i = dh(teta(i),alfa(i));
		aii_1 = ai_1i';
           
      % Fuerza y par del anterior elemento.
  		fiiM1 = fi_1i;
  		niiM1 = ni_1i;
           
      % Fuerza y par de este elemento.
  		fi_1i = ai_1i*fiiM1;
  		ni_1i = ai_1i*(niiM1 + cross(p, fiiM1));
           
      % Componente H(i,j).
  		h(i,j)= ni_1i(3,1);
           
      % H es simetrica.
  		h(j,i)= h(i,j);
  		i = i - 1;
  	end
end

