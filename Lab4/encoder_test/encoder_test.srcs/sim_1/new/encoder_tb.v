`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/13 14:35:47
// Design Name: 
// Module Name: encoder_tb
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


module encoder_tb(

    );
    reg                 clk;
    reg     [3:0]       I;
    wire    [1:0]       Y;
    wire                en;
    
    encoder encoder_inst(
        .I(I),
        .Y(Y),
        .en(en)
    );

    initial begin
        clk = 0;
        forever begin
            #5 clk = ~clk;
        end
    end

    initial begin
        I = 4'b0000;

        #10 
        I = 4'b0001;

        #20
        I = 4'b1000;

        #20 
        I = 4'b0100;

        #20
        I = 4'b0010;
        
        #20 $finish;
    end


endmodule
