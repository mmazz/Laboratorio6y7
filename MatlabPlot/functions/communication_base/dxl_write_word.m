function error = dxl_write_word(s, id, adress, word)
%   dxl_write_word Writes a word value to required adress of AX-12A 
%   of given id. It waits for status packet and returns the error value.

    byte_L = mod(word, 256);
    byte_H = bitshift(word, -8);
    packet_out = dxl_create_packet(id, 3, adress, byte_L, byte_H);
    fwrite(s, packet_out);
    packet_in = zeros(6);
    if id ~= 254
        packet_in = fread(s, 6);
    end
    error = packet_in(5);
end

