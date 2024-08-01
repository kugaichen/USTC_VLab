`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/08/01 21:10:06
// Design Name: 
// Module Name: TrafficLight_tb
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


module TrafficLight_tb(

    );
    reg             clk;
    reg             rst;
    wire            is_red;
    wire            is_green;
    wire            is_yellow;

    TrafficLight TrafficLight_inst(
        .clk(clk),
        .rst(rst),
        .is_red(is_red),
        .is_green(is_green),
        .is_yellow(is_yellow)
    );

    initial begin
        rst = 1;
        clk = 0;
    end

    always begin
        # 5 clk = ~clk;
    end

    initial begin
        #10
        rst = 0;
    end
endmodule
