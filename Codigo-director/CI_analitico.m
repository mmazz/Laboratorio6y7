%CODIGO DE FACUNDO PESSACG!!!
%Facundo Pessacg.
%Cinematica inversa para el Scorbot V-ER Plus. En este codigo tengo que
%introducir las coordenadas a las que quiero que valla el robot (x,y,z) y la
%orientacion del efector final deseada (qpich,qroll). El Scorbot no tiene
%el grado de libertad qyaw, por lo que siempre es 0. Con ca puedo
%seleccionar las dos soluciones posibles que presenta el brazo, codo arriba
%o codo abajo. La posicion de home en este codigo es el hombro y el codo
%horizontales respecto al mundo y la muñeca perpendicular con sentido hacia
%el suelo.
clear,clc
syms q1 q2 q3 q4 q5;

%Parametro que le tengo que dar 
%trabajo en mm
x = 0;
y = 00;
z = 400; 
qpich = 0; % -40<qpich<220 
qroll = 0; % -570<qyaw<570
qyaw  = 0;  % qroll siempre va a ser 0, ya que depende de q1
% qpich rot en y, qyaw rot en z y qroll rot en x. 
ca =1; % ca=1 configuraci�n codo arriba, ca=0 conf codo abajo 

%Parametros intrinsecos del Robot
d1 = 349;
a1 = 16;
a2 = 221;
a3 = 221;
d5 = 145;

%Defino los parametros de DH
p1.d=d1 ; p1.a=a1 ; p1.alfa=pi/2  ;p1.q=q1;
p2.d=0  ; p2.a=a2  ; p2.alfa=0    ;p2.q=q2;
p3.d=0  ; p3.a=a3  ; p3.alfa=0    ;p3.q=q3;
p4.d=0  ; p4.a=0   ; p4.alfa=pi/2 ;p4.q=q4;
p5.d=d5 ; p5.a=0   ; p5.alfa=0    ;p5.q=q5;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CINEMATICA INVERSA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Calculo q1 que es qroll
q1 = atan2(y,x);
q1= q1*180/pi;
c1=cosd(q1);
s1=sind(q1);

%Calculo la matriz de rotacion con los angulos pich yaw y roll
cy=cosd(qyaw) ; sy=sind(qyaw);
cp=cosd(qpich); sp=sind(qpich);
cr=cosd(qroll); sr=sind(qroll);

Te = [cy*cp	cy*sp*sr-sy*cr	cy*sp*cr+sy*sr;...
	  sy*cp	sy*sp*sr+cy*cr	sy*sp*cr-cy*sr;...
	  -sp	cp*sr			cp*cr		 ];
R= rotx(pi)*Te;				%Tengo que multiplicar por la rotx porq el eje z del EF esta invertido respecto del mundo.
Te = [R [x y z]'; zeros(1,3) 1];

nx=Te(1,1);	ox=Te(1,2);	ax=Te(1,3);	px=Te(1,4);
ny=Te(2,1);	oy=Te(2,2);	ay=Te(2,3);	py=Te(2,4);
nz=Te(3,1);	oz=Te(3,2);	az=Te(3,3);	pz=Te(3,4);

%Calculo q234
c234=-az;
s234=(ax*c1+ay*s1);
q234=atan2(s234,c234);

q234=q234*180/pi;

%Calculo q3
k1=px*c1-p1.a+py*s1-p5.d*s234;
k2=pz-p1.d+p5.d*c234;

c3=(k1^2+k2^2-(p2.a)^2-(p3.a)^2)/(2*p2.a*p3.a);
q3=acos(c3);
if (-1*1e-4 < q3) && (q3< 1e-4),q3=0;end
q3=q3*180/pi;
%Aca tengo las dos soluciones q3 y -q3, las elijo en funcion de ca.
if (ca==1) q3=-q3;end
s3=sind(q3);

%Calculo q2
c2=(k1*(p3.a*c3+p2.a)+k2*p3.a*s3)/(p3.a^2+p2.a^2+2*p2.a*p3.a*c3);
s2=(k2*(p3.a*c3+p2.a)-k1*p3.a*s3)/(p3.a^2+p2.a^2+2*p2.a*p3.a*c3);
q2=atan2(s2,c2),
if (-1*1e-4 < q2) && (q2< 1e-4),q2=0;end
q2=q2*180/pi

%Calculo q4
q4=(q234-q2-q3);
if (-1*1e-4 < q4) && (q4< 1e-4),q4=0;end

%Calculo q5 --> Es directamente el q que me dan
q5=qroll;


disp('valores ci')
%muestro los angulos
[q1,q2,q3,q4,q5]

%Grafico el Robot
plot_robot(q1,q2,q3,q4,q5);

plot_robot_toolbox(q1,q2,q3,q4,q5);


