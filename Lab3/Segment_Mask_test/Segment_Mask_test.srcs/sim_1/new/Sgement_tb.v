`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/10 15:22:00
// Design Name: 
// Module Name: Sgement_tb
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


module Sgement_tb(

    );

    reg         clk;
    reg         btn;
    reg [7:0]   sw;
    wire [2:0]  seg_an;
    wire [3:0]  seg_data;

    Segment Segment_inst(
        .clk(clk),
        .rst(btn),
        .output_data(32'h22111234),
        .seg_data(seg_data),
        .seg_an(seg_an),
        .output_valid(sw[7:0]) 
    );

    initial begin
        clk = 0;
        sw[7:0] = 8'b11111111;
        forever begin
            #5 clk = ~clk;
        end
    end

    initial begin
        btn = 1;
        #20 btn = 0;

        sw[7:0] = 8'b00000000;

        #20
        sw[7:0] = 8'b01010101;

        #20 
        sw[7:0] = 8'b11110000;

        #20
        sw[7:0] = 8'b11000011;
    end
endmodule
