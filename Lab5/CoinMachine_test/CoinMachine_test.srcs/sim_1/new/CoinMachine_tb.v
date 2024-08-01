`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/08/01 20:34:05
// Design Name: 
// Module Name: CoinMachine_tb
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


module CoinMachine_tb(

    );
    reg clk;
    reg rst;
    reg A;
    reg B;
    wire Y;
    wire Z;

    CoinMachine CoinMachine_inst(
        .clk(clk),
        .rst(rst),
        .A(A),
        .B(B),
        .Y(Y),
        .Z(Z)
    );

    initial begin
        rst = 1;
        clk = 0;
    end

    always begin
        # 5 clk = ~clk;
    end

    initial begin
        #10 rst = 0;

        A = 0;
        B = 0;

        #10
        A = 1;
        B = 0;

        #10 
        A = 0;
        B = 1;

        #10
        A = 1;
        B = 0;

        #10 
        A = 1;
        B = 0;

        #10
        A = 0;
        B = 1;

        #10
        $finish;
    end

    

endmodule
