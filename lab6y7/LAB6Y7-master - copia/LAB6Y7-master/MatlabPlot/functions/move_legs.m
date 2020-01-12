function [] = move_legs(s, legs)
%   move_legs Moves selected legs simultaneously. Each servo eventually 
%   moves down until ground is detected.


% Initialize servos
dxl_write_byte(s, 254, 24, 1); % Enable Torque
m(1:6, 1:3) = 200;
dxl_write_word_sync(s, 32, m); % Set servos speed
margin(1:6, 1:3) = 1;
margin(1:6, 2) = 0;
slope(1:6, 1) = 32;
slope(1:6, 2) = 128;
slope(1:6, 3) = 64;
dxl_write_byte_sync(s, 26, margin); % CW
dxl_write_byte_sync(s, 27, margin); % CCW
dxl_write_byte_sync(s, 28, slope); % CW
dxl_write_byte_sync(s, 29, slope); % CCW


% Raise legs
maxs = get_max_positions();
mins = get_min_positions();
positions = get_position_matrix(s);
for i = 1:size(legs, 1) 
    leg = legs(i);
    if mod(leg, 2) == 1 % Right leg
        positions(leg, 2) = maxs(leg, 2);
        positions(leg, 3) = mins(leg, 3);
    else                % Left leg
        positions(leg, 2) = mins(leg, 2);
        positions(leg, 3) = maxs(leg, 3); 
    end
end
dxl_write_word_sync(s, 30, positions);
pause(1);

% Move legs forward
step = 20;
id_matrix = get_id_matrix();
errors = zeros(6);
positions = get_position_matrix(s);
approached = 0;
while ~approached
    approached = 1;
    for i = 1:size(legs, 1)
        leg = legs(i);
        fin_pos = 0;
        direction = 0;
        if mod(leg, 2) == 1 % Right leg
            fin_pos = maxs(leg, 1);
            direction = 1;
        else
            fin_pos = mins(leg, 1);
            direction = -1;
        end
        act_pos =  dxl_read_word(s, id_matrix(leg, 1), 36);
        errors(leg) = (4*errors(leg) + act_pos-positions(leg, 1))/5   
        if (abs(errors(leg)) < 11) && (direction*(fin_pos-act_pos)>0) 
            approached = 0;
            positions(leg, 1) = positions(leg, 1) + direction*step;
        end
    end
    dxl_write_word_sync(s, 30, positions);
    pause(0.05);
end


% Move legs down


end

