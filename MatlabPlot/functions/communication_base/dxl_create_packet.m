function packet = dxl_create_packet(varargin)
%   dxl_create_packet  Creates packet to control Dynamixel AX-12A servos.
%   First argument is id number of required servo, second is intented 
%   instruction (1 PING, 2 READ DATA, 3 WRITE DATA, 4 REG WRITE, 5 ACTION, 
%   6 RESET, 131 SYNC WRITE). Third argument can be  given to specify 
%   address to write/read. If the adress is to be written, one (or two) 
%   more argument(s) should be given to specify value to which the adress 
%   is to be set. If the adress is to be read, one more parameter should
%   be given to specify length (number of bytes) to be read starting 
%   at given adress.
    
    length = nargin+4;
    array = uint16(zeros(length, 1));
    array(1) = 255;
    array(2) = 255;
    array(3) = varargin{1};
    array(4) = nargin;
    checksum = array(3) + array(4);
    for index = 2 : nargin
       array(index+3) = varargin{index};
       checksum = checksum + varargin{index};
    end
    checksum = mod(bitcmp(checksum), 256);   
    array(length) = checksum;
    packet = uint8(array);
end