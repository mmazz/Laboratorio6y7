%% Start serial communication
clear all;
s = serial('/dev/ttyUSB0');
set(s,'BaudRate',1000000);
fopen(s);  

dxl_write_byte(s, 2, 25, 1); 
%change id
dxl_write_byte(s, 2, 3, 5); 
dxl_write_byte(s, 5, 25, 0);

% % 
% % 
% % %% Disable torque for all servos
% % dxl_write_byte(s, 254, 24, 0); 
% % 
% % %% Turn on all LEDs
% % m(1:6, 1:3) = 0;
% % dxl_write_byte_sync(s, 25, m);
% % 
% % %% Read/write some values
% % dxl_read_word(s, 5, 36);       % present position
% % dxl_read_word(s, 1, 40);       % present load
% % dxl_read_word(s, 1, 22);       % max torque
% % %dxl_write_word(s, 6, 30, 300); % goal position
% % %dxl_write_byte(s, 1, 24, 1);   % torque enable
% % %to_degrees(get_angles_matrix(s))
% % get_position_matrix(s)
% % 
% % %%
% % dxl_create_packet(10, 3, 30, 100, 1)
%% Close serial communication
fclose(s); 
delete(s);
clear s
