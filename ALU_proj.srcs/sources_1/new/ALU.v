`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/08/21 15:16:12
// Design Name: 
// Module Name: ALU
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

module overlf (
    input           [31:0]  src0,src1,
    input           [0:0]   add_or_sub,     
    output          [31:0]  result,
    output          [0:0]   overflow
);
    wire            [31:0]  real_input;
    wire            [31:0]  signal_output;
    
    assign real_input = src1 ^ add_or_sub;

    Adder adder_inst_value(
        .a({0,src0[30:0]}),
        .b({0,real_input[30:0]}),
        .ci(add_or_sub),
        .s(result),
        .co()
    );

    Adder adder_inst_sig(
        .a({src0[31],{31{0}}}),
        .b({src1[31],{31{0}}}),
        .ci(add_or_sub),
        .s(signal_output),
        .co()
    );

    assign overflow = (src0 ^ real_input) && (real_input ^ signal_output[31]) ;


endmodule //ALU


module Comp (
    input           [31:0]  src0,src1,
    output          [0:0]   slt_out,
    output          [0:0]   sltu_out

);  
    wire [31:0] sub_out;

    Adder sub_inst(
        .a(src0),
        .b(~src1),
        .ci(1'b1),
        .s(sub_out),
        .co()
    );



endmodule //Comp




//module ALU
module ALU(
    input           [31:0]  src0,src1,
    input           [11:0]  sel,
    output          [31:0]  res

    );

    wire [31:0] adder_out;
    wire [31:0] sub_out;
    wire [0:0] slt_out;
    wire [0:0] sltu_out;
    
    Adder adder_inst(
        .a(src0),
        .b(src1),
        .ci(1'b0),
        .s(adder_out),
        .co()
    );

    Adder sub_inst(
        .a(src0),
        .b(~src1),
        .ci(1'b1),
        .s(sub_out),
        .co()
    );

    Comp comp_inst(
        .a(src0),
        .b(src1),
        .ul(sltu_out),
        .sl(slt_out)
    );
    
endmodule
