function p = pcd(l1,l2,th1,th2)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

px=l1*cos(th1)+l2*cos(th1+th2);
py=l1*sin(th1)+l2*sin(th1+th2);
p=[px;py]
plot(px,py)
end

