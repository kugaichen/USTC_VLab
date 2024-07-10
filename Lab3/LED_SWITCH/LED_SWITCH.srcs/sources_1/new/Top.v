`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/09 15:14:45
// Design Name: 
// Module Name: Top
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


module Top(
    input   [7:0]   sw,
    output  [7:0]   led

    );

    assign led[7] = sw[0];
    assign led[6] = sw[1];
    assign led[5] = sw[2];
    assign led[4] = sw[3];
    assign led[3] = sw[4];
    assign led[2] = sw[5];
    assign led[1] = sw[6];
    assign led[0] = sw[7];
endmodule
