function degrees = to_degrees(matrix)
%	to_degrees Converts radian values from given matrix into degrees.

    for i = 1:size(matrix, 1)
        for j = 1:size(matrix,2)
            matrix(i, j) = 360*matrix(i,j)/2/pi;
        end
    end
    degrees = matrix;
end

