`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/14 15:52:04
// Design Name: 
// Module Name: multiple5_tb
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


module multiple5_tb(

    );
    reg     [7:0]   num;
    wire            ismultiple5;

    multiple5 multiple5_inst(
        .num(num),
        .ismultiple5(ismultiple5)
    );

    initial begin
        num = 8'b1010_0000;
        #10
        num = 8'b0101_1010;
        #10
        num = 8'b1111_1111;
        #10
        num = 8'b0000_0110;
        #10
        num = 8'b0110_0110;
        #10
        $finish;
    end
endmodule
