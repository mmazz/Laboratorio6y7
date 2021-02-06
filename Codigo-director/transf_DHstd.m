function [T] = transf_DHstd(param)
alpha=param.alpha;
a=param.a;
d=param.d;
q=param.q;
cq=cos(q);
sq=sin(q);
calpha=cos(alpha);
salpha=sin(alpha);

if (-1*1e-10 < calpha) && (calpha< 1e-10),calpha=0;end
if (-1*1e-10 < salpha) && (salpha< 1e-10),salpha=0;end

T=[cq -sq*calpha   sq*salpha   a*cq;...
   sq  cq*calpha  -cq*salpha   a*sq;...
   0   salpha         calpha      d;...
   0    0                0      1];


 end