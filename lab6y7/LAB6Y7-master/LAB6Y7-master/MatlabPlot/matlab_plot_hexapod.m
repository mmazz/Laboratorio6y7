%%
clear all;
s = serial('/dev/ttyUSB0');
set(s,'BaudRate',1000000);
fopen(s);  

%%
d0 = 1;
d1 = 1;
d2 = 1.5;

for i = 1:100 % Set how many times you want the plot to be repainted

% Wait and clear the plot 
pause(0.0001)
figure(1);
hold off
plot3([0,0],[0,0],[0,0]);
hold on
axis equal
grid on

% Draw hexapod's body
plot3(   [0, 2*d0],   [0, 0], [0, 0], '.-k', 'LineWidth', 1);
plot3(   [0, 2*d0], [d0, d0], [0, 0], '.-k', 'LineWidth', 1);
plot3(      [0, 0],  [0, d0], [0, 0], '.-k', 'LineWidth', 1);
plot3([2*d0, 2*d0],  [0, d0], [0, 0], '.-k', 'LineWidth', 1);

% Get data from servos
angles = get_angles_matrix(s);
load = get_load_matrix(s);

% Draw legs
for leg = 1:6
    xShift = fix((leg-1)/2)*d0; 
    yShift = mod(leg, 2)*d0;
    theta1 = angles(leg, 1);
    theta2 = angles(leg, 2);
    theta3 = angles(leg, 3);
 
    R1=[1           0            0;
        0 cos(theta2) -sin(theta2);
        0 sin(theta2)  cos(theta2)];
    
    R2=[cos(theta1) -sin(theta1) 0;
        sin(theta1)  cos(theta1) 0;
                  0            0 1];
          
    R3=[1           0            0;
        0 cos(theta3) -sin(theta3);
        0 sin(theta3)  cos(theta3)];  
    
    % Compute marginal points of current leg
    v1=[xShift; yShift; 0];
    v2=R2*R1*[0; d1; 0]+[xShift; yShift; 0];
    v3=(v2-R2*R1*R3*[0;d2;0]);
    % Draw leg
    q1 = [v1,v2];
    q2 = [v2,v3];
    plot3(q1(1,:),q1(2,:),q1(3,:), '.-b', 'LineWidth', 2, 'MarkerSize', 15, 'MarkerEdgeColor', [1 0 0]);
    plot3(q2(1,:),q2(2,:),q2(3,:), '-b', 'LineWidth', 2);
    
    % Draw torque arrows
    t1 = [0; 0; -load(leg, 1)/100];   % torque1 vector
    t2 = R2*[load(leg, 2)/100; 0; 0]; % torque2 vector
    t3 = R2*[load(leg, 3)/100; 0; 0]; % torque3 vector
    quiver3(v1(1), v1(2), v1(3), t1(1), t1(2), t1(3), '-r', 'LineWidth', 1);
    quiver3(v1(1), v1(2), v1(3), t2(1), t2(2), t2(3), '-r', 'LineWidth', 1);
    quiver3(v2(1), v2(2), v2(3), t3(1), t3(2), t3(3), '-r', 'LineWidth', 1);
end

end

%%
fclose(s); 
delete(s);
clear s
