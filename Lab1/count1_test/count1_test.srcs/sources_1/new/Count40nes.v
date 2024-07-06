`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2024/07/06 11:43:38
// Design Name:
// Module Name: Count40nes
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


module Count40nes(
    input       [2:0] in,
    output reg  [1:0] out

  );

  always @(*)
  begin
    case(in)
      3'b000:
        out <= 2'd0;
      3'b001:
        out <= 2'd1;
      3'b010:
        out <= 2'd1;
      3'b100:
        out <= 2'd1;
      3'b101:
        out <= 2'd2;
      3'b011:
        out <= 2'd2;
      3'b110:
        out <= 2'd2;
      3'b111:
        out <= 2'd3;
    endcase
  end

endmodule
