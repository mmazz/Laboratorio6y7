function load_matrix = get_load_matrix(s)
%   get_load_matrix Returns matrix containing present load on each servo.
%   s must be open serial port. 

    id_matrix = get_id_matrix();                       
    load = zeros(6, 3);
    for i = 1:6
        for j = 1:3   
            if id_matrix(i, j) == -1
                load(i, j) = 0; %default value, if servo not present
            else   
                word = dxl_read_word(s, id_matrix(i, j), 40); 
                torque_enabled = dxl_read_byte(s, id_matrix(i, j), 24); 
                if ~torque_enabled 
                   word = 0; 
                end
                direction = 2*bitshift(word, -10)-1; % +1 CW, -1 CCW
                load(i, j) = direction*bitand(word, 1023);
            end 
        end
    end
    load_matrix = load;
end

