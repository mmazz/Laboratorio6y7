function value = dxl_read_byte(s, id, adress)
%	dxl_read_byte Reads and returns byte at required adress of AX-12A of
%	given id.

    packet_out = dxl_create_packet(id, 2, adress, 1);
    fwrite(s, packet_out);   
    packet_in = fread(s, 7);
    value = packet_in(6);
end

