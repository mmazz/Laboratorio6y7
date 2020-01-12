function id_matrix = get_id_matrix()
%   get_id_matrix Returns matrix containing id numbers of each servo.
         
                %t1 t2 t3
    id_matrix = [ 2  4  6;      % Right Front
                  1  3  5;      % Left Front
                 14 16 18;      % Right Middle
                 13 15 17;      % Left Middle
                  8 10 12;      % Right Rear
                  7  9 11];     % Left Rear
end

