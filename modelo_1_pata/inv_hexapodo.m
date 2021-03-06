function [ Thetas ] = inv_hexapodo(x,y,z,patas)
   

    a_i = [52,66,138];
    ya = 60.5;  %p_y links 1, (-2),3, (-4)
    yb = 100.5; %p_y links 5,6
    xa = 120.6; %p_x links 1,2, (-3),(-4)
    theta_2_off= -0.22;
    theta_3_off= -0.81;
    
    body_params = [  pi/4,  xa, ya; %beta, p_x , p_y FIRST LEG
               7*pi/4,  xa,-ya; %2ND LEG
               3*pi/4, -xa, ya; %3RD LEG
               5*pi/4, -xa,-ya; %4TH LEG
                 pi/2,   0, yb; %5TH LEG
               3*pi/2,   0,-yb]; %6TH LEG
   
    
    for i=1:size(patas)
        pata = patas(i);
        p_x = body_params(pata,2);
        p_y = body_params(pata,3);
        beta = body_params(pata,1);
         if(x<0)
            x_aux = - x + p_x;
            y_aux = - y + p_y;
         else    
            x_aux = x - p_x;
            y_aux = y - p_y;
         end
      

        % Calculo theta 1
        theta1(i) = atan2(y_aux,x_aux) - beta;

        % Las coordenadas x,y,z expresadas en el sistema de ref del femur son:
        coords_femur = [sqrt((x-p_x)^2 + (y- p_y)^2) - a_i(1),z,0];
        norma = coords_femur(1).*coords_femur(1) + coords_femur(2).*coords_femur(2);
        raiz = sqrt(coords_femur(1).*coords_femur(1) + coords_femur(2).*coords_femur(2));
        
        % Calculo theta 2 y theta 3
        
        aux2 = acos(((a_i(2))^2 - (a_i(3))^2 + norma)/(2*a_i(2)*raiz)) ;
        aux3 = atan2(coords_femur(2),coords_femur(1));
        aux4 = theta_2_off;
        theta2(i) = (+aux2 + aux3 - aux4);
%         theta2(i) = - acos(((a_i(2))^2 - (a_i(3))^2 + norma)/(2*a_i(2)*raiz)) + atan2(coords_femur(2),coords_femur(1)) + theta_2_off;
        theta3(i) = -pi + acos(((a_i(2))^2 + (a_i(3))^2 - norma)/(2*a_i(2)*a_i(3))) - theta_3_off;
        
        %mostramos los angulos
         %s = 'Theta fuera de rango!';
        %if(theta1 < -90*pi/180 || theta1 > 90*pi/180)
        %    disp(s)
        %return;
        %else
            Thetas(:,i) = [wrapToPi(theta1(i)),wrapToPi(theta2(i)),wrapToPi(theta3(i))].*180/pi;
%         Thetas(:,i) = [theta1(i),theta2(i),theta3(i)].*180/pi;
        %end
    end
end

