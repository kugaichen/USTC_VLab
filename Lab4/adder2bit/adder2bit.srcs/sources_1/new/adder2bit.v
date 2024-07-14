`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/13 15:28:49
// Design Name: 
// Module Name: adder2bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////




module adder2bit(
    input       [1:0]       a,
    input       [1:0]       b,
    output reg  [1:0]       out,
    output reg              Cout         

    );

    reg cin1, cin2;
    always @(*) begin
        out[0] = a[0] ^ b[0];
        cin1 = a[0] & b[0];

        cin2 = a[1] ^ b[1];
        out[1] =  (cin2 & !cin1) || ((!cin2) & (cin1));
        Cout = ((a[1] & b[1]) || (cin2 & cin1));
    end
 

endmodule

module Top (
    input       [3:0] sw,
    output      [7:0] led
    
);

adder2bit adder2bit_inst(
    .a(sw[3:2]),
    .b(sw[1:0]),
    .out(led[1:0]),
    .Cout(led[2])
);

endmodule //Top
