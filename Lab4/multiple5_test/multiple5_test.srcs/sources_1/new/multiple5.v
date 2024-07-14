`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/14 14:03:24
// Design Name: 
// Module Name: multiple5
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
module adder2bit(
    input       [1:0]       a,
    input       [1:0]       b,
    output reg  [1:0]       out,
    output reg              Cout         

    );

    reg cin1, cin2;
    always @(*) begin
        out[0] = a[0] ^ b[0];
        cin1 = a[0] & b[0];

        cin2 = a[1] ^ b[1];
        out[1] =  (cin2 & !cin1) || ((!cin2) & (cin1));
        Cout = ((a[1] & b[1]) || (cin2 & cin1));
    end
 

endmodule

module multiple5(  
    input           [7:0]      num,
    output reg                 ismultiple5

    );

    wire [1:0] num1,num2,num3,num4;
    assign num1 = num[1:0];
    assign num2 = num[3:2];
    assign num3 = num[5:4];
    assign num4 = num[7:6];

    wire [1:0] out1,out2;
    wire Cout1,Cout2;

    adder2bit adder1(
        .a(num1),
        .b(num3),
        .out(out1),
        .Cout(Cout1)
    );

    adder2bit adder2(
        .a(num2),
        .b(num4),
        .out(out2),
        .Cout(Cout2)
    );

    always @(*) begin
        if ({Cout1,out1} == {Cout2,out2}) begin
            ismultiple5 = 1;
        end

        else begin
            ismultiple5 = 0;
        end
    end

endmodule

module Top (
    input   [7:0]   sw,
    output  [1:0]   led
    
);

multiple5 multiple5_inst(
    .num(sw),
    .ismultiple5(led[0])
);

endmodule //Top