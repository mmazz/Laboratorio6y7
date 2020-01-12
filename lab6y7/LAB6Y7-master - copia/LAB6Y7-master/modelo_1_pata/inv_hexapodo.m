function [ Thetas ] = inv_hexapodo(x,y,z)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CINEMATICA INVERSA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Thetas = zeros(3,6);
theta1 = zeros(1,6);
theta2 = zeros(1,6);
theta3 = zeros(1,6);
    for pata = 1:1:6
        a1 = 52; a2 = 66; a3 = 138;
        a_i = [a1,a2,a3];
        ya = 60.5; %p_y links 1, (-2),3, (-4)
        yb = 100.5; %p_y links 5,6
        xa = 120.6; %p_x links 1,2, (-3),(-4)
        theta_2_off= -0.22;
        theta_3_off= -0.81;
% syms xa ya yb;
        body_params = [  pi/4,  xa, ya; %beta, p_x , p_y FIRST LEG
                   7*pi/4,  xa,-ya; %2ND LEG
                   3*pi/4, -xa, ya; %3RD LEG
                   5*pi/4, -xa,-ya; %4TH LEG
                     pi/2,   0, yb; %5TH LEG
                   3*pi/2,   0,-yb]; %6TH LEG
        p_x = body_params(pata,2);
        p_y = body_params(pata,3);
        beta = body_params(pata,1);
        theta1(pata) = atan2(y - p_y,x - p_x) - beta;
% Las coordenadas x,y,z expresadas en el sistema de ref del femur son:
        coords_femur = [sqrt((x - p_x)^2 + (y - p_y)^2) - a_i(1),z,0]';
        norma = coords_femur(1)*coords_femur(1) + coords_femur(2)*coords_femur(2) + coords_femur(3)*coords_femur(3);
        raiz = sqrt(coords_femur(1)*coords_femur(1) + coords_femur(2)*coords_femur(2) + coords_femur(3)*coords_femur(3));
        theta2(pata) = acos(((a_i(2))^2 - (a_i(3))^2 + norma)/(2*a2*raiz)) + atan2(coords_femur(2),-coords_femur(1)) - theta_2_off - pi/2;
        theta3(pata) = -pi/2 + acos(((a_i(2))^2 + (a_i(3))^2 - norma)/(2*a_i(2)*a_i(3))) - theta_3_off;
        %mostramos los angulos
        Thetas(:,pata) = [theta1(pata),theta2(pata),theta3(pata)].*180/pi;
    end

end

