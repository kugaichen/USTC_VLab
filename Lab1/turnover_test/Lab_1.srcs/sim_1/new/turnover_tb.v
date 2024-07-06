`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2024/07/05 16:22:39
// Design Name:
// Module Name: turnover_tb
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


module turnover_tb(

  );

  reg  [7:0] in;
  wire [7:0] out;

  top_moudle  top_moudle_inst (
                .in(in),
                .out(out)
              );

  initial
  begin
    in = 8'b01010101;

    #10 in = 8'b10101010;

    #10 $finish;
  end

endmodule

