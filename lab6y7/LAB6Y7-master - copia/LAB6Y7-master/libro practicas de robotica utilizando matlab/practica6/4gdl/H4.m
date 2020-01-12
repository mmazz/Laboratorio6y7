% H4 	Matriz de momentos de inercia. 
% 	H = H4(Q, MASAEXT, INERCIAEXT) calcula la matriz de momentos de 
%	inercia H 4x4 utilizando el tercer método de Walker y Orin. Q es 
%	el vector 4x1 de variables articulares.  MASAEXT es la masa de la 
%	carga externa. INERCIAEXT es la inercia de la carga externa.
%
%	See also WALKERORIN4.

function  h = h4(q, masaext, inerciaext)

% 	Parámetros Denavit-Hartenberg del robot
teta = [q(1)  0		0		q(4)];
d    = [0.4   q(2)   q(3)  0.2 ];
a    = [0    -0.1   	0     0   ];
alfa = [0    -pi/2   0		0   ];

% Masa de cada elemento (Kg)
m = [10;  5;  5;  3];

% Matrices de Inercias Centroidales. (Kg-m^2.)
J    = [ 0.0191   0    0;   0    0.0191    0; 0   0   0.0068;
         0.0031   0    0;   0    0.0484    0; 0   0   0.0484;
         0.0606   0    0;   0    0.0053    0; 0   0   0.0606;
         0.0022   0    0;   0    0.0022    0; 0   0   0.0014];
     
% La quinta inercia es la de la carga externa.
J(13:15,1:3) = inerciaext;
      
% Vector Z0.
z0 = [0; 0; 1];

% Condiciones de Carga Externa.
M(5)  = masaext;
cj_1j = zeros(3,1);
Ej_1j = J(13:15,1:3);

for j = 4:-1:1
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
   if (j == 1) | (j == 4)	% Articulaciones rotacionales
      Fj_1j = cross(z0,M(j)*cj_1j);
      Nj_1j = Ej_1j*z0;
   else	% Articulaciones prismáticas
      Fj_1j = M(j)*z0;
      Nj_1j = zeros(3,1);
   end
      
   % Elemento j. Componente H(j,j).
	fi_1i = Fj_1j;
	ni_1i = Nj_1j + cross(cj_1j, Fj_1j);
   if (j == 1) | (j == 4)	% Articulaciones rotacionales
      h(j,j) = ni_1i(3,1);
   else	% Articulaciones prismáticas
      h(j,j) = fi_1i(3,1);
   end
   
   
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
      if (i == 1) | (i == 4)	% Articulaciones rotacionales
         h(i,j) = ni_1i(3,1);
      else	% Articulaciones prismáticas
         h(i,j) = fi_1i(3,1);
      end
      
      % H es simetrica.
  		h(j,i)= h(i,j);
  		i = i - 1;
  	end
end

