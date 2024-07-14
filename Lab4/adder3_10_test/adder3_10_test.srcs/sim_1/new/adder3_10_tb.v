`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/14 11:20:10
// Design Name: 
// Module Name: adder3_10_tb
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


module adder3_10_tb(

    );

    reg     [11:0]     a;
    reg     [11:0]     b;
    wire    [11:0]     sum;
    wire               cout;

    adder3_10 adder3_10_inst(
        .a(a),
        .b(b),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        a = 12'b1000_1001_1001;
        b = 12'b0000_0110_0111;

        #20
        a = 12'b1001_1001_1001;
        b = 12'b0000_0000_0001;

        #20
        a = 12'b1001_1001_1001;
        b = 12'b1001_1001_1001;

        #20 $finish;
    end
endmodule
