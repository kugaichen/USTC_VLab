`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/07 16:44:05
// Design Name: 
// Module Name: q4_tb
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


module q4_tb(

    );
    reg clk, rst, en;
    wire out_TA;

    Counter #(
        .MIN_VALUE(8'd10),
        .MAX_VALUE(8'd13)
    ) 
    Counter_inst(
        .clk(clk),
        .rst(rst),
        .enable(en),
        .out(out_TA)
    );

    initial begin
        clk = 0;
    end

    always begin
        #5
        clk = ~clk;
    end



    initial begin
        rst = 1;
        en = 0;
        
        #10;
        rst = 0;

        #10;
        en = 1;

        #20; 
        en = 0;

        #20;
        en = 1;

        #20;
        rst = 1;

        #20;
        rst = 0;

        #200;
        en = 0;
        
        #20 $finish;
        
    end

endmodule
