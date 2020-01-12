function max_matrix = get_max_positions()
%   get_max_positions Returns matrix containing maximal position value
%   of each servo.

                 % t1  t2  t3
    max_matrix = [700 800 700;      % Right Front
                  600 700 850;      % Left Front
                  650 800 700;      % Right Middle
                  620 700 850;      % Left Middle
                  700 800 700;      % Right Rear
                  700 700 850];     % Left Rear             
end

