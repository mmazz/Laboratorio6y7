function [ T ] = matriz_transf_DH( param )
%MATRIZ_TRANSF_DH Homogeneous transformation between each link.
alpha=param.alpha;
a=param.a;
d=param.d;
theta=param.theta + param.theta_off;
ctheta=cos(theta);
stheta=sin(theta);
calpha=cos(alpha);
salpha=sin(alpha);

% if (-1*1e-10 < calpha) && (calpha< 1e-10),calpha=0;end
% if (-1*1e-10 < salpha) && (salpha< 1e-10),salpha=0;end

T=[ctheta -stheta*calpha   stheta*salpha   a*ctheta;...
   stheta  ctheta*calpha  -ctheta*salpha   a*stheta;...
   0   salpha         calpha      d;...
   0    0                0      1];



end