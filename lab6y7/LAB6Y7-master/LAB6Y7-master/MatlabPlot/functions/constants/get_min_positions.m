function min_matrix = get_min_positions()
%   get_min_positions Returns matrix containing minimal position value
%   of each servo.

                 % t1  t2  t3
    min_matrix = [350 400 150;      % Right Front
                  300 250 350;      % Left Front
                  380 400 150;      % Right Middle
                  380 250 350;      % Left Middle
                  380 400 150;      % Right Rear
                  300 250 350];     % Left Rear
end

