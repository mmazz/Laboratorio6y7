function value = dxl_read_word(s, id, adress)
%	dxl_read_word Reads and returns word value at required adress 
%   of AX-12A of given id.

    packet_out = dxl_create_packet(id, 2, adress, 2);
    fwrite(s, packet_out);   
    packet_in = fread(s, 8);
    value = packet_in(6) + 256*packet_in(7);
end

