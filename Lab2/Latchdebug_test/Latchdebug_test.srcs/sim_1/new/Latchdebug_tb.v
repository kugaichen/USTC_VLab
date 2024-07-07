`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/07 14:19:39
// Design Name: 
// Module Name: Latchdebug_tb
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


module Latchdebug_tb(

    );
    reg cpu_overhead, arrived, gas_tank_empty;
    wire shut_off_computer, keep_driving;

    Latchdebug Latchdebug_inst(
        .cpu_overhead(cpu_overhead),
        .arrived(arrived),
        .gas_tank_empty(gas_tank_empty),
        .shut_off_computer(shut_off_computer),
        .keep_driving(keep_driving)
    );

    initial begin
        cpu_overhead = 1'b0;
        arrived = 1'b0;
        gas_tank_empty = 1'b0;

        #10
        cpu_overhead = 1'b1;
        arrived = 1'b0;
        gas_tank_empty =1'b0;

        #10
        cpu_overhead = 1'b0;
        arrived = 1'b1;
        gas_tank_empty =1'b0;

        #10
        cpu_overhead = 1'b0;
        arrived = 1'b1;
        gas_tank_empty =1'b1;

        #10 $finish;
    end


endmodule
