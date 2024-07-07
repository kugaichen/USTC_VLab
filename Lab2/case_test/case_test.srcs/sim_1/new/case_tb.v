`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2024/07/07 15:42:38
// Design Name:
// Module Name: case_tb
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


module case_tb(

  );

//   Question: case_test
//   reg [15:0]      scancode;
//   wire            left;
//   wire            right;
//   wire            up;
//   wire            down;

//   case_test case_test_inst(
//               .scancode(scancode),
//               .left(left),
//               .right(right),
//               .up(up),
//               .down(down)
//             );

//   initial
//   begin
//     scancode = 16'h0;

//     #10
//      scancode = 16'he06b;

//     #10
//      scancode = 16'he072;

//     #10
//      scancode = 16'h1111;

//     #10
//      scancode = 16'h0101;

//     #10
//      scancode = 16'he074;

//     #10
//      scancode = 16'he075;

//     #10 $finish;
//   end

//  Question: wave_generation
  reg clk;
  reg       a;
  reg       b;
  reg [3:0] c; 
  
  `timescale 1ns/1ps
  initial begin
    clk = 1;
  end

  always begin
    #5
    clk = ~clk;
  end

  initial begin
    a = 1'b0;
    b = 1'b0;
    c = 4'b0;

    #10
    a = 1'b1;
    c = 4'd1;

    #10 
    b = 1'b1;

    #5 
    b = 1'b0;

    #5 
    c = 4'd2;

    #10
    a = 1'b0;
    b = 1'b1;

    #10 
    a = 1'b1;
    c = 4'd3;

    #20
    a = 1'b0;
    b = 1'b0;

    #5
    b = 1'b1;

    #5
    a = 1'b1;
    c = 4'd4;

    #10
    b = 1'b0;

    #20 $finish;

  end


endmodule
