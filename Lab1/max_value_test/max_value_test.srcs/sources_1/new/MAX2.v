`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2024/07/05 16:44:35
// Design Name:
// Module Name: MAX2
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


module MAX2 (
    input   [7:0]            num1, num2,
    output  [7:0]            max
  );

  assign max = (num1 > num2) ? num1 : num2 ;

endmodule

// Q2 直接编写MAX3
// module MAX3 (
//     input      [7:0]           num1,num2,num3,
//     output reg [7:0]           max
//   );

//   always @(*)
//   begin
//     if ( (num1 >= num2) & (num1 >= num3))
//     begin
//       max = num1;
//     end

//     else if ( (num2 >= num1 ) & (num2 >= num3))
//     begin
//       max = num2;
//     end

//     else if ( (num3 >= num1) & (num3 >= num2))
//     begin
//       max = num3;
//     end

//   end

// endmodule //MAX3


// Q3 通过实例化MAX2来实现MAX3
module MAX3 (
    input    [7:0] num1,num2,num3,
    output   [7:0] max

  );

  wire [7:0] max12;
  wire [7:0] max123;

  MAX2 MAX2_inst(
         .num1(num1),
         .num2(num2),
         .max(max12)

       );

  assign max123 = (max12 >= num3) ? max12 : num3;

  assign max = max123;


endmodule //MAX3
