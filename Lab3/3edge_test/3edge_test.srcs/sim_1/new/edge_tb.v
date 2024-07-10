`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/10 10:43:51
// Design Name: 
// Module Name: edge_tb
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


module edge_tb(

    );
    reg clk;
    reg rst;
    reg sig_in;
    wire pos_edge;
    wire neg_edge;

    edge_capture edge_capture_inst(
        .clk(clk),
        .rst(rst),
        .sig_in(sig_in),
        .pos_edge(pos_edge),
        .neg_edge(neg_edge)
    );

    initial begin
        clk = 0;
        rst = 1;

        forever begin
            #5 clk = ~clk;
        end
    end

    initial begin
        #3 rst = 0;
    end

    initial begin
        sig_in = 0;

        #30 sig_in = 1;

        #20 sig_in = 0;

        #14.9 sig_in = 1;
        
        #1 sig_in = 0;

        // #23 sig_in = 0;
    end


endmodule
