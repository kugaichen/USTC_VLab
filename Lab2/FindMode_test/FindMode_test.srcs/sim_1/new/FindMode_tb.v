`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/07 21:02:59
// Design Name: 
// Module Name: FindMode_tb
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


module FindMode_tb(

    );

    reg             clk;
    reg             rst;
    reg             next;
    reg  [7:0]      number;
    wire [7:0]      out;

    FindMode FindMode_inst(
        .clk(clk),
        .rst(rst),
        .next(next),
        .number(number),
        .out(out)
    );

    initial begin
        clk = 1'b1;
        rst = 1'b1;
        next = 0;
        #30 next = 1'b1;

        forever begin
            #10 next = ~next;
        end
         
    end

    always begin
        #5 clk = ~clk;
    end

   
    initial begin
        #20 rst = 1'b0;
        #10 number = 8'd10;
        #20 number = 8'd20;
        #20 number = 8'd30;
        #20 number = 8'd10;
        #40 number = 8'd20;
        #20 number = 8'd30;
        #60 number = 8'd10;

        #150 $finish;
    end



endmodule
