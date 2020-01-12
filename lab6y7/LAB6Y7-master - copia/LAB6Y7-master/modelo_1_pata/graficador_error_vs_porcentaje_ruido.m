function [ vector_error, h] = graficador_error_vs_porcentaje_ruido(p1,p2,p3,pata)
    num_iters = 10000;
    pose_real = forward_kinematics(p1,p2,p3,pata);
    error_max = 40;
    paso = 4;
    theta_off_elegido = p2.theta_off;
    vector_error = zeros(4,num_iters);
   error_en_x_final =[];
   error_en_y_final =[];
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
    e_x = error_por_coordenada(1,:,porcentajeError);
    e_x_vec = e_x(:);
    error_en_x_final = cat(2,error_en_x_final, e_x_vec(:,1));
    e_y = error_por_coordenada(2,:,porcentajeError);
    e_y_vec = e_y(:);
    error_en_y_final = cat(2,error_en_y_final, e_y_vec(:,1));
    e_z = error_por_coordenada(3,:,porcentajeError);
    e_z_vec = e_z(:);
    error_en_z_final = cat(2,error_en_z_final, e_z_vec(:,1));
    end
%     
%     aa = error_por_coordenada(1,:,2); aa_vec = aa(:);
%     bb= error_por_coordenada(1,:,4); bb_vec = bb(:);
%    cc = error_por_coordenada(1,:,6); cc_vec = cc(:);
%        error_en_x_final = cat(2,aa_vec(:,1),bb_vec(:,1),cc_vec(:,1));
   h = {error_en_x_final;error_en_y_final;error_en_z_final}; % Create a cell array with the data for each group

       aboxplot(h,'labels',[1:paso:error_max]); % Advanced box plot

    xlabel('Porcentaje de Ruido');% Set the X-axis label
    ylabel('Error en la posicion');
    legend('Error en x','Error en y','Error en z'); % Add a legend
     %     for porcentajeError = 1:paso:error_max
%          err_x = cat(2,error_en_x(1,:,porcentajeError));,

 %     x = cat(2,x1,x2,x3); 
%     y = cat(2,y1,y2,y3);
%     z = cat(2,z1,z2,z3);
end
