% H3 	Matriz de momentos de inercia. 
% 	H = H3(Q, MASAEXT, INERCIAEXT) calcula la matriz de momentos de 
%	inercia H 3x3 utilizando el tercer método de Walker y Orin. Q es 
%	el vector 3x1 de variables articulares.  MASAEXT es la masa de la 
%	carga externa. INERCIAEXT es la inercia de la carga externa.
%
%	See also WALKERORIN3.

function  h = h3(q, masaext, inerciaext)

% 	Parámetros Denavit-Hartenberg del robot
teta = q;
d    = [0 0 0];
a    = [1 1 1];
alfa = [0 0 0];

% Masa de cada elemento (Kg)
m    = [3;  3;  3];

% Matrices de Inercias Centroidales. (Kg-m^2.)
J    = [0 0 0;0 0.25 0;0 0 0.25;
        0 0 0;0 0.25 0;0 0 0.25;
        0 0 0;0 0.25 0;0 0 0.25];

% La cuarta inercia es la de la carga externa.
J(10:12,1:3) = inerciaext;
      
% Vector Z0.
z0 = [0; 0; 1];

% Condiciones de Carga Externa.
M(4)  = masaext;
cj_1j = zeros(3,1);
Ej_1j = J(10:12,1:3);

for j = 3:-1:1
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
