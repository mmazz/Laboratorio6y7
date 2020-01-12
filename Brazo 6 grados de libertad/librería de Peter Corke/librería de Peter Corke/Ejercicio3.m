th1=0*pi/180;
th2=60*pi/180;
p=pcd(l1,l2,th1,th2);
x=[0 l1*cos(th1) p(1)];
y=[0 l1*sin(th1) p(2)];
plot(x,y, 'Linewidth',3)
axis([-2 2 -2 2]);
grid on
