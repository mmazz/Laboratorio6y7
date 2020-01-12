function [value] = get_servo_position(s, id)
    value = dxl_read_word(s, id, 36); 