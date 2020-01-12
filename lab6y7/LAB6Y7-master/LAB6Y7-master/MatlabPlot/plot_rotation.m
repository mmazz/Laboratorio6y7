d1 = 1;
d2 = 1.5;

for theta3 = -pi/4:-0.2:-3*pi/4
    for theta1 = 0:0.1:pi
        theta2 = 0.2;
        %theta1 = 0.2;%-pi/4+theta1*0.1;
        
        R1=[ cos(theta1) 0 sin(theta1);
             0           1           0;
            -sin(theta1) 0 cos(theta1)];
        
        R2=[cos(theta2) -sin(theta2) 0;
            sin(theta2)  cos(theta2) 0;
                      0            0 1];
        
        R3=[cos(theta3) -sin(theta3) 0;
            sin(theta3)  cos(theta3) 0;
                      0            0 1];
        
        v1=[0; 0; 0];
        v2=R1*R2*[0; d1; 0];
        q1 = [v1,v2];
        
        v3=(v2-R1*R2*R3*[0;d2;0]);
        q2 = [v2,v3];
        
        [norm(v2) norm(v3-v2)]
        
        figure(1);
        hold on
        plot3(q1(1,:),q1(2,:),q1(3,:));
        plot3(q2(1,:),q2(2,:),q2(3,:));
        axis equal
        grid on
        pause(0.1)
    end;
end;