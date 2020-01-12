%	NEWTONEULER4  Dinámica inversa utilizando el método de Newton-Euler.
%		TAU = NEWTONEULER4(Q, QP, QPP, G, M5, IEXTER) calcula el vector 
%		4x1 de pares/fuerzas de entrada a las articulaciones. Q el vector  
%		4x1 de coordenadas articulares. QP es el vector 4x1 que representa
%		la velocidad de cada articulación. QPP es el vector 4x1 que indica
%		la aceleración de cada articulación. G es el valor de la gravedad (m/s^2). 
%		M5 es la masa de la carga externa(Kg) que transporta el brazo robot. 
%		IEXTER es la matriz 3x3 de inercia de la carga exterior(Kg-m^2).
%
% 		See also DH, RI0PI, RI0SI, RI0WI, RI0WIP, RI0VPI_R, RI0AI, RI0FI, RI0NI,
%		RI0FIA, RI0NIA, T_R, F_P.

function tau = newtoneuler4(q,qp,qpp,g,m5,Iexter);

% ------------------------------------------------------------
% 	Parámetros Denavit-Hartenberg del robot
% ------------------------------------------------------------
teta = [q(1)  0		0		q(4)];
d    = [0.4   q(2)   q(3)  0.2 ];
a    = [0    -0.1   	0     0   ];
alfa = [0    -pi/2   0		0   ];

% ------------------------------------------------------------
%   Factores de posicionamiento de los centros de gravedad   
% ------------------------------------------------------------
factor1 = -0.5; factor2 = -0.5; factor3 = -0.5; factor4 = -0.5; 

% ------------------------------------------------------------
% 	         Masa de cada elemento (Kg)
% ------------------------------------------------------------
m1 = 10;  m2 = 5;  m3 = 5;  m4 = 3;

% ------------------------------------------------------------
%   Coeficiente de rozamiento viscoso de cada articulacion
% ------------------------------------------------------------
b1 = 0.05;  b2 = 0.05;  b3 = 0.05;  b4 = 0.05;

% ------------------------------------------------------------
% 	 Matrices de Inercia (Kg-m^2)
% ------------------------------------------------------------
r10I_r01 = [0.0191 0 0;0 0.0191 0;0 0 0.0068];
r20I_r02 = [0.0031 0 0;0 0.0484 0;0 0 0.0484];
r30I_r03 = [0.0606 0 0;0 0.0053 0;0 0 0.0606];
r40I_r04 = [0.0022 0 0;0 0.0022 0;0 0 0.0014];

% ------------------------------------------------------------
% 	 Vectores ri0pi, ri0si.
% ------------------------------------------------------------
r10p1 = ri0pi(a(1), d(1), alfa(1));
r20p2 = ri0pi(a(2), d(2), alfa(2));   
r30p3 = ri0pi(a(3), d(3), alfa(3));   
r40p4 = ri0pi(a(4), d(4), alfa(4));   
r50p5 = zeros(3,1);

r10s1 = ri0si(a(1), d(1), alfa(1), factor1);
r20s2 = ri0si(a(2), d(2), alfa(2), factor2);   
r30s3 = ri0si(a(3), d(3), alfa(3), factor3);   
r40s4 = ri0si(a(4), d(4), alfa(4), factor4);   
r50s5 = zeros(3,1);

% ------------------------------------------------------------
%		Matrices de transformacion
% ------------------------------------------------------------
r01 = dh(teta(1), alfa(1));         r10 = r01';
r12 = dh(teta(2), alfa(2));         r21 = r12';
r23 = dh(teta(3), alfa(3));         r32 = r23';
r34 = dh(teta(4), alfa(4));         r43 = r34';
r45 = eye(3);                       r54 = r45';

% ------------------------------------------------------------
%    	   Velocidad angular de las articulaciones
% ------------------------------------------------------------
r00w0 = zeros(3,1);
r10w1 = ri0wi(r10, r00w0, qp(1));
r20w2 = r21*r10w1;
r30w3 = r32*r20w2; 
r40w4 = ri0wi(r43, r30w3, qp(4)); 
r50w5 = ri0wi(r54, r40w4, 0); 

