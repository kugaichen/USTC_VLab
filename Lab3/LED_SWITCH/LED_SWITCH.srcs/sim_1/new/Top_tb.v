`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/09 15:19:38
// Design Name: 
// Module Name: Top_tb
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


module Top_tb(

    );
    reg clk;
    reg     [7:0]   sw;
    wire    [7:0]   led;

    Top Top_inst(
        .sw(sw),
        .led(led)
    );

    initial begin
        sw = 8'b00000000;
        clk = 0;
        forever begin
            #10 clk=~clk;
        end
    end

    initial begin
        #10 sw = 8'b00000001;
        #10 sw = 8'b00000011;
        #10 sw = 8'b00000111;
        #10 sw = 8'b00001111;
        #10 sw = 8'b00011111;
        #10 sw = 8'b00111111;
        #10 sw = 8'b01111111;
        #10 sw = 8'b11111111;

        #10 $finish;
    end

endmodule
