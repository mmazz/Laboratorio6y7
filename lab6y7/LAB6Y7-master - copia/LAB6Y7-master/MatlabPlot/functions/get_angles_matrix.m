function angles_matrix = get_angles_matrix(s)
%   get_angles_matrix Returns matrix containing angular positions of 
%   all servos. s must be open serial port. 
               
    id_matrix = get_id_matrix();
    angles = zeros(6, 3);
    for i = 1:6
        for j = 1:3   
            if id_matrix(i, j) == -1
                angles(i, j) = pi/6; % default value, if servo not present
            else
                position = dxl_read_word(s, id_matrix(i, j), 36); 
                angles(i, j) = position_to_angle(position, j);
            end 
        end
    end
    angles_matrix = fix_sides(angles);
end
 
function angle = position_to_angle(position, j) 
   switch mod(j-1, 3)
        case 2 %theta3
            angle = pi*(850-position)/(850-300) +pi/20;
        case 1 %theta2
            angle = pi*(830-position)/(830-180) - pi/2; 
        case 0 %theta1
            angle = pi*(position-220)/(780-220) - pi/2; 
    end
end

function angles_matrix = fix_sides(angles) 
    for leg = 1:6
       right = mod(leg, 2);
       if right
          angles(leg, 2) = -angles(leg, 2);        %theta2
          angles(leg, 3) = -angles(leg, 3) - pi/2; %theta3
       else
          angles(leg, 1) = angles(leg, 1) - pi;    %theta1
       end
    end
    angles_matrix = angles;
end