% ------------------------------------------------------------
%	   Aceleracion angular de las articulaciones
% ------------------------------------------------------------
r00wp0 = zeros(3,1);
r10wp1 = ri0wpi(r10, r00wp0, r00w0, qp(1), qpp(1)); 
r20wp2 = r21*r10wp1;   
r30wp3 = r32*r20wp2;   
r40wp4 = ri0wpi(r43, r30wp3, r30w3, qp(4), qpp(4));   
r50wp5 = ri0wpi(r54, r40wp4, r40w4, 0, 0);

% ------------------------------------------------------------
%		Aceleracion lineal articular
% ------------------------------------------------------------
r00vp0 = [0; 0; g];
r10vp1 = ri0vpi_r(r10, r00vp0, r10wp1, r10w1, r10p1); 
r20vp2 = ri0vpi_p(r21, r10vp1, r20wp2, r20w2, r20p2, qp(2), qpp(2));    
r30vp3 = ri0vpi_p(r32, r20vp2, r30wp3, r30w3, r30p3, qp(3), qpp(3));    
r40vp4 = ri0vpi_r(r43, r30vp3, r40wp4, r40w4, r40p4);    
r50vp5 = ri0vpi_r(r54, r40vp4, r50wp5, r50w5, r50p5);    

% ------------------------------------------------------------
%	Aceleracion del centro de masa de cada elemento
% ------------------------------------------------------------
r10a1 = ri0ai(r10vp1, r10wp1, r10w1, r10s1);
r20a2 = ri0ai(r20vp2, r20wp2, r20w2, r20s2);    
r30a3 = ri0ai(r30vp3, r30wp3, r30w3, r30s3);    
r40a4 = ri0ai(r40vp4, r40wp4, r40w4, r40s4);    
r50a5 = ri0ai(r50vp5, r50wp5, r50w5, r50s5);    

% ------------------------------------------------------------
%  	Fuerza en el centro de masa de cada elemento
% ------------------------------------------------------------
r50f5 = ri0fi(r50a5, m5);
r40f4 = ri0fi(r40a4, m4);    
r30f3 = ri0fi(r30a3, m3);    
r20f2 = ri0fi(r20a2, m2);    
r10f1 = ri0fi(r10a1, m1);    

% ------------------------------------------------------------
%		Par en el centro de masa de cada elemento
% ------------------------------------------------------------
r50n5 = ri0ni(r50wp5, r50w5, Iexter);
r40n4 = ri0ni(r40wp4, r40w4, r40I_r04);  
r30n3 = ri0ni(r30wp3, r30w3, r30I_r03);  
r20n2 = ri0ni(r20wp2, r20w2, r20I_r02);  
r10n1 = ri0ni(r10wp1, r10w1, r10I_r01);  

% ------------------------------------------------------------
%		    Fuerzas articulares
% ------------------------------------------------------------
r50f5a = r50f5;
r40f4a = ri0fia(r45, r50f5a, r40f4); 
r30f3a = ri0fia(r34, r40f4a, r30f3); 
r20f2a = ri0fia(r23, r30f3a, r20f2); 
r10f1a = ri0fia(r12, r20f2a, r10f1); 

% ------------------------------------------------------------
%			Pares articulares
% ------------------------------------------------------------
r20p1 = r21*(r10p1);    r30p2 = r32*(r20p2);    
r40p3 = r43*(r30p3);    r50p4 = r54*(r40p4);

r50n5a = r50n5;
r40n4a = ri0nia(r45, r50n5a, r50f5a, r40n4, r40f4, r50p4, r40p4, r40s4); 
r30n3a = ri0nia(r34, r40n4a, r40f4a, r30n3, r30f3, r40p3, r30p3, r30s3); 
r20n2a = ri0nia(r23, r30n3a, r30f3a, r20n2, r20f2, r30p2, r20p2, r20s2);   
r10n1a = ri0nia(r12, r20n2a, r20f2a, r10n1, r10f1, r20p1, r10p1, r10s1);   

% ------------------------------------------------------------
%			Fuerzas  y pares de accionamientos
% ------------------------------------------------------------
t_1 = t_r(r10, r10n1a, qp(1), b1);  
t_2 = f_p(r21, r20f2a, qp(2), b2); 
t_3 = f_p(r32, r30f3a, qp(3), b3); 
t_4 = t_r(r43, r40n4a, qp(4), b4); 

tau = [t_1; t_2; t_3; t_4];
