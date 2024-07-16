`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/16 15:31:33
// Design Name: 
// Module Name: TIMER_tb
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


module TIMER_tb(

    );
    reg         clk,rst;
    wire [3:0]  out;
    wire [2:0]  select;

    TIMER TIMER_inst(
        .clk(clk),
        .rst(rst),
        .out(out),
        .select(select)
    );

    initial begin
        rst = 0;
        clk = 0;
        forever begin
            #5 clk = ~clk;
        end
    end

    initial begin
        #20 rst = 1;

        #7  rst = 0;
    end
endmodule
