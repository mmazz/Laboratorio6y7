function [R] = r_matrix(yaw, pitch, roll)
    
    a = roll; %rotation around x axis
    b = pitch; %rotation around y axis
    c = yaw; %rotation around z axis

    R_a = [1,      0,       0;
           0, cos(a), -sin(a);
           0, sin(a),  cos(a)];
    
    R_b = [ cos(b), 0, sin(b);
                 0, 1,      0;
           -sin(b), 0, cos(b)];
    
    R_c = [cos(c), -sin(c), 0;
           sin(c),  cos(c), 0;
                0,       0, 1];
            
    R = R_a*R_b*R_c;
end