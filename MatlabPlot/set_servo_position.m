function set_servo_position(s, id, value, interpolation_steps)
    pos = dxl_read_word(s, id, 36);
    if interpolation_steps < 1
       interpolation_steps = 1 
    end
    vect = linspace(pos,value,interpolation_steps);
    for i = 1:length(vect)
        t = int(vect(i));
        dxl_write_word(s, id, 30, t);
    end
