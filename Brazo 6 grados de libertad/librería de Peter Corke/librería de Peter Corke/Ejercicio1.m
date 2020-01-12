l1=1;
l2=1;
th1=0:(pi/2)/20:pi;
th2=0:(pi/2)/20:pi;
px=l1*cos(th1)+l2*cos(th1+th2);
py=l1*sin(th1)+l2*sin(th1+th2);
plot(px,py)
