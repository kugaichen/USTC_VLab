`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2024/07/07 15:17:49
// Design Name:
// Module Name: case_test
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


module case_test(
    input       [15:0]      scancode,
    output reg              left,
    output reg              down,
    output reg              right,
    output reg              up
  );

  always @(*)
  begin
    up = 1'b0;
    down = 1'b0;
    right = 1'b0;
    left = 1'b0;

    case (scancode)
      16'he06b:
        left = 1'b1;
      16'he072:
        down = 1'b1;
      16'he074:
        right = 1'b1;
      16'he075:
        up = 1'b1;
    endcase
  end
endmodule
