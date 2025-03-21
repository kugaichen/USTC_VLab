`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2024/08/21 16:52:41
// Design Name:
// Module Name: overlf_tb
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


module overlf_tb(

  );

  reg        [31:0]  src0,src1;
  reg        [0:0]   add_or_sub;
  wire         [31:0]  result;
  wire         [0:0]  overflow;

  overlf overlf_inst(
           .src0(src0),
           .src1(src1),
           .result(result),
           .overflow(overflow)
         );

  initial
  begin
    src0 = 32'b01111111111111111111111111111111;
    src1 = 32'b00000000000000000000000000000001;
    add_or_sub = 1'b0;

    #20
    src0 = 32'b10000000000000000000000000000000;
    src1 = 32'b00000000000000000000000000000001;
    add_or_sub = 1'b0;

    #20
     $finish;
  end
endmodule
