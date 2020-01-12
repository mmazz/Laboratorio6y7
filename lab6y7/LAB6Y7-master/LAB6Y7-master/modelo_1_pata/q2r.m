function [ R ] = q2r(q)
%Q2R converts quternion to the Rotation matrix
% input 
%   q .. [qx,qy,qz,qw] quaternion
% output
%   R .. 3x3 rotation matrix

%reorder quaternion
q = q([4,1,2,3]);
%calculte Rotation matrix
R = [q(1)^2+q(2)^2-q(3)^2-q(4)^2,     2*(q(2)*q(3)-q(1)*q(4)),      2*(q(2)*q(4)+q(1)*q(3));
     2*(q(2)*q(3)+q(1)*q(4)),     q(1)^2-q(2)^2+q(3)^2-q(4)^2,      2*(q(3)*q(4)-q(1)*q(2));
     2*(q(2)*q(4)-q(1)*q(3)),         2*(q(3)*q(4)+q(1)*q(2))   q(1)^2-q(2)^2-q(3)^2+q(4)^2];
end