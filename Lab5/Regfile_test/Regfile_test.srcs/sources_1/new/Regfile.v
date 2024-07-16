`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/16 13:13:55
// Design Name: 
// Module Name: Regfile
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


module Regfile(
    input                   clk,
    input       [4:0]       ra1,
    input       [4:0]       ra2,
    input       [4:0]       wa,
    input                   we,
    input       [31:0]      din,
    output reg  [31:0]      dout1,
    output reg  [31:0]      dout2 

    );

    reg [31:0] reg_file [31:0];


    always @(*) begin
        reg_file[0] = 32'b0;
        dout1 = reg_file[ra1];
        dout2 = reg_file[ra2];
    end

    always @(*) begin
        
        if(we) begin
            reg_file[wa] <= din;
        end
        
    end

endmodule
