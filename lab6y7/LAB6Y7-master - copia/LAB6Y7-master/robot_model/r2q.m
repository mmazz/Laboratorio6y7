function [ q ] = r2q(R)
%R2Q converts Rotation matrix to the quaternion qw qx qy qz
% input 
%   R .. 3x3 rotation matrix
% output
%   q .. [qw,qx,qy,qz] quaternion

q = 1/(2*sqrt(trace(R)+1)).*[trace(R) + 1; R(3,2)-R(2,3);R(1,3)-R(3,1);R(2,1)-R(1,2)];
%normalization
q = q/norm(q);
%reorder to proper format
q = q([2 3 4 1]);
end

