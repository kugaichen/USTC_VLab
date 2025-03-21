`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/08/19 19:23:02
// Design Name: 
// Module Name: Adder_LookAhead4
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


module Adder_LookAhead4(
    input       [3:0]   a,b,
    input       [0:0]   ci,
    output      [3:0]   s,
    output      [0:0]   co

    );

    wire    [3:0]  C;
    wire    [3:0]  G;
    wire    [3:0]  P;

    assign G = a & b;
    assign P = a ^ b;

    assign  C[0] = G[0] | ( P[0] & ci );
    assign  C[1] = G[1] | ( P[1] & G[0] ) | ( P[1] & P[0] & ci );
    assign  C[2] = G[2] | ( P[2] & G[1] ) | ( P[2] & P[1] & G[0] ) | ( P[2] & P[1] & P[0] & ci );
    assign  C[3] = G[3] | ( P[3] & G[2] ) | ( P[3] & P[2] & G[1] ) | ( P[3] & P[2] & P[1] & G[0] ) | ( P[3] & P[2] & P[1] & P[0] & ci );

    assign s[0] = P[0] ^ ci;
    assign s[1] = P[1] ^ C[0];
    assign s[2] = P[2] ^ C[1];
    assign s[3] = P[3] ^ C[2];
    assign co = C[3];

endmodule

module Adder (
    input           [31:0]  a,b,
    input           [0:0]   ci,
    output          [31:0]  s,
    output          [0:0]   co    
    
);
wire [6:0] cmid;

Adder_LookAhead4 adder0(
    .a(a[3:0]),
    .b(b[3:0]),
    .ci(ci),
    .s(s[3:0]),
    .co(cmid[0])

);

Adder_LookAhead4 adder1(
    .a(a[7:4]),
    .b(b[7:4]),
    .ci(cmid[0]),
    .s(s[7:4]),
    .co(cmid[1])
);

Adder_LookAhead4 adder2(
    .a(a[11:8]),
    .b(b[11:8]),
    .ci(cmid[1]),
    .s(s[11:8]),
    .co(cmid[2])
);

Adder_LookAhead4 adder3(
    .a(a[15:12]),
    .b(b[15:12]),
    .ci(cmid[2]),
    .s(s[15:12]),
    .co(cmid[3])
);

Adder_LookAhead4 adder4(
    .a(a[19:16]),
    .b(b[19:16]),
    .ci(cmid[3]),
    .s(s[19:16]),
    .co(cmid[4])
);

Adder_LookAhead4 adder5(
    .a(a[23:20]),
    .b(b[23:20]),
    .ci(cmid[4]),
    .s(s[23:20]),
    .co(cmid[5])
);

Adder_LookAhead4 adder6(
    .a(a[27:24]),
    .b(b[27:24]),
    .ci(cmid[5]),
    .s(s[27:24]),
    .co(cmid[6])
);

Adder_LookAhead4 adder7(
    .a(a[31:28]),
    .b(b[31:28]),
    .ci(cmid[6]),
    .s(s[31:28]),
    .co(co)
);


endmodule //Adder
