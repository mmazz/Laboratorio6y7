
s = serial('/dev/ttyUSB1');
set(s,'BaudRate',500000);
fopen(s); 
%%
id = 6 %servo id
get_servo_position(s, id) 

val = 512; % center
steps = 10; % number of interpolation steps
% set_servo_position(s, id, val, steps)
% get_servo_position(s, id) 
   

%%
fclose(s); 
delete(s);
