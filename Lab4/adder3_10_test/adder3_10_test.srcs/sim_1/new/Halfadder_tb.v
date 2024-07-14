`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2024/07/13 17:35:30
// Design Name:
// Module Name: Halfadder_tb
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


module Halfadder_tb(

  );
  reg clk;
  reg     [3:0]   a;
  reg     [3:0]   b;
  wire    [3:0]   sum;
  wire            cout;

  Halfadder_10 Halfadder_10_inst(
              .a(a),
              .b(b),
              .sum(sum),
              .cout(cout)
            );


  initial
  begin
    clk = 0;
    a = 4'b0000;
    b = 4'b0000;

    forever
    begin
      #5 clk = ~clk;
    end
  end

  initial
  begin

    #10
     a = 4'b0011;
    b = 4'b1000;

    #10
     a = 4'b0000;
    b = 4'b0001;

    #10
     a = 4'b0010;
    b = 4'b0111;

    #10 $finish;
  end


endmodule
