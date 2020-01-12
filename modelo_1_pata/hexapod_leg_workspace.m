
%WORKSPACE OF THE HEXAPOD
 
pata=6;
p1.theta_off = 0; p2.theta_off = -0.22; p3.theta_off = -0.81;
p1.a= 52; p2.a = 66; p3.a = 138;
p1.alpha = pi/2; p2.alpha = 0; p3.alpha = 0;
p1.d = 0; p2.d = 0; p3.d = 0;
 
num=1;

for th1=(-45:1:45)*pi/180
    for th2= (-5:1:5)*pi/180
        for th3=(-5:1:5)*pi/180
                        p1.theta=th1; p2.theta=th2; p3.theta=th3;
                        pose = forward_kinematics(p1,p2,p3,pata);
                        x(num)=pose(1);
                        y(num)=pose(2);
                        z(num)=pose(3);
                        num=num+1;
                        plot(y,z,'r*');hold on;
        end
    end
end

 
