`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/10 10:13:02
// Design Name: 
// Module Name: 3edge_capture
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


module edge_capture(
    input       clk,
    input       rst,
    input       sig_in,
    output      pos_edge,
    output      neg_edge

    );

    reg sig_r1, sig_r2, sig_r3;
    always @(posedge clk) begin
        if(rst) begin
            sig_r1 <= 0;
            sig_r2 <= 0;
            sig_r3 <= 0;
        end
        
        else begin
            sig_r1 <= sig_in;
            sig_r2 <= sig_r1;
            sig_r3 <= sig_r2;
        end

    end

    assign pos_edge = (sig_r2 && ~sig_r3) ? 1 : 0;
    assign neg_edge = (~sig_r2 && sig_r3) ? 1 : 0;

endmodule
