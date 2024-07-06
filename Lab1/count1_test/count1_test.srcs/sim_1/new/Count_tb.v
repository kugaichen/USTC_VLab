`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2024/07/06 11:54:26
// Design Name:
// Module Name: Count_tb
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


module Count_tb(

  );

  reg     [2:0] in;
  wire    [1:0] out;

  Count40nes Count40nes_inst(
               .in(in),
               .out(out)
             );

  initial
  begin
    in = 3'b0;
    #10
     in = 3'b1;
    #10
     in = 3'b101;
    #10
     in = 3'b110;
    #10
     in = 3'b111;

    #10 $finish;

  end


endmodule
