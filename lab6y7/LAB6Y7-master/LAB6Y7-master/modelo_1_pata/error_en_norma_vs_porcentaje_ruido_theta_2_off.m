function [ error_en_norm_final] = error_en_norma_vs_porcentaje_ruido_theta_2_off(p1,p2,p3,pata,errormax,pasoo)
   pose_real = forward_kinematics(p1,p2,p3,pata);
    error_max = errormax;
    paso = pasoo;
    param_elegido = p2.theta_off;
   
   error_en_x_final = [];
   error_en_y_final = [];
   error_en_norm_final = [];
   for porcentajeError = 1:paso:error_max
 
            p2.theta_off = param_elegido + (porcentajeError/100)*param_elegido;
            poseError = forward_kinematics(p1,p2,p3,pata);
            vector_error(:,porcentajeError) = abs(-(poseError - pose_real));
 
       for fila =1:1:3
                error_por_coordenada(fila,porcentajeError) = vector_error(fila,porcentajeError);
     end
    
    e_x = error_por_coordenada(1,porcentajeError);
    error_en_x_final = cat(2,error_en_x_final, e_x);
    e_y = error_por_coordenada(2,porcentajeError);
    error_en_y_final = cat(2,error_en_y_final, e_y);
    norma = sqrt(e_x.*e_x + e_y.*e_y);
    error_en_norm_final =cat(2,error_en_norm_final,norma(:,1));
   end
    

% 
%        aboxplot(error_en_z_final,'labels',[1:paso:error_max]); % Advanced box plot
% 
%     xlabel('Porcentaje de Ruido');% Set the X-axis label
%     ylabel('Error en la posicion');
end
