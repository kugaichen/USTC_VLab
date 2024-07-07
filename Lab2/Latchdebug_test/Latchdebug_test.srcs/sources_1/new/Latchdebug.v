`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/07 14:13:11
// Design Name: 
// Module Name: Latchdebug
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


module Latchdebug(
    input           cpu_overhead,
    output reg      shut_off_computer,
    input           arrived,
    input           gas_tank_empty,
    output reg      keep_driving
    );

    always @(*) begin
        if (cpu_overhead) begin
            shut_off_computer = 1'b1;
        end

        else begin
            shut_off_computer = 1'b0;
        end
  
    end

    always @(*) begin
        if (~arrived) begin
            keep_driving = ~gas_tank_empty;
        end
        
        else begin
            keep_driving = 1'b0;
        end
            
    end
endmodule
