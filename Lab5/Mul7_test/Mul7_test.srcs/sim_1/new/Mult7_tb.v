`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/22 13:44:22
// Design Name: 
// Module Name: Mult7_tb
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


module Mult7_tb(

    );

    reg clk;
    reg rst;
    reg [31:0]  src;
    reg src_valid;
    wire ready;
    wire res;
    wire res_valid;

    Mult7 Mult7_inst(
        .clk(clk),
        .rst(rst),
        .src(src),
        .src_valid(src_valid),
        .ready(ready),
        .res(res),
        .res_valid(res_valid)
    );

    initial begin
        clk = 0;
        rst = 0;
        src = 0;
        src_valid = 0;

        #5 rst = 1;
        #5 rst = 0;

        #10 src = 32'd14;
        src_valid = 1;

        #10 src_valid = 0;

        #320 src = 32'd70; 
        src_valid = 1;
        
        // #10 src_valid = 0;

        #320 src = 32'd74; 
        // src_valid = 1;
        
        #10 src_valid = 0;

        #320 src = 32'd280; 
        src_valid = 1;
        
        #20 src_valid = 0;

        #20 $finish;
    end

    always begin
        #5 clk = ~clk;
    end
endmodule
