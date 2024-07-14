`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/13 16:07:00
// Design Name: 
// Module Name: adder2bit_tb
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


module adder2bit_tb(

    );
    reg  clk;
    reg     [1:0]       a;
    reg     [1:0]       b;
    wire    [1:0]       out;
    wire                Cout;

    adder2bit adder2bit_inst(
        .a(a),
        .b(b),
        .out(out),
        .Cout(Cout)

    );

    initial begin
        clk = 0;
        a = 2'b00;
        b = 2'b00;
        #5
        forever begin
            #5 clk = ~clk;
        end
    end

    always @(posedge clk) begin
        b <= b + 1;
        
    end

    initial begin
        # 40 a = 2'b01;
        # 40 a = 2'b10;
        # 40 a = 2'b11;

        # 50 $finish;
    end


endmodule
