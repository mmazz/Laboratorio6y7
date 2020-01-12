%----------------------------------------------------------
%----programa de prueba del software de planificación -----
%----            interpolación 4-3-4                  -----
%----          Datos iniciales en articulares         -----
%----------------------------------------------------------

clear
%q1 y q2 son las coordenadas articulares inicial y final
q1=[0 	0.2 	0.3 	0 		0.25 	0.15]';
q2=[0.9 	0.8 	0.7	0.5	0.35	0.6]';
%q1 = zeros(6,1);
%q2 = ones(6,1);

t = 0:0.01:1;
[pos, vel, ace] = planificador(q1,q2,t);

%----graficas de los resultados 

figure
plot(t,pos)
grid
title('Perfil de posición dada por el planificador')
xlabel('Tiempo (seg)'), ylabel('Posición (rad)')


figure
plot(t,vel)
grid
title('Perfil de Velocidad dada por el planificador')
xlabel('Tiempo (seg)'), ylabel('Velocidad (rad/seg)')

figure
plot(t,ace)
grid
title('Perfil de Aceleracion Dada por el planificador')
xlabel('Tiempo (seg)'), ylabel('Aceleracion (rad/seg2)')
