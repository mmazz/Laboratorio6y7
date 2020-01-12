function [] = dxl_write_byte_sync(s, adress, bytes_matrix)
%   dxl_write_byte_sync Writes byte from bytes_matrix to given adress 
%   of appropriate servo (defined in get_id_matrix.m).
    
    id_matrix = get_id_matrix();
    length = 44; 
    packet = uint16(zeros(length, 1));
    packet(1) = 255;
    packet(2) = 255;
    packet(3) = 254;
    packet(4) = length-4;
    packet(5) = 131;
    packet(6) = adress;
    packet(7) = 1;
    
    for i = 1:6
        for j = 1:3
            packet(7 + 2*((j-1)*6+i) - 1) = id_matrix(i, j);
            packet(7 + 2*((j-1)*6+i) - 0) = bytes_matrix(i, j);
        end
    end
    
    checksum = 0;
    for i = 3:length
       checksum = checksum + packet(i); 
    end
    checksum = mod(bitcmp(checksum), 256);   
    packet(length) = checksum;
    packet = uint8(packet);
    
    fwrite(s, packet);
end