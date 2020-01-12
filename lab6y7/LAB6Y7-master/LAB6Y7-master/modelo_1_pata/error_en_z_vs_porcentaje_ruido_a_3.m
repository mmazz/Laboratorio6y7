function [ error_en_z_final] = error_en_z_vs_porcentaje_ruido_a_3(p1,p2,p3,pata,errormax,pasoo)
pose_real = forward_kinematics(p1,p2,p3,pata);
    error_max = errormax;
    paso = pasoo;
    param_elegido = p3.a;
   error_en_z_final =[];
    for porcentajeError = 1:paso:error_max
 
            p3.a = param_elegido + (porcentajeError/100)*param_elegido;
            poseError = forward_kinematics(p1,p2,p3,pata);
            vector_error(:,porcentajeError) = abs(-(poseError - pose_real));
 
       for fila =1:1:3
                error_por_coordenada(fila,porcentajeError) = vector_error(fila,porcentajeError);
       end
    
    e_z = error_por_coordenada(3,porcentajeError);
    error_en_z_final = cat(2,error_en_z_final, e_z);
    end

%        aboxplot(error_en_z_final,'labels',[1:paso:error_max],'colorgrad','orange_down'); % Advanced box plot
% 
%     xlabel('Porcentaje de Ruido');% Set the X-axis label
%     ylabel('Error en la posicion');
end
