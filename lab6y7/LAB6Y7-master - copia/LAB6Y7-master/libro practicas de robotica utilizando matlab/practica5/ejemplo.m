%----------------------------------------------------------
%----programa de prueba del software de planificaci�n -----
%----            interpolaci�n 4-3-4                  -----
%----------------------------------------------------------

clear

%-------------------------------------------------------------------------
% q1 y q2 son las coordenadas articulares inicial y final
%-------------------------------------------------------------------------
disp([' ']);
disp(['     Vectores q1 y q2 de las coordenadas articulares ']);
disp(['     inicial y final. ']);

q1 = rand(6,1)
q2 = rand(6,1)

%-------------------------------------------------------------------------
% Llamada a la funci�n PLANIFICADOR
%-------------------------------------------------------------------------

[t,pos, vel, ace] = planificador(q1,q2);

%-------------------------------------------------------------------------
% gr�ficas de los resultados 
%-------------------------------------------------------------------------

figure
plot(t,pos)
grid
title('Perfil de posici�n dada por el planificador')
xlabel('Tiempo (seg)'), ylabel('Posici�n (rad)')


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
