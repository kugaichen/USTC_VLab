`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/09 21:53:32
// Design Name: 
// Module Name: Segment_tb
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


module Segment_tb(

    );
    reg         clk;
    reg         btn;
    wire [2:0]  seg_an;
    wire [3:0]  seg_data;

    Segment Segment_inst(
        .clk(clk),
        .rst(btn),
        .output_data(32'h22111234),
        .seg_data(seg_data),
        .seg_an(seg_an)
    );

    initial begin
        clk = 0;

        forever begin
            #5 clk = ~clk;
        end
    end

    initial begin
        btn = 1;
        #20 btn = 0;
    end

endmodule
