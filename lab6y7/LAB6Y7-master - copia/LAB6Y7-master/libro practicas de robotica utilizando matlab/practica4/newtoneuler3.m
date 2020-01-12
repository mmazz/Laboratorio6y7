%  NEWNTONEULER3  Calculo de la dinamica de un manipulador de 3 gdl utilizando 
%           el m�todo de Newton-Euler.
%	NEWTONEULER3(TETA, QP, QPP, G, M4, IEXTER) devuelve el vector 3x1
%	de pares/fuerzas de entrada a las articulaciones en funcion de
%	los parametros:
%	- TETA: Vector 3x1 de posici�n de las articulaciones (rad)
%	- QP: Vector 3x1 de velocidad de cada articulaci�n (rad/s)
%	- QPP: Vector 3x1 de aceleraci�n de cada velicidad (rad/s^2)
%	- G: Valor de la gravedad (m/s^2)
%	- M7: Masa de la carga externa (Kg)
%	- IEXTER: Matriz 3x3 de inercia de la carga exterior (Kg-m^2)

function tau=newtoneuler3(teta,qp,qpp,g,m4,Iexter);

%------------------------------------------------------------  
%	Par�metros Denavit-Hartenberg del robot
%------------------------------------------------------------
a    = [0      0.45 0.4];
d    = [0.315  0    0];
alfa = [-pi/2  0    0];

% ------------------------------------------------------------
%   Factores de posicionamiento de los centros de gravedad   
% ------------------------------------------------------------
factor1 = -0.5; factor2 = -0.5; factor3 = -0.5;


% ------------------------------------------------------------
% 	         Masa de cada elemento (Kg)
% ------------------------------------------------------------ 
m1 = 3;  m2 = 4;  m3 = 3;  


% ------------------------------------------------------------
%   Coeficiente de rozamiento viscoso de cada articulacion
% ------------------------------------------------------------ 
b1 = 0.1;  b2 = 0.1;  b3 = 0.1;

% ------------------------------------------------------------
% Matrices de Inercia (Kg-m^2)
% ------------------------------------------------------------
r10I_r01 = [0.0285  0 0;0 0.0285  0;0 0 0.0074];
r20I_r02 = [0.0044  0 0;0 0.0697  0;0 0 0.0697];
r30I_r03 = [0.0074  0 0;0 0.0437  0;0 0 0.0437];

% ------------------------------------------------------------
% Vectores ri0pi, ri0si.
% ------------------------------------------------------------

r10p1 = ri0pi(a(1),d(1),alfa(1));
r20p2 = ri0pi(a(2),d(2),alfa(2));   
r30p3 = ri0pi(a(3),d(3),alfa(3));   
r40p4 = zeros(3,1);

r10s1 = ri0si(a(1),d(1),alfa(1), factor1);
r20s2 = ri0si(a(2),d(2),alfa(2), factor2);   
r30s3 = ri0si(a(3),d(3),alfa(3), factor3);   
r40s4 = zeros(3,1);

% ------------------------------------------------------------
%		Matrices de transformacion
% ------------------------------------------------------------
r01 = dh(teta(1), alfa(1));         r10 = r01';
r12 = dh(teta(2), alfa(2));         r21 = r12';
r23 = dh(teta(3), alfa(3));         r32 = r23';
r34 = eye(3);                       r43 = r34';

% ------------------------------------------------------------
%    	   Velocidad angular de las articulaciones
% ------------------------------------------------------------
r00w0 = zeros(3,1);
r10w1 = ri0wi(r10, r00w0, qp(1));
r20w2 = ri0wi(r21, r10w1, qp(2));
r30w3 = ri0wi(r32, r20w2, qp(3)); 
r40w4 = ri0wi(r43, r30w3, 0);

% ------------------------------------------------------------
%	   Aceleracion angular de las articulaciones
% ------------------------------------------------------------
 
r00wp0 = zeros(3,1);
r10wp1 = ri0wpi(r10, r00wp0, r00w0, qp(1), qpp(1)); 
r20wp2 = ri0wpi(r21, r10wp1, r10w1, qp(2), qpp(2));   
r30wp3 = ri0wpi(r32, r20wp2, r20w2, qp(3), qpp(3));   
r40wp4 = ri0wpi(r43, r30wp3, r30w3, 0, 0);

% ------------------------------------------------------------
%		Aceleracion lineal articular
% ------------------------------------------------------------
r00vp0 = [0; 0; g];
r10vp1 = ri0vpi_r(r10, r00vp0, r10wp1, r10w1, r10p1); 
r20vp2 = ri0vpi_r(r21, r10vp1, r20wp2, r20w2, r20p2);    
r30vp3 = ri0vpi_r(r32, r20vp2, r30wp3, r30w3, r30p3);    
r40vp4 = ri0vpi_r(r43, r30vp3, r40wp4, r40w4, r40p4);

% ------------------------------------------------------------
%	Aceleracion del centro de masa de cada elemento
% ------------------------------------------------------------
r10a1 = ri0ai(r10vp1, r10wp1, r10w1, r10s1);
r20a2 = ri0ai(r20vp2, r20wp2, r20w2, r20s2);    
r30a3 = ri0ai(r30vp3, r30wp3, r30w3, r30s3);    
r40a4 = ri0ai(r40vp4, r40wp4, r40w4, r40s4);

% ------------------------------------------------------------
%  	Fuerza en el centro de masa de cada elemento
% ------------------------------------------------------------
r40f4 = ri0fi(r40a4, m4);
r30f3 = ri0fi(r30a3, m3);    
r20f2 = ri0fi(r20a2, m2);    
r10f1 = ri0fi(r10a1, m1);    

% ------------------------------------------------------------
%	Par en el centro de masa de cada elemento
% ------------------------------------------------------------

r40n4 = ri0ni(r40wp4, r40w4, Iexter);
r30n3 = ri0ni(r30wp3, r30w3, r30I_r03);  
r20n2 = ri0ni(r20wp2, r20w2, r20I_r02);  
r10n1 = ri0ni(r10wp1, r10w1, r10I_r01);  


% ------------------------------------------------------------
%		    Fuerzas articulares
% ------------------------------------------------------------

r40f4a = r40f4;
r30f3a = ri0fia(r34, r40f4a, r30f3); 
r20f2a = ri0fia(r23, r30f3a, r20f2); 
r10f1a = ri0fia(r12, r20f2a, r10f1); 

% ------------------------------------------------------------
%			Pares articulares
% ------------------------------------------------------------

r20p1 = r21*(r10p1);    r30p2 = r32*(r20p2);    
r40p3 = r43*(r30p3);    


r40n4a = r40n4;
r30n3a = ri0nia(r34, r40n4a, r40f4a, r30n3, r30f3, r40p3, r30p3, r30s3); 
r20n2a = ri0nia(r23, r30n3a, r30f3a, r20n2, r20f2, r30p2, r20p2, r20s2);   
r10n1a = ri0nia(r12, r20n2a, r20f2a, r10n1, r10f1, r20p1, r10p1, r10s1);   

% ------------------------------------------------------------
%		fuerzas  y toques de accionamientos.
% ------------------------------------------------------------

t_1 = t_r(r10, r10n1a, qp(1), b1);  
t_2 = t_r(r21, r20n2a, qp(2), b2); 
t_3 = t_r(r32, r30n3a, qp(3), b3); 

tau = [t_1; t_2; t_3];
