%CODIGO DE FACUNDO PESSACG!!!
syms q1 q2 q3 q4 q5;
syms a1 a2 a3 d1 d5 pi;
%elegimos una configuraci�n inicial del brazo (q_i son los �ngulos
%iniciales de cada articulaci�n)
%q1=0; q2=pi/4; q3=pi/4; q4=pi/4; q5=pi/4;

%Parametros intrinsecos del Robot
% d1 = 349; %en cm
% a1 = 16;
% a2 = 221;
% a3 = 221;
% d5 = 145;

% %Defino los parametros de DH (bunch of structures) que se las vamos a
% pasar a D-H para que haga lo suyo.
p1.d=d1 ; p1.a=a1 ; p1.alpha=pi/2 ;p1.q=q1;
p2.d=0  ; p2.a=a2  ; p2.alpha=0    ;p2.q=q2;
p3.d=0  ; p3.a=a3  ; p3.alpha=0    ;p3.q=q3;
p4.d=0  ; p4.a=0   ; p4.alpha=pi/2 ;p4.q=q4+pi/2;
p5.d=d5 ; p5.a=0   ; p5.alpha=0    ;p5.q=q5;
%  
% %Construyo las transformaciones de cada junta. Esto es, computamos las
% matrices de transformaci�n de la trama i-1 a la trama i.
T0_1=transf_DHstd(p1);
T1_2=transf_DHstd(p2);
T2_3=transf_DHstd(p3);
T3_4=transf_DHstd(p4);
%T3_4=simplify(transf_DHstd(p4)); No s� para que est�.. tiene numeritos la
%matriz adentro.. tira error al correrlo. M�s adelante cobra sentido esto
%al 'redondear los numeros'..
T4_5=transf_DHstd(p5);
% 
%vpa(x) uses variable-precision floating-point arithmetic (VPA) to evaluate each 
%element of the symbolic input x to at least d significant digits, 
%where d is the value of the digits function.
%Es decir, ..., evaluamos las matrices en numeritos concretos y elegimos
%con cuantas cifras lo queremos. REDONDEA TODO A NUMEROS + PUBLICABLES (?)
%correr las matrices antes de aplicarles la vpa, comparar el antes y el
%despu�s..
% T0_1=vpa(T0_1);
% T1_2=vpa(T1_2);
% T2_3=vpa(T2_3);
% T3_4=vpa(T3_4);
% T4_5=vpa(T4_5);
% 
% %hago primero esta multiplicacion xq es RRR (RRR???)
T1_4=T1_2*T2_3*T3_4;
T1_4=simplify(T1_2*T2_3*T3_4); %ahora no hay problema con simplify
T1_5=simplify(T1_4*T4_5);
T0_5=T0_1*T1_4*T4_5;  
T0_5=simplify(T0_1*T1_4*T4_5);  
T0_5
%La matriz que relaciona la trama base con la del efector final, queda un choclazo importante..
%debe ser por eso la magia de abajo (?).
% T0_5=subs(T0_5,{q1,q2,q3,q4,q5},{q1_r,q2_r,q3_r,q4_r,q5_r});
%que hace subs? agarra la T0_5 y reemplaza {q1,q2,q3,q4,q5} POR
%{q1_r,q2_r,q3_r,q4_r,q5_r}
%subs no lo pudimos utilizar, xq el programa no sabe quienes son los qi_r
%que no est�n definidos en ning�n lado.
%pareciera que todo el calculo originalmente fuera simb�lico, que un d�a lo
%hicieron num�rico pero que estas variables qi_r son las variables que
%llevan la trama herramienta agregada a la trama base (?).
%DESESITAMOS ESE SUBS XQ NO PODEMOS SEGUIR SINO..

%Lo de arriba no lo borro x si sirve para volver a pensarlo. Ahora bien,
%debido a las ecuaciones que est�n abajo, la TRAMA HERRAMIENTA tendr�a que
%haber sido incluida en alguna parte del calculo pues aparecen los
%resultados de la ecuaci�n (1.19)
%Abajo est�n los resultados de las ecuaciones (1.10) y (1.19)
pos(1)=T0_5(1,4);   %x
pos(2)=T0_5(2,4);   %y
pos(3)=T0_5(3,4);   %z
pos(4)=q2_r+q3_r+q4_r;    %qpich
% pos(5)=q5_r;          %qroll
pos(1)= cosd(q1)*(a1 + a2.*cosd(q2) + a3.*cosd(q2 + q3) + d5.*cosd(q2 + q3 + q4));   %x
pos(2)= sind(q1)*(a1 + a2.*cosd(q2) + a3.*cosd(q2 + q3) + d5.*cosd(q2 + q3 + q4));   %y
pos(3)= d1 + a2.*sind(q2) + a3.*sind(q2 + q3) + d5.*sind(q2 + q3 + q4) ;   %z
pos(4)= q2 + q3 + q4;    %qpich
pos(5)= q5;          %qroll
%no podemos controlar yaw (alpha)

end





