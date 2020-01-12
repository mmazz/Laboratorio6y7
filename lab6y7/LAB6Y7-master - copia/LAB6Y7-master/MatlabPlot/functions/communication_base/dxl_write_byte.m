function error = dxl_write_byte(s, id, adress, byte)
%   dxl_write_byte Writes a byte to required adress of AX-12A of given id.
%   It waits for status packet and returns the error value.

    packet_out = dxl_create_packet(id, 3, adress, byte);
    fwrite(s, packet_out);
    packet_in = zeros(6);
    if id ~= 254
        packet_in = fread(s, 6);
    end
    error = packet_in(5);
end

