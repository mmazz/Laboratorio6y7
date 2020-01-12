%% Open serial port
clear all;
s = serial('COM21');
set(s,'BaudRate',1000000);
fopen(s); 

%% Disable torque for all servos
dxl_write_byte(s, 254, 24, 0); 

%% Set moving speed of all servos
m(1:6, 1:3) = 200;
dxl_write_word_sync(s, 32, m);

%% Set margin and slope
margin(1:6, 1:3) = 1;
margin(1:6, 2) = 0;
slope(1:6, 1) = 32;
slope(1:6, 2) = 128;
slope(1:6, 3) = 64;
dxl_write_byte_sync(s, 26, margin); % CW
dxl_write_byte_sync(s, 27, margin); % CCW
dxl_write_byte_sync(s, 28, slope); % CW
dxl_write_byte_sync(s, 29, slope); % CCW

%% Raise the leg
leg = 4;
id_matrix = get_id_matrix();
maxs = get_max_positions();
mins = get_min_positions();
dxl_write_word(s, id_matrix(leg, 2), 30, mins(leg, 2));
dxl_write_word(s, id_matrix(leg, 3), 30, maxs(leg, 3));

%% Move the leg backwards
dxl_write_word(s, id_matrix(leg, 1), 30, maxs(leg, 1));

%% Move the leg forward (obstacle detection)
step = 20;
des_theta1 = dxl_read_word(s, id_matrix(leg, 1), 36)
error = 0;
while ((des_theta1 > mins(leg, 1))&& (abs(error)<8))
    cur_theta1 = dxl_read_word(s, id_matrix(leg, 1), 36);
    error = (4*error+des_theta1-cur_theta1)/5
    des_theta1 = des_theta1-step;
    dxl_write_word(s, id_matrix(leg, 1), 30, des_theta1);
    pause(0.05);
end
des_theta1

%% Detect ground
step = 20;
des_theta2 = mins(leg, 2);
des_theta3 = maxs(leg, 3);
error = 0;
while ((des_theta2 < maxs(leg, 2)) && (error<11))
    cur_theta2 = dxl_read_word(s, id_matrix(leg, 2), 36);
    error = (4*error+des_theta2-cur_theta2)/5
    des_theta2 = des_theta2+step;
    des_theta3 = des_theta3-step;
    dxl_write_word(s, id_matrix(leg, 2), 30, des_theta2);
    dxl_write_word(s, id_matrix(leg, 3), 30, des_theta3);
    pause(0.05);
end
des_theta2

%% Close serial port
fclose(s); 
delete(s);
clear s