`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2024/07/06 10:46:21
// Design Name:
// Module Name: MAX3_tb
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


module MAX3_tb(

  );
  reg     [7:0] num1,num2,num3;
  wire    [7:0] max;

  MAX3 MAX3_inst(
         .num1(num1),
         .num2(num2),
         .num3(num3),
         .max(max)
       );

  initial
  begin
    num1 = 8'b0;
    num2 = 8'b0;
    num3 = 8'b0;

    #10
     num1 = 8'b1;
    num2 = 8'b11;
    num3 = 8'b111;

    #10
     num1 = 8'b11;
    num2 = 8'b1;
    num3 = 8'b1;

    #10
     num1 = 8'b1111;
    num2 = 8'b11111111;
    num3 = 8'b0011;

    #10
     num1 = 8'b01010101;
    num2 = 8'b01010101;
    num3 = 8'b01010101;

    #10 $finish;

  end
endmodule
