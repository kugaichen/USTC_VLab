`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/08/19 19:54:23
// Design Name: 
// Module Name: adder_lookahead4_tb
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


module adder_lookahead4_tb(

    );

    reg     [31:0]  a,b;
    reg     [0:0]   ci;
    wire    [31:0]  s;
    wire    [0:0]   co;

    Adder Adder_inst(
        .a(a),
        .b(b),
        .ci(ci),
        .s(s),
        .co(co)
    );

    initial begin
        a=32'hffff; b=32'hffff; ci=1'b1;
        #10;
        a=32'h0f0f; b=32'hf0f0; ci=1'b1;
        #10;
        a=32'h1234; b=32'h4321; ci=1'b0;
    end


endmodule
