`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2024/07/06 10:28:39
// Design Name:
// Module Name: MAX2_tb
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


module MAX2_tb(

  );
  reg     [7:0] num1,num2,num3;
  wire    [7:0] max1,max2;

  MAX2  MAX2_inst (
          .num1(num1),
          .num2(num2),
          .max(max1)
        );

  MAX3 MAX3_inst(
         .num1(num1),
         .num2(num2),
         .num3(num3),
         .max(max2)
       );


  initial
  begin
    num1 = 8'b00001111;
    num2 = 8'b00000000;
    num3 = 8'b11110000;

    #10
    num1 = 8'b00000011;
    num2 = 8'b11110000;
    num3 = 8'b0;

    #10
    num1 = 8'b11111111;
    num2 = 8'b11111111;
    num3 = 8'b0;

    #10
    num1 = 8'b1;
    num2 = 8'b11;
    num3 = 8'b1111;

    #10
    num1 = 8'b1111;
    num2 = 8'b1;
    num3 = 8'b0101;

    #10 $finish;
  end



endmodule


