`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2024/07/13 17:00:56
// Design Name:
// Module Name: adder3_10
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

module Halfadder_10 (
    input           [3:0]    a,
    input           [3:0]    b,
    output  reg     [3:0]   sum,
    output  reg             cout

  );

  always @(*)
  begin
    if (4'b1001 - a < b )
    begin
      cout = 1;
      sum = a + b - 4'b1001 - 4'b1;
    end

    else
    begin
      cout = 0;
      sum = a + b;
    end
  end
endmodule //Halfadder_10


module adder2 (
    input a,b,
    output s,c

  );

  assign  s = a ^ b;
  assign  c = a & b;


endmodule //adder2


module adder3_10(
    input           [11:0]      a,
    input           [11:0]      b,
    output    reg   [11:0]      sum,
    output    reg               cout

  );

  wire cin1,cin2,cin12,cin23,fake_cout,cout0;
  reg  [1:0]    realcin12;
  wire [3:0]    sum1,sum2,sum3;
  wire [3:0]    reg0,reg1,reg2;  


  Halfadder_10 ha1(
                 .a(a[3:0]),
                 .b(b[3:0]),
                 .sum(sum1),
                 .cout(cin1)
               );


  Halfadder_10 ha2(
                 .a(a[7:4]),
                 .b(b[7:4]),
                 .sum(reg1),
                 .cout(cin2)
               );

  Halfadder_10 ha3(
                 .a({3'b000,cin1}),
                 .b(reg1),
                 .sum(sum2),
                 .cout(cin12)
               );


always @(*) begin
    if ((cin12 == 1'b1) & (cin2 == 1'b1)) begin
        realcin12 <= 2'b01;
    end

    else begin
        realcin12 = {1'b0,cin12} + {1'b0,cin2};
    end
end

  Halfadder_10 ha4(
                 .a(a[11:8]),
                 .b(b[11:8]),
                 .sum(reg2),
                 .cout(fake_cout)
               );

  Halfadder_10 ha5(
                 .a({2'b00,realcin12}),
                 .b(reg2),
                 .sum(sum3),
                 .cout(cin23)
               );

  adder2 adder23(
           .a(cin23),
           .b(fake_cout),
           .s(cout0),
           .c()
         );


always @(*) begin
    sum = {sum3,sum2,sum1};
    cout = cout0;
end

endmodule
