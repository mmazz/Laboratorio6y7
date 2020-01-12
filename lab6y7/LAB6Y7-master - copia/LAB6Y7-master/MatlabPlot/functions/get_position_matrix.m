function position_matrix = get_position_matrix(s)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

    id_matrix = get_id_matrix();
    positions = zeros(6, 3);
    for i = 1:6
        for j = 1:3   
            if id_matrix(i, j) == -1
                positions(i, j) = -1; % default value, if servo not present
            else
                positions(i, j) = dxl_read_word(s, id_matrix(i, j), 36);
            end 
        end
    end
    position_matrix = positions;
end

