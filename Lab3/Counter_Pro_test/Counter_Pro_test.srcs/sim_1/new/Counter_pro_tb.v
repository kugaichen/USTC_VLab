`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/09 16:34:44
// Design Name: 
// Module Name: Counter_pro_tb
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


module Counter_pro_tb(

    );
    reg             clk;
    reg             rst;
    wire [7:0]      led;

    Counter_pro Counter_pro_inst(
        .clk(clk),
        // .rst(rst),
        .led(led)
    );

    initial begin
        clk = 0;

        forever begin
            #5 clk = ~clk;
        end
    end

    initial begin
        rst = 1;
        #20 rst = 0;
    end

endmodule
