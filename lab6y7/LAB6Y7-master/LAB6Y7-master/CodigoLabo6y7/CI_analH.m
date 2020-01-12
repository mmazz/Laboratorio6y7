%CODIGO DE FACUNDO PESSACG!!!
function Q=CI_analH(x, y, z, qpich,qyaw, ca, make_plot)
%Cinematica inversa para el Scorbot V-ER Plus. En este codigo tengo que
%introducir las coordenadas a las que quiero que valla el robot (x,y,z) y la
%orientacion del efector final deseada (qpich,qroll). El Scorbot no tiene
%el grado de libertad qyaw, por lo que siempre es 0. Con ca puedo
%seleccionar las dos soluciones posibles que presenta el brazo, codo arriba
%o codo abajo. La posicion de home en este codigo es el hombro y el codo
%horizontales respecto al mundo y la muñeca perpendicular con sentido hacia
%el suelo.
%Por ultimo, puedo no graficar nada, (make_plot=0)
%usar la funcion que yo hice (make_plot=1)
% o usar el toolbox para graficar (make_plot=2)

syms q1 q2 q3 q4 q5;

qroll = 0;  % qroll siempre va a ser 0, ya que depende de q1

%Parametros intrinsecos del Robot
d1 = 349;
a1 = 16;
a2 = 221;
a3 = 221;
d5 = 145;

%Defino los parametros de DH
p1.d=d1 ; p1.a=a1 ; p1.alfa=pi/2 ;p1.q=q1;
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
				
R= rotx(pi)*roty(pi/2)*Te;          %Tengo que multiplicar por la rotx porq el eje z del EF esta invertido respecto del mundo.
Te = [R [x y z]'; zeros(1,3) 1];

nx=Te(1,1);	ox=Te(1,2);	ax=Te(1,3);	px=Te(1,4);
ny=Te(2,1);	oy=Te(2,2);	ay=Te(2,3);	py=Te(2,4);
nz=Te(3,1);	oz=Te(3,2);	az=Te(3,3);	pz=Te(3,4);

%Calculo q234
% c234=(+ax*c1+ay*s1);
% s234=az;
% q234=atan2(s234,c234);
% if (-1*1e-4 < q234) && (q234< 1e-4),q234=0;end
% 
% q234=q234*180/pi;
q234 = qpich;
c234=cosd(q234);
s234=sind(q234);

%Calculo q3
k1=px*c1+py*s1-p1.a-p5.d*c234;
k2=pz-p1.d-p5.d*s234;

c3=(k1^2+k2^2-(p2.a)^2-(p3.a)^2)/(2*p2.a*p3.a);
q3=acos(c3);
if (-1*1e-4 < q3) && (q3< 1e-4),q3=0;end
q3=q3*180/pi;
%Aca tengo las dos soluciones q3 y -q3, las elijo en funcion de ca.
if (ca==1) q3=-q3;end
s3=sind(q3);

%Calculo q2
alfa = p2.a+p3.a*c3;
beta = s3*p3.a;
c2=(alfa*k1+beta*k2)/(alfa^2+beta^2);
s2=(alfa*k2-beta*k1)/(alfa^2+beta^2);
% c2=(k1*(p3.a*c3+p2.a)+k2*p3.a*s3)/(p3.a^2+p2.a^2+2*p2.a*p3.a*c3);
% s2=(k2*(p3.a*c3+p2.a)-k1*p3.a*s3)/(p3.a^2+p2.a^2+2*p2.a*p3.a*c3);
q2=atan2(s2,c2);
if (-1*1e-4 < q2) && (q2< 1e-4),q2=0;end
q2=q2*180/pi;

%Calculo q4 
% q4=(q234-q2-q3+90);     %Aca le tengo q sumar 90 porq ya calcule q4 y quiero p4.q
q4=(q234-q2-q3);     %Aca le tengo q sumar 90 porq ya calcule q4 y quiero p4.q
if (-1*1e-4 < q4) && (q4< 1e-4),q4=0;end

%Calculo q5 --> Es directamente el q que me dan
q5=qroll;


%uso la CD para chequear que los valores esten bien
pos=CD_Scorvot(q1,q2,q3,q4,q5);
error=10;
if (x-error < pos(1)   && pos(1) < x+error && ...
    y-error < pos(2)   && pos(2) < y+error && ... 
    z-error < pos(3)   && pos(3) < z+error && ... 
    qpich-error<pos(4) && pos(4)<qpich+error && ...
    qroll-error<pos(5) && pos(5)<qroll+error)
    %si estan bien los muestro
    disp('valores CI')
    Q=[q1,q2,q3,q4,q5];
else warning('no pude calcular la posicion') 
Q=[0,0,0,0,0];

end


%Grafico el Robot
if (make_plot==1)
    plot_robot(q1,q2,q3,q4,q5);
    save2pdf('prueba.pdf',1,600);
elseif(make_plot==2)
    plot_robot_toolbox(q1,q2,q3,q4,q5);
    pause(5);
     save2pdf('prueba_2.pdf');
end
end
