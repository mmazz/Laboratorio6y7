function [ vector_error] = graficador_error_vs_porcentaje_ruido(p1,p2,p3,pata)
    %ESTUDIO_ERROR Summary of this function goes here
    %   Detailed explanation goes here

    num_iters = 10;
    %pose_real = forward_kinematics(p1,p2,p3,input_thetas_4).*ones(4,num_iters);
    pose_real = forward_kinematics(p1,p2,p3,pata);
    error_max = 5;
    paso = 1;
    theta_off_elegido = p2.theta_off;
% error_medido = zeros(100);
    %WE PREALLOCATE MEMORY TO MAKE THE COMPUTATION FASTER
    vector_error = zeros(4,num_iters);
error_medio = zeros(4,1,error_max/paso);
% error_medido_todo = zeros(4,error_max);
    for porcentajeError = 1:paso:error_max

        for iteracion = 1:1:num_iters
            p2.theta_off = theta_off_elegido + (porcentajeError/100)*theta_off_elegido*rand();
            poseError = forward_kinematics(p1,p2,p3,pata);
            vector_error(:,iteracion,porcentajeError) = -(poseError - pose_real);
        end
%     for fila =1:1:3
%                error_medio(fila,1,porcentajeError) = mean(vector_error(fila,:,porcentajeError));
% 
%     end
%      porcentaje = 1:paso:error_max;
%      boxplot(error_medio(1,1,porcentajeError),porcentaje);
%      hold on;   
    end
%     hold off;

%     
end
