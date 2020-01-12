function [ error, nuevas_poses ] = estudio_error(p1,p2,p3,input_thetas_4)
%ESTUDIO_ERROR Summary of this function goes here
%   Detailed explanation goes here

pose_real = forward_kinematics(p1,p2,p3,input_thetas_4);
error_max = 10;
paso = 2;
    for error = 1:paso:error_max
        


end

