`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/08 21:27:15
// Design Name: 
// Module Name: LED
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


module LED(
    input               clk,
    input               btn,
    output reg [7:0]    led

    );

    reg [31:0]  count_1hz;
    wire rst;
    parameter TIME_CNT = 50_000_000;  //硬件时钟频率是100MHZ，故1s内有100_000_000个时钟周期

    assign rst = btn;

    always @(posedge clk) begin
        if (rst) begin
            count_1hz <= 0;
        end

        else if (count_1hz >= TIME_CNT) begin
            count_1hz <= 0;
        end

        else
            count_1hz <= count_1hz + 32'b1; //每50_000_000个时钟周期，重置一次为0   
    end

    always @(posedge clk) begin
        if (rst) begin
            led <= 8'b0000_1111;
        end
        
        else if(count_1hz == 1) begin
            led <= {led[6:0], led[7]};
        end
    end
    

endmodule
