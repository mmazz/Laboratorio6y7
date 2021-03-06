% Test cineatica directa e inversa

% Pose Inicial y pata 
pata = 6;
pose = [0,0,60] * pi/180;

% Parametros DH
p1.theta = pose(1); p2.theta = pose(2); p3.theta = pose(3);
p1.theta_off = 0; p2.theta_off = -0.22; p3.theta_off = -0.81;
p1.a= 52; p2.a = 66; p3.a = 138;
p1.alpha = pi/2; p2.alpha = 0; p3.alpha = 0;
p1.d = 0; p2.d = 0; p3.d = 0;

% Cinematica Directa
% TODO : agregar que pata pueda ser un vector
pose_xyz = forward_kinematics(p1,p2,p3,pata)


% Cinematica Inversa
% TODO : chequear que pata pueda ser un vector
theta =  inv_hexapodo(pose_xyz(1) ,pose_xyz(2) ,pose_xyz(3),pata)



