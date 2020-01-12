function [ vector_error] = error_en_z_vs_porcentaje_ruido_theta_2_off(p1,p2,p3,pata)
    num_iters = 10000;
    pose_real = forward_kinematics(p1,p2,p3,pata);
    error_max = 40;
    paso = 5;
    theta_off_elegido = p2.theta_off;
    vector_error = zeros(4,num_iters);
   error_en_z_final =[];
    for porcentajeError = 1:paso:error_max
        for iteracion = 1:1:num_iters
            p2.theta_off = theta_off_elegido + (porcentajeError/100)*theta_off_elegido*rand();
            poseError = forward_kinematics(p1,p2,p3,pata);
            vector_error(:,iteracion,porcentajeError) = abs(-(poseError - pose_real));
        end
     for fila =1:1:3
                error_por_coordenada(fila,:,porcentajeError) = vector_error(fila,:,porcentajeError);
     end
    e_z = error_por_coordenada(3,:,porcentajeError);
    e_z_vec = e_z(:);
    error_en_z_final = cat(2,error_en_z_final, e_z_vec(:,1));
    end


       aboxplot(error_en_z_final,'labels',[1:paso:error_max]); % Advanced box plot

    xlabel('Porcentaje de Ruido');% Set the X-axis label
    ylabel('Error en la posicion');
end
