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

%% Raise one leg
leg = 4; %LM
maxs = get_max_positions();
mins = get_min_positions();
positions = get_position_matrix(s);
positions(leg, 2) = mins(leg, 2);
positions(leg, 3) = maxs(leg, 3);
dxl_write_word_sync(s, 30, positions);

%% Move the leg forward
positions(leg, 1) = mins(leg,1);
dxl_write_word_sync(s, 30, positions);

%% Move the leg down
positions(leg, 2) = maxs(leg, 2);
positions(leg, 3) = mins(leg, 3);
dxl_write_word_sync(s, 30, positions);
graph = zeros(150);
for i = 1:150
    torque_raw = dxl_read_word(s, 15, 40);    
    direction = 2*bitshift(torque_raw, -10)-1; % +1 CW, -1 CCW
    torque = direction*bitand(torque_raw, 1023); %abs of torque
    graph(i) = torque;
    pause(0.01)
%     speed = bitand(dxl_read_word(s, 15, 38), 1023)
%     if speed == 0
%        speed = 200; 
%     end
%     if (torque>182 && speed<100)
%         dxl_write_byte(s, 254, 24, 0); 
%         break
%     end
end

%%
steps = maxs(leg, 2) - mins(leg, 2);
positions(leg, 2) = mins(leg, 2);
pause(1);
for i = 1:steps/2
    positions(leg, 2) = positions(leg, 2) + 2*i;
    dxl_write_word_sync(s, 30, positions);
    pause(0.05);
 
end

%% Move the leg backward
positions = get_position_matrix(s);
positions(2, 1) = maxs(2, 1);
dxl_write_word_sync(s, 30, positions);

%% Move legs simultaneously
move_legs(s, [1]);

%% Close serial port
fclose(s); 
delete(s);
clear s
